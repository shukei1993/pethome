package com.hoki.zj.system.query;

import lombok.Data;

@Data
public class DictionaryDetailQuery {

    /** 当前页默认1 */
    private Integer currentPage = 1;

    /** 当前显示条数默认5 */
    private Integer pageSize = 5;

    /** 高级查询 */
    private String keywords;

    private Long id;

    /** 获取当前页第一个数据的下标 */
    public Integer getStart() {return (this.currentPage - 1) * this.pageSize;}
}
