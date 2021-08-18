package com.hoki.zj.org.service;

import com.hoki.zj.basic.service.IBaseService;
import com.hoki.zj.org.domain.Shop;
import com.hoki.zj.org.domain.ShopLog;

public interface IShopService extends IBaseService<Shop> {

    /** 店铺入驻 */
    void settlement(Shop shop);

    /** 审核驳回 */
    void reject(ShopLog shopLog);

    /** 审核通过 */
    void pass(ShopLog shopLog);

    /** 驳回后修改再提交 */
    void reSettlement(Shop shop);
}
