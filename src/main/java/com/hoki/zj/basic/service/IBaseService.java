package com.hoki.zj.basic.service;

import com.hoki.zj.basic.query.BaseQuery;
import com.hoki.zj.utils.QueryResult;
import java.util.List;

public interface IBaseService<T> {

    void save(T t);

    void update(T t);

    void delete(Long id);

    T findOne(Long id);

    List<T> findAll();

    /** 分页/高级查询 */
    QueryResult<T> queryPage(BaseQuery query);

    /** 批量删除 */
    void batchRemove(Long... ids);
}
