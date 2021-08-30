package com.hoki.zj.product.mapper;

import com.hoki.zj.basic.mapper.BaseMapper;
import com.hoki.zj.product.domain.Product;

public interface ProductMapper extends BaseMapper<Product> {
    void onSale(Long... ids);

    void offSale(Long... ids);

    Product loadByProductId(Long id);
}
