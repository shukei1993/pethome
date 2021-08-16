package com.hoki.zj.system.mapper;

import com.hoki.zj.system.domain.DictionaryDetail;
import com.hoki.zj.system.query.DictionaryDetailQuery;

import java.util.List;

public interface DictionaryDetailMapper {

    /** 添加 */
    void save(DictionaryDetail dictionaryDetail);

    /** 修改 */
    void update(DictionaryDetail dictionaryDetail);

    /** 删除一条 */
    void delete(Long id);

    /** 查询一条 */
    DictionaryDetail findOne(Long id);

    /** 查询全部 */
    List<DictionaryDetail> findAll();

    /** 批量删除 */
    void batchRemove(Long... ids);

    /** 分页/高级查询 */
    Long findCount(DictionaryDetailQuery query);
    List<DictionaryDetail> queryPage(DictionaryDetailQuery query);
}
