package com.hoki.zj.org.service.impl;

import com.hoki.zj.basic.service.impl.BaseServiceImpl;
import com.hoki.zj.org.domain.Employee;
import com.hoki.zj.org.mapper.EmployeeMapper;
import com.hoki.zj.org.query.EmployeeQuery;
import com.hoki.zj.org.service.IEmployeeService;
import com.hoki.zj.utils.QueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class EmployeeServiceImpl extends BaseServiceImpl<Employee> implements IEmployeeService {

}
