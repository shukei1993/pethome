package com.hoki.zj.pay.controller;

import com.hoki.zj.constant.BusinessTypeConst;
import com.hoki.zj.order.domain.AdoptOrder;
import com.hoki.zj.order.service.IAdoptService;
import com.hoki.zj.pay.domain.PayBill;
import com.hoki.zj.pay.service.IPayBillService;
import com.hoki.zj.quartz.service.IQuartzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Controller
@RequestMapping("/pay")
public class PayController {

    /** 注解注入IPayBillService对象 */
    @Autowired
    private IPayBillService payBillService;

    /** 注解注入IAdoptService对象 */
    @Autowired
    private IAdoptService adoptService;

    /** 注解注入定时任务业务接口对象 */
    @Autowired
    private IQuartzService quartzService;

    /**
     * 1.异步回调
     * @param request 请求对象
     * @return 返回一个结果
     */
    @RequestMapping("/notifyUrl")
    @ResponseBody
    public String notifyUrl(HttpServletRequest request) {

        try {
            Map<String,String> params = new HashMap<String,String>();
            Map<String,String[]> requestParams = request.getParameterMap();
            for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
                String name = (String) iter.next();
                String[] values = (String[]) requestParams.get(name);
                String valueStr = "";
                for (int i = 0; i < values.length; i++) {
                    valueStr = (i == values.length - 1) ? valueStr + values[i]
                            : valueStr + values[i] + ",";
                }
                //乱码解决，这段代码在出现乱码时使用
                valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
                params.put(name, valueStr);
            }
            // 商城系统的交易订单号oderSn
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

            // 支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

            //交易状态
            String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");

            if(trade_status.equals("TRADE_FINISHED")){
                //判断该笔订单是否在商户网站中已经做过处理
                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                //如果有做过处理，不执行商户的业务程序

                //注意：
                //退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
                return null;
            }else if (trade_status.equals("TRADE_SUCCESS")){
                // 成功的回调
                // 根据交易订单号获取对应的支付信息
                PayBill payBill = payBillService.loadByOrderSn(out_trade_no);
                payBill.setState(1); // 设置状态为已支付
                payBill.setUpdateTime(new Date()); // 设置修改时间
                payBill.setUnionPaySn(trade_no);// 设置支付编号
                // 更新到数据库
                payBillService.update(payBill);

                // 根据支付单的类型,进行分发,查找相应的订单对象
                switch (payBill.getBusinessType()) {
                    // 1.领养订单
                    case BusinessTypeConst.ADOPTORDER:
                        // 根据支付单中的订单号获取对应的订单对象
                        AdoptOrder adoptOrder = adoptService.loadByOrderSn(out_trade_no);
                        adoptOrder.setState(1); // 设置状态为已支付(待发货)
                        // 设置支付编号
                        adoptOrder.setPaySn(trade_no);
                        // 更新到数据库
                        adoptService.update(adoptOrder);
                        break;
                    case BusinessTypeConst.GOODSORDER:
                        break;
                    case BusinessTypeConst.PETACQUISITIONORDER:
                        break;
                    case BusinessTypeConst.PRODUCTORDER:
                        break;
                    case BusinessTypeConst.RECHARGEORDER:
                        break;
                }
                // 订单已经支付,取消任务
                quartzService.cancelJob(out_trade_no);
            }
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "fail";
    }

    /**
     * 2.同步的回调
     * @return 重定向到支付成功后的页面(以异步回调的结果为准)
     */
    @RequestMapping("/returnUrl")
    public String returnUrl() {
        // 重定向到支付成功后的页面
        return  "redirect:http://localhost/success.html";
    }
}
