package com.hoki.zj.user.controller;

import com.hoki.zj.user.domain.WxUser;
import com.hoki.zj.user.service.IWxUserService;
import com.hoki.zj.utils.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.Map;

/**
 * 微信用户处理类:WxUserController
 */
@RestController
@RequestMapping("/wechat")
public class WxUserController {

    /** 注解注入IWxUserService对象 */
    @Autowired
    private IWxUserService wxUserService;

    /**
     * 1.第三方微信登录
     * @param map code:授权码
     * @return
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestBody Map<String, String> map) {
        try {
            Map<String, Object> loginInfoOrRedirectUrl = wxUserService.login(map);
            return AjaxResult.me().setResultObj(loginInfoOrRedirectUrl);
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxResult(e.getMessage());
        }
    }

    /**
     * 2.第三方微信登录绑定
     * @param map
     * @return
     */
    @PostMapping("/bind")
    public  AjaxResult bind(@RequestBody Map<String, String> map) {
        try {
            Map<String, Object> bind = wxUserService.bind(map);
            return AjaxResult.me().setResultObj(bind);
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxResult(e.getMessage());
        }
    }

}
