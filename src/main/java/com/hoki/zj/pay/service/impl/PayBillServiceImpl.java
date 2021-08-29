package com.hoki.zj.pay.service.impl;

import com.hoki.zj.basic.service.impl.BaseServiceImpl;
import com.hoki.zj.pay.domain.PayBill;
import com.hoki.zj.pay.mapper.PayBillMapper;
import com.hoki.zj.pay.service.IPayBillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PayBillServiceImpl extends BaseServiceImpl<PayBill> implements IPayBillService {

    /** 注解注入PayBillMapper对象 */
    @Autowired
    private PayBillMapper payBillMapper;

    /**
     * 1.根据订单号查询订单信息
     * @param orderSn 订单号
     * @return 返回订单信息
     */
    @Override
    public PayBill loadByOrderSn(String orderSn) {
        return payBillMapper.loadByOrderSn(orderSn);
    }
}
