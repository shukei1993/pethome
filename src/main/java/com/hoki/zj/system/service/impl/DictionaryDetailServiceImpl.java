package com.hoki.zj.system.service.impl;

import com.hoki.zj.system.domain.DictionaryDetail;
import com.hoki.zj.system.mapper.DictionaryDetailMapper;
import com.hoki.zj.system.query.DictionaryDetailQuery;
import com.hoki.zj.system.service.IDictionaryDetailService;
import com.hoki.zj.utils.QueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
public class DictionaryDetailServiceImpl implements IDictionaryDetailService {

    /** 注解注入创建DictionaryDetailMapper对象 */
    @Autowired
    private DictionaryDetailMapper dictionaryDetailMapper;

    @Override
    public void save(DictionaryDetail dictionaryDetail) {
        dictionaryDetailMapper.save(dictionaryDetail);
    }

    @Override
    public void update(DictionaryDetail dictionaryDetail) {
        dictionaryDetailMapper.update(dictionaryDetail);
    }

    @Override
    public void delete(Long id) {
        dictionaryDetailMapper.delete(id);
    }

    @Override
    public DictionaryDetail findOne(Long id) {
        return dictionaryDetailMapper.findOne(id);
    }

    @Override
    public List<DictionaryDetail> findAll() {
        return dictionaryDetailMapper.findAll();
    }

    @Override
    public void batchRemove(Long... ids) {
        if (ids != null) {
            dictionaryDetailMapper.batchRemove(ids);
        }
    }

    @Override
    public QueryResult<DictionaryDetail> queryPage(DictionaryDetailQuery query) {
        // 查询总数
        Long total = dictionaryDetailMapper.findCount(query);
        if (total == null || total == 0) {
            return new QueryResult<>();
        }
        // 查询所有数据
        List<DictionaryDetail> list = dictionaryDetailMapper.queryPage(query);
        return new QueryResult<>(total, list);
    }
}
