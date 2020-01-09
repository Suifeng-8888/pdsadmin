package com.hniois.service.purchase.product.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.purchase.product.ProductDao;
import com.hniois.entity.purchase.Product;
import com.hniois.service.purchase.product.ProductManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("productService")
public class ProductService extends ServiceSupport<Product,ProductDao> implements ProductManage {
    @Resource(name="productDaoImpl")
    @Override
    public void setDao(ProductDao dao) {
        this.dao = dao;
    }
}
