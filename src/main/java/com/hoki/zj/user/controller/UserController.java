package com.hoki.zj.user.controller;

import com.hoki.zj.user.domain.User;
import com.hoki.zj.user.domain.dto.UserDTO;
import com.hoki.zj.user.service.IUserService;
import com.hoki.zj.utils.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController {

    /** 注解注入创建IUserService对象 */
    @Autowired
    private IUserService userService;

    /**
     * 1.前端前台用户手机注册
     * @param userDTO  临时对象,封装了前端注册传过来的参数phone,code,password,confirmPassword
     * @return
     */
    @PostMapping("/register")
    public AjaxResult register(@RequestBody UserDTO userDTO) {
        try {
            userService.register(userDTO);
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxResult(e.getMessage());
        }
    }

    /**
     * 2.前端前台用户登录
     * @param user username: phone or email or username   password
     * @return
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestBody User user) {
        try {
            // 调用service层的login方法,得到装有LoginInfo对象和密钥token的map集合
            Map<String, Object> map = userService.login(user);
            // map集合返回给前端,为了保存到前端浏览器本地存储中
            return AjaxResult.me().setResultObj(map);
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxResult(e.getMessage());
        }
    }

}
