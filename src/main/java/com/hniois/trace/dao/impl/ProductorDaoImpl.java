package com.hniois.trace.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.trace.dao.ProductorDao;
import com.hniois.trace.entity.Productor;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository("productorDaoImpl")
public class ProductorDaoImpl implements ProductorDao {
    @Resource
    private DaoSupport dao;

    private String mapper = "zsProductMapper";

    @Override
    public void save(Productor e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Productor> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Productor e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Productor e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Productor e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Productor e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Productor find(Productor e) throws Exception {
        return (Productor)dao.find(mapper+".find",e);
    }

    @Override
    public List<Productor> findList(Productor e) throws Exception {
        return  (List<Productor> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Productor e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Productor e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
