package com.hoki.zj.org.domain;

import com.hoki.zj.basic.domain.BaseDomain;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // 复合注解 getter setter toString
@NoArgsConstructor // 无参构造
@AllArgsConstructor // 全参数有参构造
public class Department extends BaseDomain {

    /** 部门编号 */
    private String sn;
    /** 部门名 */
    private String name;
    /** 部门状态 0是禁用 1是启用 */
    private Integer state;
    /** 主管 */
    private Long manager_id;
    private Employee manager;
    
    /** 父级部门 */
    private Long parent_id;
    private Department parent;
    
}
