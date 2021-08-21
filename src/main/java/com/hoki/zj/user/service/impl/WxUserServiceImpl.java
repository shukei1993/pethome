package com.hoki.zj.user.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hoki.zj.basic.service.impl.BaseServiceImpl;
import com.hoki.zj.constant.CodeTypeConst;
import com.hoki.zj.constant.WeChatConst;
import com.hoki.zj.login.domain.LoginInfo;
import com.hoki.zj.login.mapper.LoginInfoMapper;
import com.hoki.zj.user.domain.User;
import com.hoki.zj.user.domain.WxUser;
import com.hoki.zj.user.mapper.UserMapper;
import com.hoki.zj.user.mapper.WxUserMapper;
import com.hoki.zj.user.service.IWxUserService;
import com.hoki.zj.utils.HttpUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

@Service
public class WxUserServiceImpl extends BaseServiceImpl<WxUser> implements IWxUserService {

    /** 注解注入WxUserMapper对象 */
    @Autowired
    private WxUserMapper wxUserMapper;

    /** 注解注入UserMapper对象 */
    @Autowired
    private UserMapper userMapper;

    /** 注入RedisTemplate对象*/
    @Autowired
    private RedisTemplate redisTemplate;

    /** 注入LoginInfo对象 */
    @Autowired
    private LoginInfoMapper loginInfoMapper;

    /**
     * 1.第三方微信登录
     *
     * @param map
     */
    @Override
    public Map<String, Object> login(Map<String, String> map) {
        // 1.获取code
        String code = map.get("code");
        // 2.通过code获取access_token
        String url = WeChatConst.GET_ACCESS_TOKEN.replace("APPID", WeChatConst.APPID)
                .replace("SECRET", WeChatConst.SECRET)
                .replace("CODE", code);
        String wechatResult = HttpUtil.sendGet(url);
        /*
            {
                "access_token":"48_kDAT5ZJhNQHrlA32ZYuHmRqYfOJqbeHaw324C5Zq3hJQdqTXiSyOddmoQUlALf10mHAGMqP8RPBZdzoaa1mPqgdpOlKJjFSIllhOyzIV55Y",
                "expires_in":7200,
                "refresh_token":"48_MgIlCFc9RXTikIBq5cavdZK_Ut_Rfm1YrS8t0CYaVUUpNfJfZEZwTQWpgjJr7EN1EJ4alRwWznGEQuHycWafTMLIVMlssg8-snvcydFc5D4",
                "openid":"oa9wA06iI3ogS8wXX-gMdDeMJkaA",
                "scope":"snsapi_login",
                "unionid":"ovnCWw2TPSgwKKiUqyd4GPf73TCM"
            }
         */
        JSONObject jObj = JSON.parseObject(wechatResult); // 转换成一个对象
        String access_token = jObj.getString("access_token"); // 获取access_token
        String openid = jObj.getString("openid"); // 获取openid
        // 3.根据openid查询对应的微信用户
        WxUser wxUser = wxUserMapper.loadByOpenid(openid);
        if (wxUser != null && wxUser.getUser() != null) { // 老用户
            LoginInfo loginInfo = loginInfoMapper.loadByUid(wxUser.getUser().getId()); // 通过uid获取logInfo对象
            // 免密登录
            return thirdPartyLogin(loginInfo);
        } else { // 新用户,需要跳转到绑定页面
            Map<String, Object> returnMap = new HashMap<>();
            returnMap.put("urlMap", "/bindwechart.html?access_token=" + access_token + "&openid=" + openid);
            return returnMap;
        }
    }

