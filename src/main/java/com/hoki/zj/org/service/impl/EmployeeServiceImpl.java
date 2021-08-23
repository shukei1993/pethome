package com.hoki.zj.org.service.impl;

import com.hoki.zj.basic.service.impl.BaseServiceImpl;
import com.hoki.zj.login.domain.LoginInfo;
import com.hoki.zj.login.mapper.LoginInfoMapper;
import com.hoki.zj.org.domain.Employee;
import com.hoki.zj.org.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

@Service
public class EmployeeServiceImpl extends BaseServiceImpl<Employee> implements IEmployeeService {

    /** 注解注入LoginInfoMapper对象 */
    @Autowired
    private LoginInfoMapper loginInfoMapper;

    /** 注解注入RedisTemplate对象 */
    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * 1.审核通过修改用户状态
     * @param id   admin_id
     */
    @Override
    @Transactional
    public void changeStateByEmpId(Long id) {
        // 根据id查询employee对象
        Employee employee = super.findOne(id);
        System.out.println(employee);
        // 设置状态为1,修改到数据库
        employee.setState(1);
        System.out.println(employee);
        super.update(employee);
        // 根据id查询LoginInfo对象
        LoginInfo loginInfo = loginInfoMapper.loadByUidOfEmp(id);
        // 设置状态为1,修改到数据库
        loginInfo.setDisable(1);
        // 设置uid为id参数
        loginInfo.setUid(id);
        loginInfoMapper.update(loginInfo);
    }

    /**
     * 2.后台用户登录
     * @param map
     */
    @Override
    public Map<String, Object> login(Map<String, String> map) {
        // 1.判断用户是否存在
        String username = map.get("username"); // 获取前端传来的用户名
        String password = map.get("password"); // 获取前端传来的密码
        LoginInfo loginInfo = loginInfoMapper.loadByUserNameOfEmp(username);// 根据用户名查询LoginInfo对象
        if (loginInfo == null) { // 用户不存在
            throw  new RuntimeException("用户名或密码错误");
        }
        // 2.判断密码是否正确
        if (!password.equals(loginInfo.getPassword())) { // 密码错误
            throw  new RuntimeException("用户名或密码错误");
        }
        // 3.用户名和密码都正确,需要生成一个token作为key,将loginInfo作为value保存到Redis中,过期时间30分钟
        String token = UUID.randomUUID().toString();
        redisTemplate.opsForValue().set(token, loginInfo, 30, TimeUnit.MINUTES);
        // 4.将token和loginInfo放到map中返回
        Map<String, Object> returnMap = new HashMap<>();
        returnMap.put("token", token);
        // 情况loginInfo的密码
        loginInfo.setPassword("");
        returnMap.put("loginInfo", loginInfo);
        return returnMap;
    }


}
