package com.hoki.zj.config;

import com.hoki.zj.basic.interceptor.LoginInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 拦截器配置类:MyInterceptorConfig
 */
//@Configuration
public class MyInterceptorConfig implements WebMvcConfigurer {

    /** 注解注入创建LoginInterceptor对象 */
    @Autowired
    private LoginInterceptor loginInterceptor;

    /**
     * 注册拦截器
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(loginInterceptor)
                .addPathPatterns("/**") // 拦截所有请求
                .excludePathPatterns("/user/login") // 放行登陆
                .excludePathPatterns("/emp/login") // 放行登陆
                .excludePathPatterns("/code/sendCode") // 放行验证码发送
                .excludePathPatterns("/user/register") // 放行注册
                .excludePathPatterns("/wechat/**") // 放行所有微信请求
                .excludePathPatterns("/fastDfs/**"); // 放行所有fastDfs请求
    }
}
