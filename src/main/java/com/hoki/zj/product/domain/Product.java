package com.hoki.zj.product.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.hoki.zj.basic.domain.BaseDomain;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigDecimal;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product extends BaseDomain {

    /** 服务名 */
    private String name;

    /** 图片展示 */
    private String resources;

    /** 售价 */
    private BigDecimal saleprice;

    /** 下架时间 */
    @JsonFormat(pattern = "yyyy-MM-dd, HH:mm:ss", timezone = "GMT+8")
    private Date offsaletime;
    /** 上架时间 */
    @JsonFormat(pattern = "yyyy-MM-dd, HH:mm:ss", timezone = "GMT+8")
    private Date onsaletime;

    /** 状态 0下架 1上架 */
    private Integer state;
    /** 成本价 */
    private String costprice;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd, HH:mm:ss", timezone = "GMT+8")
    private Date createtime;
    /** 销量 */
    private Long salecount;

    /** 服务详情 */
    private ProductDetail productDetail;
}
