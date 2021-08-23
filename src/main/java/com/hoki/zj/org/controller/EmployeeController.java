package com.hoki.zj.org.controller;

import com.hoki.zj.org.domain.Employee;
import com.hoki.zj.org.query.EmployeeQuery;
import com.hoki.zj.org.service.IEmployeeService;
import com.hoki.zj.utils.AjaxResult;
import com.hoki.zj.utils.QueryResult;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

//@CrossOrigin // 添加响应头Access-Control-Allow-Origin,实现跨域,一般不推荐,使用配置类可以应用于所有controller
@RestController // @Controller + @ResponseBody
@RequestMapping("/emp")
public class EmployeeController {

    /** 注解注入创建IDepartmentService对象 */
    @Autowired
    private IEmployeeService employeeService;

    /**
     * 1.新增/修改
     * @param employee
     * @return
     */
    @PutMapping // Put请求
    public AjaxResult saveOrUpdateEmployee(@RequestBody Employee employee) {
        try {
            if (employee.getId() == null) { // 添加
                employeeService.save(employee);
            } else { // 否则就是修改
                employeeService.update(employee);
            }
            // 成功返回一个AjaxResult对象
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            // 失败提示信息
            return AjaxResult.me().setSuccess(false).setMessage(e.getMessage());
        }
    }

    /**
     * 2.删除单个
     * @param id
     * @return
     */
    @DeleteMapping("/{id}") // delete请求
    public AjaxResult deleteEmployee(@PathVariable("id") Long id) {
        try {
            // 调用方法删除
            employeeService.delete(id);
            // 成功返回一个AjaxResult对象
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            // 失败提示信息
            return AjaxResult.me().setSuccess(false).setMessage(e.getMessage());
        }
    }

    /**
     * 3.查询单个
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public Employee findEmployeeById(@PathVariable("id") Long id) {
        return employeeService.findOne(id);
    }

    /**
     * 4.GET请求 查询全部
     * @return
     */
    @GetMapping
    public List<Employee> findAll() {
        return employeeService.findAll();
    }

    /**
     * 5.分页/高级查询
     * @param employeeQuery 接收前端传过来的currentPage 和[AgeSize
     * @return
     */
    @PostMapping
    public QueryResult<Employee> queryPage(@RequestBody EmployeeQuery employeeQuery) {
        return employeeService.queryPage(employeeQuery);
    }

    /**
     * 批量删除员工
     * @param ids
     * @return
     */
    @PatchMapping
    public AjaxResult batchRemoveEmpById (@RequestBody Long... ids) {
        try {
            // 调用方法删除
            employeeService.batchRemove(ids);
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.me().setSuccess(false).setMessage(e.getMessage());
        }
    }

    /**
     * 店铺审核通过,激活店铺管理账户
     * @param id
     * @return
     */
    @GetMapping("/change/{id}")
    public AjaxResult changeStateByEmpId(@PathVariable("id") Long id) {
        try {
            employeeService.changeStateByEmpId(id);
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.me().setSuccess(false).setMessage(e.getMessage());
        }
    }

    /**
     * 后台用户登录
     * @param map
     * @return
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestBody Map<String, String> map) {
        try {
//            System.out.println(map);
            Map<String, Object> returnMap = employeeService.login(map);
            // 将返回的returnMap返回给前端
            return AjaxResult.me().setResultObj(returnMap);
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxResult(e.getMessage());
        }
    }
}
