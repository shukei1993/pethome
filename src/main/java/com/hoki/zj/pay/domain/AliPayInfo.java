package com.hoki.zj.pay.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AliPayInfo {
    private String merchant_private_key;
    private String appid;
    private String alipay_public_key;
    private Long shop_id;
    private String shopName;
}
