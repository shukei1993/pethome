package com.hoki.zj.basic.service.impl;

import com.hoki.zj.utils.MSGSenderTool;
import com.hoki.zj.utils.StrUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Service
public class CodeService {

    /** 注解注入创建RedisTemplate核心对象 */
    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * 1.手机注册,验证码发送
     * @param map phone codeType
     * 分析发送步骤
     *       1.生成一个验证码
     *       2.保存到redis中,客户拿到验证码输入后判断验证码是否正确
     *       3.使用第三方短信接口发送验证码
     * 附加功能分析
     *       1.刷新页面输入同一个手机号,再次获取验证码提示信息:强撸灰飞烟灭,请休息一下
     *       2.验证码过期时间
     */
    public void sendVerifyCode(Map<String, String> map) {
        // 1.调用工具类生成一个6位的验证码
        String verifyCode = StrUtils.getRandomString(6);
        // 2.取出map中key为phone的值
        String phoneNum = map.get("phone"); //
        /*
            3.使用redisTemplate对象操作redis,
                将phoneNum作为key,verifyCode作为value保存到redis中
                设置过期时间为5分钟
         */
        redisTemplate.opsForValue().set(phoneNum, verifyCode, 5, TimeUnit.MINUTES);
        // 4.第三方接口发送短信
        MSGSenderTool.sendMsg(
                phoneNum, "欢迎您注册宠物之家,您的验证码为:" + "\r\n"
                        + verifyCode + "\r\n"
                        + "请在5分钟内使用");
    }
}
