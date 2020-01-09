package com.hniois.trace.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.trace.dao.BagDao;
import com.hniois.trace.entity.Bag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("bagDaoImpl")
public class BagDaoImpl implements BagDao {
    @Autowired
    private DaoSupport dao;

    private String mapper = "BagMapper";

    @Override
    public void save(Bag e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Bag> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Bag e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Bag e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Bag e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Bag e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Bag find(Bag e) throws Exception {
        return (Bag)dao.find(mapper+".find",e);
    }

    @Override
    public List<Bag> findList(Bag e) throws Exception {
        return  (List<Bag>)dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Bag e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Bag e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
