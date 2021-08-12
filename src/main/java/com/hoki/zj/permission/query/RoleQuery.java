package com.hoki.zj.permission.query;

import com.hoki.zj.basic.query.BaseQuery;
import lombok.Data;

/**
 * 角色查询类,封装角色查询的信息:RoleQuery
 */
@Data
public class RoleQuery extends BaseQuery {

    /** 关键字查询 */
    private String keywords;

}
