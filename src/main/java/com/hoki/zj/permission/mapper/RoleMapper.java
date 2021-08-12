package com.hoki.zj.permission.mapper;

import com.hoki.zj.basic.mapper.BaseMapper;
import com.hoki.zj.permission.domain.Role;

public interface RoleMapper extends BaseMapper<Role> {

    /** 重写删除方法 */
    @Override
    void delete(Long id);

    /** 删除外键 */
    void deleteEmployeeRoleByRoleId(Long id);
    /** 删除外键 */
    void deleteRolePermissionByRoleId(Long id);
}
