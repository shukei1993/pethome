package com.hoki.zj.basic.service.impl;

import com.hoki.zj.basic.service.ICodeService;
import com.hoki.zj.constant.CodeTypeConst;
import com.hoki.zj.user.mapper.UserMapper;
import com.hoki.zj.utils.StrUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.concurrent.TimeUnit;

@Service
public class CodeService implements ICodeService {

    /** 注解注入创建RedisTemplate核心对象 */
    @Autowired
    private RedisTemplate redisTemplate;

    /** 注解注入创建IUserService对象 */
    @Autowired
    private UserMapper userMapper;

    /**
     * 1.手机注册,验证码发送
     * @param map phone codeType
     * 分析发送步骤
     *       1.生成一个验证码
     *       2.保存到redis中,客户拿到验证码输入后判断验证码是否正确
     *       3.使用第三方短信接口发送验证码
     * 附加功能分析
     *       1.手机号是否已注册
     *       2.刷新页面输入同一个手机号,再次获取验证码提示信息:强撸灰飞烟灭,请休息一下
     *       3.验证码过期时间
     */
    public void sendVerifyCode(Map<String, String> map) {
        // 1.调用工具类生成一个6位的验证码
        String verifyCode = StrUtils.getRandomString(6);
        // 2.获取当前时间的时间戳
        long time = System.currentTimeMillis();
        // 3.取出map中key为phone的值
        String phoneNum = map.get("phone");
        // 4.取出map中key为codeType的值
        String codeType = map.get("codeType");
        // 5.组装key
        String key = codeType + ":" + phoneNum;
        // 6.非第三方普通注册的情况
        if (CodeTypeConst.REGISTER_CODE.equals(codeType)) {
            // 判断手机号是否已经注册
            if (userMapper.loadByPhone(phoneNum) != null) {
                // 已经注册提示信息
                throw new RuntimeException("用户已注册,请直接登录!");
            }
        }
        // 7.判断是已经过期
        String codeAndTime = (String) redisTemplate.opsForValue().get(key); // 取出redis中key对应的值
        if (codeAndTime != null) { // 未过期
            // 截取其中的时间戳
            Long timeInRedis = Long.valueOf(codeAndTime.split(":")[1]);
            if (time - timeInRedis < 60 * 1000) {
                // 在一分钟内频繁操作,提示强撸灰飞烟灭,请休息一下
                throw new RuntimeException("强撸灰飞烟灭,请休息一下");
            } else {
                // 重新赋值code
                verifyCode = codeAndTime.split(":")[0];
            }
        }

        /*
            8.  验证码未过期,将redis中保存的验证码重新赋值然后发送,
                已过期,或者首次注册直接发送新的验证码
                ,使用redisTemplate对象操作redis,
                将phoneNum作为key,verifyCode加上: 和time拼接后,作为value保存到redis中
                设置过期时间为5分钟
         */
        redisTemplate.opsForValue().set(key, verifyCode + ":" + time, 5, TimeUnit.MINUTES);
        // 第三方接口发送短信
//        MSGSenderTool.sendMsg(
//                phoneNum, "欢迎您注册宠物之家,您的验证码为:" + "\r\n"
//                        + verifyCode + "\r\n"
//                        + "请在5分钟内使用");

        System.out.println("欢迎您注册宠物之家,您的验证码为:" + "\r\n"
                + verifyCode + "\r\n"
                + "请在5分钟内使用");
    }
}
