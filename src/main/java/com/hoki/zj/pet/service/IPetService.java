package com.hoki.zj.pet.service;

import com.hoki.zj.basic.service.IBaseService;
import com.hoki.zj.pet.domain.Pet;
import com.hoki.zj.pet.query.PetQuery;
import com.hoki.zj.utils.QueryResult;

import javax.servlet.http.HttpServletRequest;

public interface IPetService extends IBaseService<Pet> {

    /** 分页查询当前用户 */
    QueryResult<Pet> queryPage(PetQuery petQuery, HttpServletRequest request);

    /** 添加 */
    void save(Pet pet, HttpServletRequest request);

    /** 上架 */
    void onSale(Long... ids);

    /** 下架 */
    void offSale(Long... ids);

    /** 前台根据id展示详情数据 */
    Pet loadByPetId(Long id);
}
