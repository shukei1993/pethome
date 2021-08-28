package com.hoki.zj.order.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.hoki.zj.basic.domain.BaseDomain;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderAddress extends BaseDomain {

    @JsonFormat(pattern = "yyyy-MM-dd, hh:mm:ss", timezone = "GMT+8")
    private Date createTime;
    @JsonFormat(pattern = "yyyy-MM-dd, hh:mm:ss", timezone = "GMT+8")
    private Date updateTime;

    private Long order_id;
    private String orderSn;

    private String contacts;
    private String areaCode;

    private String address;
    private String fullAddress;

    private String phone;
    private String phoneBack;
    private String tel;

    private String postCode;
    private String email;
}
