package com.hoki.zj.order.service;

import com.hoki.zj.basic.service.IBaseService;
import com.hoki.zj.order.domain.AdoptOrder;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public interface IAdoptService extends IBaseService<AdoptOrder> {
    /** 生成领养订单 */
    String createOrder(Map<String, String> map, HttpServletRequest request);

    /** 根据订单号获取订单对象 */
    AdoptOrder loadByOrderSn(String orderSn);
}
