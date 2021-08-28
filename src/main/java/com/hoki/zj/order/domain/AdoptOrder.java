package com.hoki.zj.order.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.hoki.zj.basic.domain.BaseDomain;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdoptOrder extends BaseDomain {

    /** 摘要 */
    private String digest;
    /** 状态 0:待支付(默认) 1:待配送 -1:订单取消 */
    private Integer state;
    /** 价格 */
    private BigDecimal price;
    /** 订单号 */
    private String orderSn;
    /** 支付单号 */
    private String paySn;

    /** 最终支付时间 */
    @JsonFormat(pattern = "yyyy-MM-dd, hh:mm:ss", timezone = "GMT+8")
    private Date lastPayTime;
    
    /** 最终确认时间 */
    @JsonFormat(pattern = "yyyy-MM-dd, hh:mm:ss", timezone = "GMT+8")
    private Date lastConfirmTime;
    /** 领养的宠物 */
    private Long pet_id;
    /** 领养人 */
    private Long user_id;
    /** 服务的商家  */
    private Long shop_id;
    /** 地址 */
    private Long address_id;
}
