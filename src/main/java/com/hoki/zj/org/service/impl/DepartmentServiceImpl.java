package com.hoki.zj.org.service.impl;

import com.hoki.zj.basic.service.impl.BaseServiceImpl;
import com.hoki.zj.org.domain.Department;
import com.hoki.zj.org.mapper.DepartmentMapper;
import com.hoki.zj.org.query.DepartmentQuery;
import com.hoki.zj.org.service.IDepartmentService;
import com.hoki.zj.utils.QueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class DepartmentServiceImpl extends BaseServiceImpl<Department> implements IDepartmentService {

}
