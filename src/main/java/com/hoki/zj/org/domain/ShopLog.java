package com.hoki.zj.org.domain;

import com.hoki.zj.basic.domain.BaseDomain;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 驳回日志
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShopLog extends BaseDomain {

    /** 审核人,目前没有 */
    private Employee employee;

    /** 审核时间 */
    private Date checkTime;

    /** 店铺id */
    private Long shop_id;

    /** 驳回原因 */
    private String note;

}
