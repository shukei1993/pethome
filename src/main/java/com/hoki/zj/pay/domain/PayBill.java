package com.hoki.zj.pay.domain;

import com.hoki.zj.basic.domain.BaseDomain;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PayBill extends BaseDomain {

    private String digest;

    private BigDecimal money;

    private Integer state;

    private Date lastPayTime;

    private String payChannel;

    private Date createTime;

    private Date updateTime;

    private Long user_id;

    private String nickName;

    private String unionPaySn;

    private String businessType;

    private Long businessKey;

    private Long shop_id;

    private String orderSn;
}
