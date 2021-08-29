package com.hoki.zj.pay.service;

import com.hoki.zj.pay.domain.PayBill;

public interface IPayService {

    /** 支付 */
    String pay(PayBill payBill);
}
