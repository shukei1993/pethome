package com.hoki.zj.product.service;

import com.hoki.zj.basic.service.IBaseService;
import com.hoki.zj.product.domain.Product;

public interface IProductService extends IBaseService<Product> {

    void onSale(Long... ids);

    void offSale(Long... ids);

    Product loadByProductId(Long id);
}