    /**
     * 2.第三方微信登录绑定
     *
     * @param map  phone: "", code: "",codeType: "",openid: "",access_token: '
     */
    @Override
    public Map<String, Object> bind(Map<String, String> map) {
        // 1.校验验证码是否正确
        String phone = map.get("phone"); // 获取phone
        String code = map.get("code"); // 获取验证码
        String openid = map.get("openid"); // 获取openid
        String access_token = map.get("access_token"); // 获取access_token
        String key = CodeTypeConst.BIND_CODE + ":" + phone;
        String codeAndTimeInRedis = (String) redisTemplate.opsForValue().get(key); // 获取当前手机号对应的redis中的值
        String codeInRedis = codeAndTimeInRedis.split(":")[0]; // 截取出code
        // 判断是否合法
        if (!code.equals(codeInRedis)) {
            throw new RuntimeException("验证码错误!");
        }

        // 2.通过openid和access_token获取对应用的个人信息
        String url = WeChatConst.GET_WXUSER_IFON.replace("ACCESS_TOKEN", access_token)
                .replace("OPENID", access_token);
        String weChatResult = HttpUtil.sendGet(url);
        JSONObject jObj = JSON.parseObject(weChatResult); // 将返回的结果转换为一个JSONObject对象
        // 3.判断用户绑定的手机号是否已经注册
        User user = userMapper.loadByPhone(phone);
        LoginInfo loginInfo = null; // 准备免密参数loginInfo
        if (user == null) { // 完全新用户
            // 生成一个user
            user = new User();
            user.setUsername("u_" + phone); // 设置username
            user.setPhone(phone); // 设置电话
            user.setState(1); // 设置状态为启用
            user.setCreatetime(new Date()); // 设置注册时间
            userMapper.save(user); // 保存到数据库
            loginInfo = user2LogiInfo(user); // 将user对象转换成loginfo对象
            loginInfoMapper.save(loginInfo); // 保存到数据库
        }

        // 4.生成一个wxUser,并且和User绑定,并且更新到登录信息中
        WxUser wxUser = new WxUser();
        wxUser.setOpenid(jObj.getString("openid")); // 设置openid
        // 获取nickname,重新设置编码集
        String nickname = jObj.getString("nickname");
        try {
            byte[] byteData = nickname.getBytes("ISO-8859-1");
            nickname = new String(byteData, "UTF-8");
        }catch(UnsupportedEncodingException e){
            System.out.println(e);
        }
        wxUser.setNickname(nickname); // 设置昵称
        wxUser.setSex(jObj.getInteger("sex")); // 设置性别
        wxUser.setAddress(jObj.getString("country") + ":" + jObj.getString("province")
                + ":" + jObj.getString("city")); // 设置地址
        wxUser.setHeadimgurl(jObj.getString("headimgurl")); // 设置头像
        wxUser.setUnionid(jObj.getString("unionid")); // 设置unionid
        wxUser.setUser(user); // 绑定user
        wxUserMapper.save(wxUser); // 保存到数据库
        if (loginInfo == null) { // 老用户登录
            loginInfo = loginInfoMapper.loadByUid(user.getId());
        }
        // 免密登录
        return thirdPartyLogin(loginInfo);
    }

    /**
     * 免密登录
     */
    public Map<String, Object> thirdPartyLogin(LoginInfo loginInfo) {
        // 生成一个密钥作为token
        String token = UUID.randomUUID().toString();
        // 将token作为key loginInfo作为valu保存到redis中,设置过期时间为30分钟
        redisTemplate.opsForValue().set(token, loginInfo, 30, TimeUnit.MINUTES);
        // 将密钥和登录信息装到一个map集合中并且返回
        Map<String, Object> map = new HashMap<>();
        map.put("token", token);
        map.put("loginInfo", loginInfo);
        return map;
    }

    /**
     * user转logInfo
     * @param user
     * @return
     */
    private LoginInfo user2LogiInfo(User user) {
        LoginInfo loginInfo = new LoginInfo();
        loginInfo.setUsername(user.getUsername()); // 设置用户名
        loginInfo.setPhone(user.getPhone()); // 设置电话
        loginInfo.setType(1); // 设置为前台用户
        loginInfo.setDisable(1); // 设置状态为启用
        loginInfo.setUid(user.getId()); // 设置uid
        return loginInfo;
    }
}
