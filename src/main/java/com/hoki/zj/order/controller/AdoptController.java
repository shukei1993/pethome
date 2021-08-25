package com.hoki.zj.order.controller;

import com.hoki.zj.order.service.IAdoptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/adopt")
public class AdoptController {

    /** 注解注入IAdoptService对象 */
    @Autowired
    private IAdoptService adoptService;


}
