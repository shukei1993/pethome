package com.hoki.zj.org.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.hoki.zj.basic.domain.BaseDomain;
import lombok.Data;

import java.util.Date;

@Data
public class Shop extends BaseDomain {

    private String name;
    private String tel;

    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date registerTime;

    /** 0:待审核 1:通过  -1:驳回 */
    private Integer state;

    private String address;

    private String logo;

    /** 前端传过来的Employee对象,需要保存到shop和employee中 */
    private Employee admin;
    private Long admin_id;
}
