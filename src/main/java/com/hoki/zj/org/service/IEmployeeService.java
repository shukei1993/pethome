package com.hoki.zj.org.service;

import com.hoki.zj.basic.service.IBaseService;
import com.hoki.zj.org.domain.Employee;

public interface IEmployeeService extends IBaseService<Employee> {

    /** 审核通过修改用户状态 */
    void changeStateByEmpId(Long id);
}
