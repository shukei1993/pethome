package com.hoki.zj.permission.service.impl;

import com.hoki.zj.basic.service.impl.BaseServiceImpl;
import com.hoki.zj.permission.domain.Role;
import com.hoki.zj.permission.mapper.RoleMapper;
import com.hoki.zj.permission.query.RoleQuery;
import com.hoki.zj.permission.service.IRoleService;
import com.hoki.zj.utils.QueryResult;
import jdk.management.resource.internal.TotalResourceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RoleServiceImpl extends BaseServiceImpl<Role> implements IRoleService {

    @Autowired
    private RoleMapper roleMapper;

    /**
     * 1.重写删除方法
     * 因为有外键,所有还必须要删除相应的外键对应的表的数据
     * @param id
     */
    @Override
    @Transactional
    public void delete(Long id) {
        roleMapper.deleteEmployeeRoleByRoleId(id);
        roleMapper.deleteRolePermissionByRoleId(id);
        roleMapper.delete(id);
    }

}
