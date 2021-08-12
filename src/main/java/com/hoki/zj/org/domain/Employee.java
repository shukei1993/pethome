package com.hoki.zj.org.domain;

import com.hoki.zj.basic.domain.BaseDomain;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Employee extends BaseDomain {
    
    private String username;
    private String email;
    private String phone;
    private String password;
    private Integer age;

    /** 状态 1:启用 0:待激活 -1:禁用 */
    private Integer state;
}
