package com.hoki.zj.utils;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 封装查询的结果
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class QueryResult<T> {
    /** 数据总数 */
    private Long total = 0L;

    /** 查询的数据 */
    List<T> list = null;
}
