package com.hoki.zj.basic.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.concurrent.TimeUnit;

@Component // 将当前登录拦截其配置类交给spring管理
public class LoginInterceptor implements HandlerInterceptor {

    /** 注解注入创建RedisTemplate对象 */
    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * 1.登录拦截器
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 1.获取请求头中的TOKEN
        String token = request.getHeader("TOKEN");
        // 2.根据token查询redis中是否有值
        Object o = redisTemplate.opsForValue().get(token);
        if (o != null) { // redis中有值
            // 刷新过期时间
            redisTemplate.opsForValue().set(token, o, 30, TimeUnit.MINUTES);
            return true; // 放行
        }
        // 3.没有值,响应对象设置字符集和返回数据格式json
        response.setContentType("application/json;charset=utf-8");
        // 4.获取缓冲字符输出流
        PrintWriter writer = response.getWriter();
        // 5.写出一个json格式字符串提示: {"success": false, "message": "noAuth"},提示错误信息
        writer.println("{\"success\": false, \"message\": \"noAuth\"}");
        // 6.关流
        writer.close();
        // 7.拦截
        return false;
    }
}
