package com.hoki.zj.pay.service.impl;

import com.hoki.zj.pay.constant.PaymentConst;
import com.hoki.zj.pay.domain.AliPayInfo;
import com.hoki.zj.pay.domain.PayBill;
import com.hoki.zj.pay.mapper.AliPayInfoMapper;
import com.hoki.zj.pay.service.IPayService;
import com.hoki.zj.pay.utils.AliPayUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 支付业务类:PayServiceImpl
 */
@Service
public class PayServiceImpl implements IPayService {

    /** 注入AliPayInfoMapper对象 */
    @Autowired
    private AliPayInfoMapper aliPayInfoMapper;

    /**
     * 1.支付功能
     * @param payBill 获取支付方式,作为对应支付方法的参数
     */
    @Override
    public String pay(PayBill payBill) {
        String result = null;
        switch (payBill.getPayChannel()) { // 根据支付方式进行分配
            // 支付宝支付
            case PaymentConst.ALIPAY:
                // 根据店铺id查询对应商家的支付宝支付信息
                AliPayInfo aliPayInfo = aliPayInfoMapper.loadByShopId(payBill.getShop_id());
                // 调用工具类进行支付
                result = AliPayUtil.aliPay(payBill, aliPayInfo);
                // 将结果返回给调用方

                break;
            // 微信支付
            case PaymentConst.WXPAY:

                break;
            // 银联支付
            case PaymentConst.UNIONPAY:

                break;
        }
        return result;
    }
}
