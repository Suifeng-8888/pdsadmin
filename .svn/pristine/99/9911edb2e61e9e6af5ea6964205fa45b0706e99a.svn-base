package com.hniois.trace.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.trace.dao.RetailerDao;
import com.hniois.trace.entity.Retailer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Create By javaMan
 * 2018/6/29  9:06
 *
 * 追溯   销售商daoImpl
 */
@Repository(value = "retailerDao")
public class RetailerDaoImpl implements RetailerDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "RetailerMapper";

    @Override
    public void save(Retailer retailer) throws Exception {
        dao.save(mapper + ".save", retailer);
    }

    @Override
    public void saveBatch(List<Retailer> e) throws Exception {

    }

    @Override
    public void delete(Retailer retailer) throws Exception {
        dao.delete(mapper + ".delete", retailer);
    }

    @Override
    public void deleteBatch(Retailer retailer) throws Exception {
        dao.delete(mapper + ".batchDelete", retailer);
    }

    @Override
    public void update(Retailer retailer) throws Exception {
        dao.update(mapper + ".update", retailer);
    }

    @Override
    public void updateBatch(Retailer retailer) throws Exception {

    }

    @Override
    public Retailer find(Retailer retailer) throws Exception {
        return (Retailer) dao.find(mapper + ".find", retailer);
    }

    @Override
    public List<Retailer> findList(Retailer retailer) throws Exception {
        return null;
    }

    @Override
    public int findCount(Retailer retailer) throws Exception {
        return 0;
    }

    @Override
    public Page findPage(Retailer retailer) throws Exception {
        return dao.findPage(mapper + ".findPage", mapper + ".findPageCount", retailer);
    }
}
