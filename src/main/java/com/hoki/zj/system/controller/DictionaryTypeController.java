package com.hoki.zj.system.controller;

import com.hoki.zj.system.domain.DictionaryType;
import com.hoki.zj.system.query.DictionaryTypeQuery;
import com.hoki.zj.system.service.IDictionaryTypeService;
import com.hoki.zj.utils.AjaxResult;
import com.hoki.zj.utils.QueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/dic")
public class DictionaryTypeController {

    /** 注解注入创建IDictionaryTypeService */
    @Autowired
    private IDictionaryTypeService dictionaryTypeService;

    /**
     * 1.添加/修改
     * @param dictionaryType
     * @return
     */
    @PutMapping
    public AjaxResult saveOrUpdate(@RequestBody DictionaryType dictionaryType) {
        try {
            if (dictionaryType.getId() == null) {
                // 添加
                dictionaryTypeService.save(dictionaryType);
            } else {
                // 修改
                dictionaryTypeService.update(dictionaryType);
            }
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.me().setSuccess(false).setMessage(e.getMessage());
        }
    }

    /**
     * 2.删除
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public AjaxResult deleteDictionaryType(@PathVariable("id") Long id) {
        try {
            dictionaryTypeService.delete(id);
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.me().setSuccess(false).setMessage(e.getMessage());
        }
    }

    /**
     * 3.查询单个
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public DictionaryType findOne(@PathVariable("id") Long id) {
        return dictionaryTypeService.findOne(id);
    }

    /**
     * 4.查询全部
     * @return
     */
    @GetMapping
    public List<DictionaryType> findAll() {
        return dictionaryTypeService.findAll();
    }

    /**
     * 5.分页/高级查询
     * @param query
     * @return
     */
    @PostMapping
    public QueryResult<DictionaryType> queryPage(@RequestBody DictionaryTypeQuery query) {
        return dictionaryTypeService.queryPage(query);
    }

    /**
     * 6.批量删除
     * @param ids
     */
    @PatchMapping
    public AjaxResult batchRemove(@RequestBody Long... ids) {
        try {
            dictionaryTypeService.batchRemove(ids);
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.me().setSuccess(false).setMessage(e.getMessage());
        }
    }


}
