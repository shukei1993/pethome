package com.hoki.zj.system.controller;

import com.hoki.zj.system.domain.DictionaryDetail;
import com.hoki.zj.system.domain.DictionaryType;
import com.hoki.zj.system.query.DictionaryDetailQuery;
import com.hoki.zj.system.query.DictionaryTypeQuery;
import com.hoki.zj.system.service.IDictionaryDetailService;
import com.hoki.zj.system.service.IDictionaryTypeService;
import com.hoki.zj.utils.AjaxResult;
import com.hoki.zj.utils.QueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/dicDetail")
public class DictionaryDetController {

    /** 注解注入创建IDictionaryDetailService */
    @Autowired
    private IDictionaryDetailService dictionaryDetailService;

    /**
     * 1.添加/修改
     * @param
     * @return
     */
    @PutMapping
    public AjaxResult saveOrUpdate(@RequestBody DictionaryDetail dictionaryDetail) {
        try {
            if (dictionaryDetail.getId() == null) {
                // 添加
                dictionaryDetailService.save(dictionaryDetail);
            } else {
                // 修改
                dictionaryDetailService.update(dictionaryDetail);
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
            dictionaryDetailService.delete(id);
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
    public DictionaryDetail findOne(@PathVariable("id") Long id) {
        return dictionaryDetailService.findOne(id);
    }

    /**
     * 4.查询全部
     * @return
     */
    @GetMapping
    public List<DictionaryDetail> findAll() {
        return dictionaryDetailService.findAll();
    }

    /**
     * 5.分页/高级查询
     * @param query
     * @return
     */
    @PostMapping
    public QueryResult<DictionaryDetail> queryPage(@RequestBody DictionaryDetailQuery query) {
        return dictionaryDetailService.queryPage(query);
    }

    /**
     * 6.批量删除
     * @param ids
     */
    @PatchMapping
    public AjaxResult batchRemove(@RequestBody Long... ids) {
        try {
            dictionaryDetailService.batchRemove(ids);
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.me().setSuccess(false).setMessage(e.getMessage());
        }
    }


}
