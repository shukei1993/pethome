package com.hoki.zj.org.controller;

import com.hoki.zj.org.domain.Department;
import com.hoki.zj.org.query.DepartmentQuery;
import com.hoki.zj.org.service.IDepartmentService;
import com.hoki.zj.utils.AjaxResult;
import com.hoki.zj.utils.QueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

//@CrossOrigin // 添加响应头Access-Control-Allow-Origin,实现跨域,一般不推荐,使用配置类可以应用于所有controller
@RestController // @Controller + @ResponseBody
@RequestMapping("/dept")
public class DepartmentController {

    /** 注解注入创建IDepartmentService对象 */
    @Autowired
    private IDepartmentService departmentService;

    @PutMapping // Put请求 http://localhost:8080/dept
    public AjaxResult saveOrUpdate(@RequestBody Department department) { // @RequestBody 将json格式的数据接收到Department对象中
        System.out.println(department);
        try {
            if (department.getId() != null) { // 修改
                departmentService.update(department);
            } else { // 添加
                departmentService.save(department);
            }
            // 调用静态方法返回一个AjaxResult对象
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            // 如果有异常,返回一个有参的AjaxResult对象,打印报错信息
            return AjaxResult.me().setSuccess(false).setMessage(e.getMessage());
        }
    }

    /**
     * 1.删除功能
     * @param id
     * @return
     */
    @DeleteMapping("/{id}") // DELETE请求 "/{id}" url中名叫id的占位符， 通过@PathVariable("id")将占位符的数据取出,并装到形参Long id中
    public AjaxResult delete(@PathVariable("id") Long id) {
        try {
            departmentService.delete(id);
            // 调用静态方法返回一个AjaxResult对象
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            // 如果有异常,返回一个有参的AjaxResult对象,打印报错信息
            return AjaxResult.me().setSuccess(false).setMessage(e.getMessage());
        }
    }

    @GetMapping("/{id}") // GET请求 "/{id}" url中名叫id的占位符， 通过@PathVariable("id")将占位符的数据取出,并装到形参Long id中
    public Department findOne(@PathVariable("id") Long id) {
       return departmentService.findOne(id);
    }

    @GetMapping // GET请求 查询全部
    public List<Department> findAll() {
        return departmentService.findAll();
    }

    /**
     * 2.分页查询/高级查询
     * @param departmentQuery 接收前端传来的数据 currentPage 和 pageSize
     * @return
     */
    @PostMapping
    public QueryResult<Department> queryPage(@RequestBody DepartmentQuery departmentQuery) {
        // 调用方法查询数据
        return departmentService.queryPage(departmentQuery);
    }

    /**
     * 3.批量删除功能
     * @param ids
     * @return
     */
    @PatchMapping
    public AjaxResult batchDelete(@RequestBody Long... ids) {
        try {
            // 调用方法删除
            departmentService.batchRemove(ids);
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.me().setSuccess(false).setMessage(e.getMessage());
        }
    }
}
