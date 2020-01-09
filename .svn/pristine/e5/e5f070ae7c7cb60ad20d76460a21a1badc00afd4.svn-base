package com.hniois.dao.purchase.finance.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.purchase.finance.FinanceDao;
import com.hniois.entity.machine.Apply;
import com.hniois.entity.purchase.Finance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("financeDaoImpl")
public class FinanceDaoImpl implements FinanceDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "FinanceMapper";

    @Override
    public void save(Finance e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Finance> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Finance e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Finance e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Finance e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Finance e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Finance find(Finance e) throws Exception {
        return (Finance)dao.find(mapper+".find",e);
    }

    @Override
    public List<Finance> findList(Finance e) throws Exception {
        return  (List<Finance> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Finance e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Finance e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
