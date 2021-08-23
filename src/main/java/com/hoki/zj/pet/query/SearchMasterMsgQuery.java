package com.hoki.zj.pet.query;

import com.hoki.zj.basic.query.BaseQuery;
import lombok.Data;

@Data
public class SearchMasterMsgQuery extends BaseQuery {

    private Long shop_id;
    private Integer state;
}
