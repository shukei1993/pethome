package com.hoki.zj.login.domain;

import com.hoki.zj.basic.domain.BaseDomain;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
/**
 * 登录信息:LoginInfo
 * 需要实现序列化(Serializable),将java对象保存到redis中
 */
public class LoginInfo extends BaseDomain implements Serializable {
    
    private String username;
    private String phone;
    private String email;
    private String password;
    /** 1是前台用户, 0是后台管理用户 */
    private Integer type;
    /** 0待激活  1启用  -1禁用  */
    private Integer disable;
    /** 盐值 */
    private String salt;
    /** 用户id */
    private Long uid;
}
