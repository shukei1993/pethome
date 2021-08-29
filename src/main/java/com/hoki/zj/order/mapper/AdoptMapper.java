package com.hoki.zj.order.mapper;

import com.hoki.zj.basic.mapper.BaseMapper;
import com.hoki.zj.order.domain.AdoptOrder;

public interface AdoptMapper extends BaseMapper<AdoptOrder> {

    /** 根据交易订单号查询订单对象 */
    AdoptOrder loadByOrderSn(String orderSn);
}
