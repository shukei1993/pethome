package com.hoki.zj.pay.mapper;

import com.hoki.zj.basic.mapper.BaseMapper;
import com.hoki.zj.pay.domain.PayBill;

public interface PayBillMapper extends BaseMapper<PayBill> {

    /** 1.根据订单号查询订单信息 */
    PayBill loadByOrderSn(String orderSn);
}
