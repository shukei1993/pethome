package com.hoki.zj.org.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.hoki.zj.basic.domain.BaseDomain;
import lombok.Data;

import java.util.Date;

@Data
public class Shop extends BaseDomain {

    private String name;
    private String tel;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date registerTime = new Date();

    /** 状态,实际业务在赋予意义 */
    private Integer state;

    private String address;

    private String logo;

    private Long admin_id;
}
