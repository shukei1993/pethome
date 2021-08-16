package com.hoki.zj.system.service.impl;

import com.hoki.zj.system.domain.DictionaryType;
import com.hoki.zj.system.mapper.DictionaryTypeMapper;
import com.hoki.zj.system.query.DictionaryTypeQuery;
import com.hoki.zj.system.service.IDictionaryTypeService;
import com.hoki.zj.utils.QueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
public class DictionaryTypeServiceImpl implements IDictionaryTypeService {

    /** 注解注入创建DictionaryTypeMapper对象 */
    @Autowired
    private DictionaryTypeMapper dictionaryTypeMapper;

    @Override
    @Transactional
    public void save(DictionaryType dictionaryType) {
        dictionaryTypeMapper.save(dictionaryType);
    }

    @Override
    @Transactional
    public void update(DictionaryType dictionaryType) {
        dictionaryTypeMapper.update(dictionaryType);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        dictionaryTypeMapper.delete(id);
    }

    @Override
    public DictionaryType findOne(Long id) {
        return dictionaryTypeMapper.findOne(id);
    }

    @Override
    public List<DictionaryType> findAll() {
        return dictionaryTypeMapper.findAll();
    }

    /**
     * 批量删除
     * @param ids
     */
    @Override
    @Transactional
    public void batchRemove(Long... ids) {
        dictionaryTypeMapper.batchRemove(ids);
    }

    /**
     * 分页高级擦汗寻
     * @param query
     * @return
     */
    @Override
    public QueryResult<DictionaryType> queryPage(DictionaryTypeQuery query) {
        /** 查询总数 */
        Long total = dictionaryTypeMapper.findCount(query);
        if (total == 0 || total ==null) {
            return new QueryResult<DictionaryType>();
        }
        /** 查询具体数据 */
        List<DictionaryType> list = dictionaryTypeMapper.queryPage(query);
        /** 返回一个 QueryResult对象*/
        return new QueryResult<DictionaryType>(total, list);
    }
}
