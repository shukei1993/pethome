package com.hoki.zj.user.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.hoki.zj.basic.domain.BaseDomain;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User extends BaseDomain {

    private String username;
    private String email;
    private String phone;
    private String salt;
    private String password;
    /** 0:待激活 1:启用 -1:封号 */
    private Integer state;
    private Integer age;
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date createtime;
    private String headImg;
}
