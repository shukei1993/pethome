package com.hoki.zj.org.mapper;

import com.hoki.zj.basic.mapper.BaseMapper;
import com.hoki.zj.org.domain.Shop;

public interface ShopMapper extends BaseMapper<Shop> {

    /** 根据adminid查询shop对象 */
    Shop loadByAdminId(Long id);
}
