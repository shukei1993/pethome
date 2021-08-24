package com.hoki.zj.pet.controller;

import com.hoki.zj.pet.domain.Pet;
import com.hoki.zj.pet.mapper.PetMapper;
import com.hoki.zj.pet.query.PetQuery;
import com.hoki.zj.pet.service.IPetService;
import com.hoki.zj.utils.AjaxResult;
import com.hoki.zj.utils.QueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/pet")
public class PetController {
    
    /** 注入IPetService对象 */
    @Autowired
    private IPetService petService;

    /**
     * 1.分页高级查询
     * @param petQuery
     * @param request
     * @return
     */
    @PostMapping("/queryPage")
    public QueryResult<Pet> queryPage(@RequestBody PetQuery petQuery, HttpServletRequest request) {
        return petService.queryPage(petQuery, request);
    }

    /**
     * 2.添加修改
     * @param pet
     * @return
     */
    @PutMapping // Put请求
    public AjaxResult saveOrUpdate(@RequestBody Pet pet, HttpServletRequest request) {
        try {
//            System.out.println(pet);
//            System.out.println(pet.getId());
//            System.out.println(pet.getPetDetail().getId());
            if (pet.getId() != null) { // 修改
                petService.update(pet);
            } else { // 添加
                petService.save(pet, request);
            }
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.me().setSuccess(false).setMessage(e.getMessage());
        }
    }

    /**
     * 3.上架
     * @param ids
     * @return
     */
    @PatchMapping("/onSale")
    public AjaxResult onSale(@RequestBody Long... ids) {
        try {
            petService.onSale(ids);
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.me().setSuccess(false).setMessage(e.getMessage());
        }
    }

    /**
     * 3.上架
     * @param ids
     * @return
     */
    @PatchMapping("/offSale")
    public AjaxResult offSale(@RequestBody Long... ids) {
        try {
            petService.offSale(ids);
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.me().setSuccess(false).setMessage(e.getMessage());
        }
    }

}
