package com.hoki.zj.user.domain;

import com.hoki.zj.basic.domain.BaseDomain;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WxUser extends BaseDomain {

    private String openid;
    private String nickname;

    // 1:男 2:女
    private Integer sex;
    private String address;
    private String headimgurl;
    private String unionid;
    private User user;
}
