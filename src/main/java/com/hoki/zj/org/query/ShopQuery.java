package com.hoki.zj.org.query;

import com.hoki.zj.basic.query.BaseQuery;
import lombok.Data;

@Data
public class ShopQuery extends BaseQuery {

    /** 高级查询 */
    private String keywords;
}
