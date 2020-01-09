package com.hniois.dao.purchase.supplier.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.purchase.supplier.SupplierDao;
import com.hniois.entity.purchase.Supplier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;
@Repository("supplierDaoImpl")
public class SupplierDaoImpl implements SupplierDao {
    @Autowired
    private DaoSupport dao;

    private String mapper = "SupplierMapper";

    @Override
    public void save(Supplier e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Supplier> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Supplier e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Supplier e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Supplier e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Supplier e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Supplier find(Supplier e) throws Exception {
        return (Supplier)dao.find(mapper+".find",e);
    }

    @Override
    public List<Supplier> findList(Supplier e) throws Exception {
        return  (List<Supplier> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Supplier e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Supplier e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }


    @Override
    public List<Supplier> findlistByIds(Supplier e) throws Exception {
        return (List<Supplier> )dao.findList(mapper+".findListById",e);
    }
}
