package com.hoki.zj.org.service;

import com.hoki.zj.basic.service.IBaseService;
import com.hoki.zj.org.domain.Employee;

import java.util.Map;

public interface IEmployeeService extends IBaseService<Employee> {

    /** 1.审核通过修改用户状态 */
    void changeStateByEmpId(Long id);

    /** 2.后台用户登录 */
    Map<String, Object> login(Map<String, String> map);
}
