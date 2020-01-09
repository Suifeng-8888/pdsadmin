package com.hniois.dao.quartz.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.quartz.CheckQuartDao;
import com.hniois.entity.machine.Apply;
import com.hniois.entity.quartz.CheckQuartz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("checkQuartzDaoImpl")
public class CheckQuartzDaoImpl implements CheckQuartDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "QuartzMapper";

    @Override
    public void save(CheckQuartz e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<CheckQuartz> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(CheckQuartz e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(CheckQuartz e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(CheckQuartz e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(CheckQuartz e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public CheckQuartz find(CheckQuartz e) throws Exception {
        return (CheckQuartz)dao.find(mapper+".find",e);
    }

    @Override
    public List<CheckQuartz> findList(CheckQuartz e) throws Exception {
        return  (List<CheckQuartz> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(CheckQuartz e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(CheckQuartz e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
