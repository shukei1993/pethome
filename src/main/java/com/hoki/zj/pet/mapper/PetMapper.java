package com.hoki.zj.pet.mapper;

import com.hoki.zj.basic.mapper.BaseMapper;
import com.hoki.zj.pet.domain.Pet;

public interface PetMapper extends BaseMapper<Pet> {
    /** 上架 */
    void onSale(Long... ids);

    void offSale(Long... ids);

    /** 前台根据id展示详情数据 */
    Pet loadByPetId(Long id);
}
