package com.hoki.zj.product.domain;

import com.hoki.zj.basic.domain.BaseDomain;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDetail extends BaseDomain {

    private Long product_id;
    private String intro;
    private String orderNotice;
}
