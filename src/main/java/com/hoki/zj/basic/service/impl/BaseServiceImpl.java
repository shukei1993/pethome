package com.hoki.zj.basic.service.impl;

import com.hoki.zj.basic.mapper.BaseMapper;
import com.hoki.zj.basic.query.BaseQuery;
import com.hoki.zj.basic.service.IBaseService;
import com.hoki.zj.utils.QueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Transactional(readOnly = true, propagation = Propagation.SUPPORTS) // 查询的事务传输方式
public class BaseServiceImpl<T> implements IBaseService<T> {

    /** 注解注入创建BaseMapper对象 */
    @Autowired
    private BaseMapper<T> baseMapper;

    @Override
    @Transactional
    public void save(T t) {
        baseMapper.save(t);
    }

    @Override
    @Transactional
    public void update(T t) {
        baseMapper.update(t);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        baseMapper.delete(id);
    }

    @Override
    public T findOne(Long id) {
        return baseMapper.findOne(id);
    }

    @Override
    public List<T> findAll() {
        return baseMapper.findAll();
    }

    @Override
    public QueryResult<T> queryPage(BaseQuery query) {
        // 查询总数
        Long total = baseMapper.findCount(query);
        if (total == null || total == 0) {
            // 如果数据数为空或者0,表示没有数据之间返回一个无参QueryResult对象
            return new QueryResult<>();
        }
        // 查询具体数据
        List<T> list = baseMapper.queryPage(query);
        // 返回一个QueryResult对象,传入total 和list
        return new QueryResult<>(total, list);
    }

    /**
     * 批量删除
     * @param ids
     */
    @Transactional
    @Override
    public void batchRemove(Long... ids) {
        if (ids != null) { // 如果不是空数组,调用方法删除
            baseMapper.batchRemove(ids);
        }
    }
}
