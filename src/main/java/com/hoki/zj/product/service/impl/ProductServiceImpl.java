package com.hoki.zj.product.service.impl;

import com.hoki.zj.basic.service.impl.BaseServiceImpl;
import com.hoki.zj.product.domain.Product;
import com.hoki.zj.product.domain.ProductDetail;
import com.hoki.zj.product.mapper.ProductDetailMapper;
import com.hoki.zj.product.mapper.ProductMapper;
import com.hoki.zj.product.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Date;

@Service
public class ProductServiceImpl extends BaseServiceImpl<Product> implements IProductService {

    /** 注解注入ProductDetailMapper */
    @Autowired
    private ProductDetailMapper productDetailMapper;

    /** 注解注入ProductMapper */
    @Autowired
    private ProductMapper productMapper;

    /**
     * 1.添加服务
     * @param product 服务
     */
    @Override
    public void save(Product product) {
        // 设置服务状态为默认下架
        product.setState(0);
        // 设置服务的创建时间
        product.setCreatetime(new Date());
        // 设置服务的销量默认0
        product.setSalecount(0L);
        // 保存到数据库并且返回生成的主键
        super.save(product);
        // 获取product中的produtcDetail对象
        ProductDetail productDetail = product.getProductDetail();
        // 设置服务id
        productDetail.setProduct_id(product.getId());
        // 保存到数据库
        productDetailMapper.save(productDetail);
    }

    /**
     * 2.修改服务
     * @param product 服务
     */
    @Override
    public void update(Product product) {
        super.update(product);
        productDetailMapper.update(product.getProductDetail());
    }

    /**
     * 上架
     * @param ids
     */
    @Override
    public void onSale(Long... ids) {
        productMapper.onSale(ids);
    }

    /**
     * 下架
     * @param ids
     */
    @Override
    public void offSale(Long... ids) {
        productMapper.offSale(ids);
    }

    @GetMapping("/detail/{id}")
    @Override
    public Product loadByProductId(@PathVariable("id") Long id) {
        return productMapper.loadByProductId(id);
    }
}
