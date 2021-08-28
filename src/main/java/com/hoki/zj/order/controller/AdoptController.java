package com.hoki.zj.order.controller;

import com.hoki.zj.order.service.IAdoptService;
import com.hoki.zj.utils.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RestController
@RequestMapping("/adopt")
public class AdoptController {

    /** 注解注入IAdoptService对象 */
    @Autowired
    private IAdoptService adoptService;

    /**
     * 1.订单生成
     * @param map {pet_id=2, address_id=1, payment_way=AliPay}
     * @return
     */
    @PostMapping("/order")
    public AjaxResult createOrder(@RequestBody Map<String, String> map, HttpServletRequest request) {
//        System.out.println(map);
        adoptService.createOrder(map, request);
        return AjaxResult.me();
    }
}
