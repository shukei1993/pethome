package com.hoki.zj.pay.service;

import com.hoki.zj.basic.service.IBaseService;
import com.hoki.zj.pay.domain.PayBill;

public interface IPayBillService extends IBaseService<PayBill> {

    PayBill loadByOrderSn(String orderSn);
}
