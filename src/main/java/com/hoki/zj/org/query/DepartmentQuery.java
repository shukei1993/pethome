package com.hoki.zj.org.query;

import com.hoki.zj.basic.query.BaseQuery;
import lombok.Data;

/** 部门查询类,封装部门查询的信息 */
@Data // getter setter toString
public class DepartmentQuery extends BaseQuery {

    /** 关键字查询 */
    private String keywords;
    

}
