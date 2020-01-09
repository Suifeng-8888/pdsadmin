package com.hniois.dao.machine.fix.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.machine.fix.FixDao;
import com.hniois.entity.machine.Fix;
import com.hniois.entity.machine.Fix;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("fixDaoImpl")
public class FixDaoImpl implements FixDao {

    @Autowired
    private DaoSupport dao;
    private String mapper = "FixMapper";

    @Override
    public void save(Fix e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Fix> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Fix e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Fix e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Fix e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Fix e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Fix find(Fix e) throws Exception {
        return (Fix)dao.find(mapper+".find",e);
    }

    @Override
    public List<Fix> findList(Fix e) throws Exception {
        return  (List<Fix> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Fix e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Fix e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
