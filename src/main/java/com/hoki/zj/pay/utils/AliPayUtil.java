package com.hoki.zj.pay.utils;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.hoki.zj.pay.config.AliPayConfig;
import com.hoki.zj.pay.domain.AliPayInfo;
import com.hoki.zj.pay.domain.PayBill;

/**
 * 支付宝支付工具类:AliPayUtil
 */
public class AliPayUtil {

    /**
     * 支付宝支付方法
     * @param payBill 获取订单号,金额,订单名称,商品描述
     * @param aliPayInfo 支付宝信息
     */
    public static String aliPay(PayBill payBill, AliPayInfo aliPayInfo) {

        String result = null;
        try {
            //获得初始化的AlipayClient
            AlipayClient alipayClient = new DefaultAlipayClient(AliPayConfig.gatewayUrl,
                    aliPayInfo.getAppid(),
                    aliPayInfo.getMerchant_private_key(), "json",
                    AliPayConfig.charset,
                    aliPayInfo.getAlipay_public_key(),
                    AliPayConfig.sign_type);

            //设置请求参数
            AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
            alipayRequest.setReturnUrl(AliPayConfig.return_url);
            alipayRequest.setNotifyUrl(AliPayConfig.notify_url);

            //商户订单号，商户网站订单系统中唯一订单号，必填
            String out_trade_no = payBill.getOrderSn();
            //付款金额，必填
            String total_amount = payBill.getMoney().toString();
            //订单名称，必填
            String subject = payBill.getDigest();
            //商品描述，可空
            String body = payBill.getDigest();

            alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                    + "\"total_amount\":\""+ total_amount +"\","
                    + "\"subject\":\""+ subject +"\","
                    + "\"body\":\""+ body +"\","
                    + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

            //若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
            //alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
            //		+ "\"total_amount\":\""+ total_amount +"\","
            //		+ "\"subject\":\""+ subject +"\","
            //		+ "\"body\":\""+ body +"\","
            //		+ "\"timeout_express\":\"10m\","
            //		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
            //请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节

            //请求
            result = alipayClient.pageExecute(alipayRequest).getBody();
            return result; // 将result返回给调用方
        } catch (AlipayApiException e) {
            e.printStackTrace();
            return null;
        }
    /*//输出
	out.println(result);*/
    }
}
