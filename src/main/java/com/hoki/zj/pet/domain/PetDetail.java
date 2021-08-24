package com.hoki.zj.pet.domain;

import com.hoki.zj.basic.domain.BaseDomain;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PetDetail extends BaseDomain {

    private Long pet_id;
    // 领养须知
    private String adoptNotice;
    // 宠物详情
    private String intro;
}
