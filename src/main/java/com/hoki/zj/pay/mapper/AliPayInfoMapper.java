package com.hoki.zj.pay.mapper;

import com.hoki.zj.basic.mapper.BaseMapper;
import com.hoki.zj.pay.domain.AliPayInfo;

public interface AliPayInfoMapper extends BaseMapper<AliPayInfo> {

    /** 1.根据shop_id查询对应的支付宝信息 */
    AliPayInfo loadByShopId(Long id);
}
