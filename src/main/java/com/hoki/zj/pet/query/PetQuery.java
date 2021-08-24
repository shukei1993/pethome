package com.hoki.zj.pet.query;

import com.hoki.zj.basic.query.BaseQuery;
import lombok.Data;

@Data
public class PetQuery extends BaseQuery {

    // 宠物名
    private String name;

    // 状态
    private Integer state;

    // 店铺
    private Long shop_id;
}
