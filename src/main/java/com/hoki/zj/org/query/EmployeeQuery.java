package com.hoki.zj.org.query;

import com.hoki.zj.basic.query.BaseQuery;
import lombok.Data;

/** 员工查询类,封装员工查询的信息 */
@Data // getter setter toString
public class EmployeeQuery extends BaseQuery {

    /** 高级查询 */
    private String username;
    private String phone;
    private Integer state;

}
