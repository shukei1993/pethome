package com.hoki.zj.quartz.job;

import com.hoki.zj.constant.BusinessTypeConst;
import com.hoki.zj.order.domain.AdoptOrder;
import com.hoki.zj.order.service.IAdoptService;
import com.hoki.zj.pay.domain.PayBill;
import com.hoki.zj.pay.service.IPayBillService;
import com.hoki.zj.pet.service.IPetService;
import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.Map;

@Component
public class OrderJob implements Job {

    /** 注解注入IPayBillService对象 */
    @Autowired
    private IPayBillService payBillService;

    /** 注解注入IAdoptService对象 */
    @Autowired
    private IAdoptService adoptService;

    /** 注解注入IPetService对象 */
    @Autowired
    private IPetService petService;

    /**
     * 订单取消定时任务
     * @param jobExecutionContext 获取定时任务详情
     * @throws JobExecutionException
     */
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        // 1.获取订单号
        JobDataMap jobDataMap = jobExecutionContext.getJobDetail().getJobDataMap();
        Map<String, Object> params = (Map<String, Object>) jobDataMap.get("params");
        String orderSn = (String) params.get("orderSn");
        // 根据交易订单号获取对应的支付信息
        PayBill payBill = payBillService.loadByOrderSn(orderSn);
        payBill.setState(-1); // 设置订单取消
        payBill.setUpdateTime(new Date()); // 设置修改时间
        // 更新到数据库
        payBillService.update(payBill);
        // 根据支付单的类型,进行分发,查找相应的订单对象
        switch (payBill.getBusinessType()) {
            // 1.领养订单
            case BusinessTypeConst.ADOPTORDER:
                // 根据支付单中的订单号获取对应的订单对象
                AdoptOrder adoptOrder = adoptService.loadByOrderSn(orderSn);
                adoptOrder.setState(-1); // 设置订单取消
                // 更新到数据库
                adoptService.update(adoptOrder);
                // 1.2 根据宠物id重新上架宠物
                petService.onSale(adoptOrder.getPet_id());
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
    }
}
