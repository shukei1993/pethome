package com.hoki.zj.constant;


public class WeChatConst {
    public static String APPID = "wxd853562a0548a7d0";
    public static String SECRET = "4a5d5615f93f24bdba2ba8534642dbb6";
    public static String GET_ACCESS_TOKEN = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
    public static String GET_WXUSER_IFON = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID";
}
