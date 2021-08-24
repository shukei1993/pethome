package com.hoki.zj.pet.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.hoki.zj.basic.domain.BaseDomain;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Pet extends BaseDomain{
    private String name;
    private String resources;
    // 售价
    private BigDecimal saleprice;

    // 下架时间
    @JsonFormat(pattern = "yyyy-MM-dd, HH:mm:ss", timezone = "GMT+8")
    private Date offsaletime;
    // 上架时间
    @JsonFormat(pattern = "yyyy-MM-dd, HH:mm:ss", timezone = "GMT+8")
    private Date onsaletime;

    private Integer state;

    // 成本
    private BigDecimal costprice;
    private Date createtime = new Date();
    private Long type_id;
    private Long shop_id;
    private Long user_id;
    /** 关联查询 */
    private PetDetail petDetail;
}
