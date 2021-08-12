package com.hoki.zj.test.org;

import com.hoki.zj.org.service.IDepartmentService;
import com.hoki.zj.test.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 部门测试类:DepartmentTest
 * 继承基础测试类:BaseTest
 */
public class DepartmentTest extends BaseTest {

    /** 注解注入创建IDepartmentService对象 */
    @Autowired
    private IDepartmentService departmentService;

    @Test
    public void testFind() throws Exception {
//        System.out.println(departmentService.findOne(8L));
        System.out.println(departmentService.findAll());
    }
}
