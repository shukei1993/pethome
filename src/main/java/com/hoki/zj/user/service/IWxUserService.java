package com.hoki.zj.user.service;

import com.hoki.zj.basic.service.IBaseService;
import com.hoki.zj.user.domain.WxUser;

import java.util.Map;

public interface IWxUserService extends IBaseService<WxUser> {

    /** 1.第三方微信登录 */
    Map<String, Object> login(Map<String, String> map);
    /** 2.微信登录绑定 */
    Map<String, Object> bind(Map<String, String> map);
}
