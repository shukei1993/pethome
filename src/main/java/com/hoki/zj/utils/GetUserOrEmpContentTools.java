package com.hoki.zj.utils;

import com.hoki.zj.login.domain.LoginInfo;
import com.hoki.zj.org.service.IEmployeeService;
import com.hoki.zj.user.service.IUserService;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.http.HttpServletRequest;

public class GetUserOrEmpContentTools {

    public static Object GetCurrentConsumer(HttpServletRequest request) {
        // 1.通过请求对象获取当前请求头中的TOKEN
        String token = request.getHeader("TOKEN");
        System.out.println(token);
        // 2.获取Spring容器对象
        WebApplicationContext webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
        // 3.通过容器对象获取Spring管理的对象
        RedisTemplate redisTemplate = webApplicationContext.getBean("redisTemplate", RedisTemplate.class); // 获取RedisTemplate核心对象
        // 4.通过token查询Redis中对应的LoginInfo对象
        LoginInfo loginInfo = (LoginInfo) redisTemplate.opsForValue().get(token);
        // 5.判断loginInfo的类型
        if (loginInfo.getType() == 1) { // 前台用户
            // 容器对象获取IUserService对象
            IUserService userService = webApplicationContext.getBean(IUserService.class);
            // 根据uid查询对应的User对象并且返回
            return userService.findOne(loginInfo.getUid());
        } else { // 后台管理用户
            // 容器对象获取IEmployeeService对象
            IEmployeeService employeeService = webApplicationContext.getBean(IEmployeeService.class);
            // 根据uid查询对应的Employee对象并且返回
            return employeeService.findOne(loginInfo.getUid());
        }

    }
}
