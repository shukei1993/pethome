package com.hoki.zj.system.service;

import com.hoki.zj.system.domain.DictionaryType;
import com.hoki.zj.system.query.DictionaryTypeQuery;
import com.hoki.zj.utils.QueryResult;

import java.util.List;

public interface IDictionaryTypeService {

    /** 添加 */
    void save(DictionaryType dictionaryType);

    /** 修改 */
    void update(DictionaryType dictionaryType);

    /** 删除一条 */
    void delete(Long id);

    /** 查询一条 */
    DictionaryType findOne(Long id);

    /** 查询全部 */
    List<DictionaryType> findAll();

    /** 批量删除 */
    void batchRemove(Long... ids);

    QueryResult<DictionaryType> queryPage(DictionaryTypeQuery query);
}
