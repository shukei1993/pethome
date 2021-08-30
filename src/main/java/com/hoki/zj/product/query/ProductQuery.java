package com.hoki.zj.product.query;

import com.hoki.zj.basic.query.BaseQuery;
import lombok.Data;

@Data
public class ProductQuery extends BaseQuery {

    /** 服务名 */
    private String name;

    /** 状态 */
    private Integer state;
}
