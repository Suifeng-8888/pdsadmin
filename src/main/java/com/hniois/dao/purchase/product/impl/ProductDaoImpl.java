package com.hniois.dao.purchase.product.impl;
import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;

import com.hniois.entity.purchase.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;
import com.hniois.dao.purchase.product.ProductDao;


@Repository("productDaoImpl")
public class ProductDaoImpl implements ProductDao {
    @Autowired
    private DaoSupport dao;

    private String mapper = "ProductMapper";

    @Override
    public void save(Product e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Product> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Product e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Product e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Product e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Product e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Product find(Product e) throws Exception {
        return (Product)dao.find(mapper+".find",e);
    }

    @Override
    public List<Product> findList(Product e) throws Exception {
        return  (List<Product> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Product e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Product e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }


}
