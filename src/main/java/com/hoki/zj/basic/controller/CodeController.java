package com.hoki.zj.basic.controller;

import com.hoki.zj.basic.service.ICodeService;
import com.hoki.zj.utils.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/code")
public class CodeController {

    /** 注解注入创建CodeService对象 */
    @Autowired
    private ICodeService codeService;

    /**
     * 1.手机注册,验证码发送
     * @param map phone codeType: REGISTER_CODE / BIND_CODE
     * @return
     */
    @PostMapping("/sendCode")
    public AjaxResult sendVerifyCode(@RequestBody Map<String, String> map) {
        try {
            System.out.println(map);
            // 调用方法发送验证码
            codeService.sendVerifyCode(map);
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxResult(e.getMessage());
        }
    }
}
