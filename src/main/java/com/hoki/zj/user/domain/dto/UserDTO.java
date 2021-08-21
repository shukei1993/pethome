package com.hoki.zj.user.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
/**
 * 临时用户注册资料类:UserDTO
 */
public class UserDTO {

    private String phone;
    private String code;
    private String password;
    private String confirmPassword;
}
