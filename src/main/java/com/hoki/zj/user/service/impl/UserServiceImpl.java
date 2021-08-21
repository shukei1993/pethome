package com.hoki.zj.user.service.impl;

import com.hoki.zj.basic.service.impl.BaseServiceImpl;
import com.hoki.zj.constant.CodeTypeConst;
import com.hoki.zj.login.domain.LoginInfo;
import com.hoki.zj.login.mapper.LoginInfoMapper;
import com.hoki.zj.user.domain.User;
import com.hoki.zj.user.domain.dto.UserDTO;
import com.hoki.zj.user.mapper.UserMapper;
import com.hoki.zj.user.service.IUserService;
import com.hoki.zj.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sun.rmi.runtime.Log;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * 用户业务类:UserServiceImpl
 */
@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements IUserService {

    /** 注解注入创建UserMapper对象 */
    @Autowired
    private UserMapper userMapper;

    /** 注解注入创建RedisTemplate核心对象 */
    @Autowired
    private RedisTemplate redisTemplate;

    /** 注解注入创建LoginMapper对象 */
    @Autowired
    private LoginInfoMapper loginInfoMapper;

    /** 根据电话查询User对象 */
    @Override
    public User loadByPhone(String phone) {
        return userMapper.loadByPhone(phone);
    }

    /**
     * 1.前端前台用户手机注册
     * @param userDTO 临时对象,封装了前端注册传过来的参数phone,code,password,confirmPassword
     */
    @Override
    @Transactional
    public void register(UserDTO userDTO) {
        // 1.校验验证码是否合法
        String phone = userDTO.getPhone(); // 获取phone
        String key = CodeTypeConst.REGISTER_CODE + ":" + phone;
        String codeAndTimeInRedis = (String) redisTemplate.opsForValue().get(key); // 获取当前手机号对应的redis中的值
        String codeInRedis = codeAndTimeInRedis.split(":")[0]; // 截取出code
        System.out.println(codeInRedis);
        System.out.println(userDTO.getCode());
        // 判断是否合法
        if (!userDTO.getCode().equals(codeInRedis)) {
            throw new RuntimeException("验证码错误!");
        }
        // 2.userDTO中的密码加密加盐
        String byMd5 = MD5Utils.encrypByMd5(userDTO.getPassword()); // 加密
        String salt = UUID.randomUUID().toString(); // 加盐
        userDTO.setPassword(byMd5 + salt);
        // 3.将userDTO中的数据(phone,password)转换从user对象,并保存到对应的数据库
        User user = userDTO2User(userDTO, salt);
        super.save(user);
        // 4.将user的数据转换成LoginInFo对象,并保存到对应的数据库,登录的时候是找logininfo的数据
        LoginInfo loginInfo = user2LoginInfo(user, salt);
        loginInfoMapper.save(loginInfo);
    }

    /** 转换为User对象 */
    private User userDTO2User(UserDTO userDTO, String salt) {
        User user = new User();
        user.setPhone(userDTO.getPhone()); // 设置phone
        user.setSalt(salt); // 设置盐值
        user.setPassword(userDTO.getPassword()); // 设置密码(已经加密加盐完毕)
        user.setState(1); // 状态设置为启用
        user.setCreatetime(new Date()); // 注册时间设置为当前时间
        return user;
    }
    /** 转换为LoginInfo对象 */
    private LoginInfo user2LoginInfo(User user, String salt) {
        LoginInfo loginInfo = new LoginInfo();
        loginInfo.setPhone(user.getPhone()); // 设置phone
        loginInfo.setPassword(user.getPassword()); // 设置密码(已经加密加盐完毕)
        loginInfo.setType(1); // 设置type为前台用户
        loginInfo.setDisable(1); // 设置状态为启用
        loginInfo.setSalt(salt); // 设置盐值
        loginInfo.setUid(user.getId()); // 设置用户id,保存user后返回的id
        return loginInfo;
    }

    /**
     * 2.前端前台用户登录
     * @param user username: phone or email or username   password
     *  登录一律查询loginInfo信息
     */
    @Override
    public Map<String, Object> login(User user) {
        // 1.判断用户是否存在(用户名,邮箱,手机)
        LoginInfo loginInfo = loginInfoMapper.loadByUserNameOrEmailOrPhone(user);
        if (loginInfo == null) {
            // 用户不存在
            throw new RuntimeException("用户或密码错误");
        }
        // 2.判断密码是否正确
        String salt = loginInfo.getSalt(); // 获取盐值
        String byMd5BySalt = MD5Utils.encrypByMd5(user.getPassword()) + salt; // 获取当前输入的密码加密加盐后的值

        if (!byMd5BySalt.equals(loginInfo.getPassword())) {
            // 密码错误
            throw new RuntimeException("用户或密码错误");
        }
        /*
            3.用户名和密码都正确,需要提供将用户信息保存到redis中,
            并且提供一个密钥,也保存到redis中
            最后将其返回给前端(做登录拦截,和用户信息绑定)
         */
        String token = UUID.randomUUID().toString(); // 生成一个密钥token
        // 将token作为key值,loginfo作为value值,保存到redis中,设置有效期为30分钟
        redisTemplate.opsForValue().set(token, loginInfo, 30, TimeUnit.MINUTES);
        // 为了安全,将loginInfo中的盐值和密码清空
        loginInfo.setSalt("");
        loginInfo.setPassword("");
        // 将密钥和登录信息装到一个map中返回
        Map<String, Object> map = new HashMap<>();
        map.put("loginInfo", loginInfo);
        map.put("token", token);
        return map;
    }

}
