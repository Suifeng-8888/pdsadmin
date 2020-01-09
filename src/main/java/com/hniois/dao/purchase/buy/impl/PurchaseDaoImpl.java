package com.hniois.dao.purchase.buy.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.purchase.buy.PurChaseDao;
import com.hniois.entity.machine.Apply;
import com.hniois.entity.purchase.Purchase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurChaseDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "PurchaseMapper";

    @Override
    public void save(Purchase e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Purchase> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Purchase e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Purchase e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Purchase e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Purchase e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Purchase find(Purchase e) throws Exception {
        return (Purchase)dao.find(mapper+".find",e);
    }

    @Override
    public List<Purchase> findList(Purchase e) throws Exception {
        return  (List<Purchase> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Purchase e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Purchase e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }

    @Override
    public List<Purchase> sendRecord(Purchase e) throws Exception {
        return(List<Purchase> )dao.findList(mapper+".sendRecord",e);
    }
}
