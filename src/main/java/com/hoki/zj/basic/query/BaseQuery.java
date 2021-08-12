package com.hoki.zj.basic.query;

import lombok.Data;

@Data
public class BaseQuery {

    /** 当前页,默认第一页 */
    private Integer currentPage = 1;

    /** 当前页数据条数,默认值5 */
    private Integer pageSize = 5;

    /** 提供一个方法获取当前页第一条数据的下标,mybatis通过bean属性start获取数据 */
    public Integer getStart() {
        return (this.currentPage - 1) * this.pageSize;
    }
}
