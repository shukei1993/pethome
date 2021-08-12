package com.hoki.zj.basic.mapper;


import com.hoki.zj.basic.query.BaseQuery;
import java.util.List;

public interface BaseMapper<T> {

    void save(T t);

    void update(T t);

    void delete(Long id);

    T findOne(Long id);

    List<T> findAll();

    /** 查询满足条件的数据总数 */
    Long findCount(BaseQuery query);

    /** 查询所有满足条件的数据 */
    List<T> queryPage(BaseQuery query);

    /** 批量删除 */
    void batchRemove(Long... ids);
}
