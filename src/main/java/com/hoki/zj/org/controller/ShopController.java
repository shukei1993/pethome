package com.hoki.zj.org.controller;

import com.hoki.zj.org.domain.Shop;
import com.hoki.zj.org.query.ShopQuery;
import com.hoki.zj.org.service.IShopService;
import com.hoki.zj.utils.AjaxResult;
import com.hoki.zj.utils.QueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/shop")
public class ShopController {

    /** 注解注入创建IShopService对象 */
    @Autowired
    private IShopService shopService;

    /**
     * 1.新增/修改
     * @param shop
     * @return
     */
    @PutMapping
    public AjaxResult saveOrUpdateShop(@RequestBody Shop shop) {
        try {
            if (shop.getId() == null) { // 添加
                shopService.save(shop);
            } else { // 修改
                shopService.update(shop);
            }
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.me().setSuccess(false).setMessage(e.getMessage());
        }
    }

    /**
     * 2.删除单条
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public AjaxResult deleteShopById(@PathVariable("id") Long id) {
        try {
            shopService.delete(id);
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.me().setSuccess(false).setMessage(e.getMessage());
        }
    }

    /**
     * 3.查询单条
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public Shop findShopById(@PathVariable("id") Long id) {
        return shopService.findOne(id);
    }

    /**
     * 4.查询全部
     * @return
     */
    @GetMapping
    public List<Shop> findAllShop() {
        return shopService.findAll();
    }

    /**
     * 5.分页高级查询
     * @param shopQuery
     * @return
     */
    @PostMapping
    public QueryResult<Shop> queryPageForShop(@RequestBody ShopQuery shopQuery) {
        return shopService.queryPage(shopQuery);
    }
}
