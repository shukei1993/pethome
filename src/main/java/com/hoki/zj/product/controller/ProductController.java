package com.hoki.zj.product.controller;

import com.hoki.zj.product.domain.Product;
import com.hoki.zj.product.query.ProductQuery;
import com.hoki.zj.product.service.IProductService;
import com.hoki.zj.utils.AjaxResult;
import com.hoki.zj.utils.QueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/product")
public class ProductController {

    /**
     * 注解注入IProductService
     */
    @Autowired
    private IProductService productService;

    /**
     * 1.后台服务管理模块分页/高级查询
     *
     * @return QueryResult
     */
    @PostMapping("/queryPage")
    public QueryResult<Product> queryPage(@RequestBody ProductQuery productQuery) {
        return productService.queryPage(productQuery);
    }

    /**
     * 2.删除
     * @param id 删除数据的id
     * @return AjaxResult
     */
    @DeleteMapping("/{id}")
    public AjaxResult removeProduct(@PathVariable("id") Long id) {
        try {
            productService.delete(id);
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxResult(e.getMessage());
        }
    }

    /**
     * 3.添加或者保存
     * @return AjaxResult
     */
    @PutMapping
    public AjaxResult saveOrUpdate(@RequestBody Product product) {
        try {
            if (product.getId() != null) { // 修改
                productService.update(product);
            } else { // 添加
                productService.save(product);
            }
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxResult(e.getMessage());
        }
    }

    /**
     * 3.上架
     * @param ids 上架的数据
     * @return AjaxResult
     */
    @PatchMapping("/onSale")
    public AjaxResult onSale(@RequestBody Long... ids) {
//        System.out.println(ids[0]);
        try {
            productService.onSale(ids);
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.me().setSuccess(false).setMessage(e.getMessage());
        }
    }

    /**
     * 5.下架
     * @param ids 下架的数据
     * @return AjaxResult
     */
    @PatchMapping("/offSale")
    public AjaxResult offSale(@RequestBody Long... ids) {
        try {
            productService.offSale(ids);
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.me().setSuccess(false).setMessage(e.getMessage());
        }
    }

    /**
     * 5.详情页面展示
     * @param id
     * @return
     */
    @GetMapping("/detail/{id}")
    public Product loadByPetIdForFront(@PathVariable("id") Long id) {
        return productService.loadByProductId(id);
    }

}
