package com.hniois.dao.purchase.result.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.purchase.result.ResultDao;
import com.hniois.entity.purchase.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("resultDaoImpl")
public class ResultDaoImpl implements ResultDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "ResultMapper";

    @Override
    public void save(Result e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Result> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Result e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Result e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Result e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Result e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Result find(Result e) throws Exception {
        return (Result)dao.find(mapper+".find",e);
    }

    @Override
    public List<Result> findList(Result e) throws Exception {
        return  (List<Result> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Result e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Result e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }


}
