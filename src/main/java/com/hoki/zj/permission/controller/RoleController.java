package com.hoki.zj.permission.controller;

import com.hoki.zj.permission.domain.Role;
import com.hoki.zj.permission.query.RoleQuery;
import com.hoki.zj.permission.service.IRoleService;
import com.hoki.zj.utils.AjaxResult;
import com.hoki.zj.utils.QueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/role")
public class RoleController {

    /** 注解注入创建IRoleService对象 */
    @Autowired
    private IRoleService roleService;

    /**
     * 1.添加/修改
     * put请求
     * @param role
     * @return
     */
    @PutMapping
    public AjaxResult saveOrUpdateRole(@RequestBody Role role) {
        try {
            if (role.getId() == null) { // 添加
                roleService.save(role);
            } else { // 修改
                roleService.update(role);
            }
            // 成功返回AjaxResult对象
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            // 失败返回错误信息
            return AjaxResult.me().setSuccess(false).setMessage(e.getMessage());
        }
    }

    /**
     * 2.删除单个角色
     * delete请求
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public AjaxResult deleteRoleById(@PathVariable("id") Long id) {
        try {
            roleService.delete(id);
            // 成功返回AjaxResult对象
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            // 失败返回错误信息
            return AjaxResult.me().setSuccess(false).setMessage(e.getMessage());
        }
    }

    /**
     * 3.查询单个角色
     * get请求
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public Role findRoleById(@PathVariable("id") Long id) {
        return roleService.findOne(id);
    }

    /**
     * 4.查询所有
     * @return
     */
    @GetMapping
    private List<Role> findAllRole() {
        return roleService.findAll();
    }

    /**
     * 5.高级/分页查询
     * @param roleQuery
     * @return 返回一个QueryResult对象
     */
    @PostMapping
    private QueryResult<Role> queryPage(@RequestBody RoleQuery roleQuery) {
        return roleService.queryPage(roleQuery);
    }
}
