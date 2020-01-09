package com.hniois.dao.purchase.purapply.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.purchase.purapply.PurApplyDao;
import com.hniois.entity.purchase.PurApply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("purApplyDaoImpl")
public class PurApplyDaoImpl implements PurApplyDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "PurApplyMapper";

    @Override
    public void save(PurApply e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<PurApply> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(PurApply e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(PurApply e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(PurApply e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(PurApply e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public PurApply find(PurApply e) throws Exception {
        return (PurApply)dao.find(mapper+".find",e);
    }

    @Override
    public List<PurApply> findList(PurApply e) throws Exception {
        return  (List<PurApply> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(PurApply e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(PurApply e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
