package com.hniois.dao.machine.apply.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.machine.apply.ApplyDao;
import com.hniois.entity.machine.Apply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("applyDaoImpl")
public class ApplyDaoImpl implements ApplyDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "ApplyMapper";

    @Override
    public void save(Apply e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Apply> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Apply e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Apply e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Apply e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Apply e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Apply find(Apply e) throws Exception {
        return (Apply)dao.find(mapper+".find",e);
    }

    @Override
    public List<Apply> findList(Apply e) throws Exception {
        return  (List<Apply> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Apply e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Apply e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
