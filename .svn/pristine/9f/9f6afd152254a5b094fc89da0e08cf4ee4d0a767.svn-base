package com.hniois.dao.purchase.purapprove.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.purchase.purapprove.PurApproveDao;
import com.hniois.entity.machine.Apply;
import com.hniois.entity.purchase.PurApprove;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("purApproveDaoImpl")
public class PurApproveDaoImpl implements PurApproveDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "PurApproveMapper";

    @Override
    public void save(PurApprove e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<PurApprove> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(PurApprove e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(PurApprove e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(PurApprove e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(PurApprove e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public PurApprove find(PurApprove e) throws Exception {
        return (PurApprove)dao.find(mapper+".find",e);
    }

    @Override
    public List<PurApprove> findList(PurApprove e) throws Exception {
        return  (List<PurApprove> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(PurApprove e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(PurApprove e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }

    @Override
    public List<PurApprove> findlistByIds(PurApprove e)throws Exception {
        return (List<PurApprove> )dao.findList(mapper+".findListById",e);
    }
}
