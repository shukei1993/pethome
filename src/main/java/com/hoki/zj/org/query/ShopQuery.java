package com.hoki.zj.org.query;

import com.hoki.zj.basic.query.BaseQuery;
import lombok.Data;

@Data
public class ShopQuery extends BaseQuery {

    /** 关键字查询 */
    private String keywords;

    /** 状态查询 */
    private Integer state;
}
