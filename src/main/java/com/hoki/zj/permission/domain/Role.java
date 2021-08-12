package com.hoki.zj.permission.domain;

import com.hoki.zj.basic.domain.BaseDomain;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Role extends BaseDomain{

    private String name;
    private String sn;
}
