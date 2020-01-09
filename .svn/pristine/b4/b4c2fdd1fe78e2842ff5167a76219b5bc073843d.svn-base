package com.hniois.dao.machine.check.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.machine.check.CheckDao;
import com.hniois.entity.machine.Check;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository("checkDaoImpl")
public class CheckDaoImpl implements CheckDao {

    @Resource
    private DaoSupport dao;
    private String mapper = "CheckMapper";
    
    @Override
    public void save(Check e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Check> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Check e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Check e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Check e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Check e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Check find(Check e) throws Exception {
        return  (Check)dao.find(mapper+".find",e);
    }

    @Override
    public List<Check> findList(Check e) throws Exception {
        return  (List<Check> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Check e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Check e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }

    @Override
    public List<Check> sendCheck(Check e) throws Exception {
        return (List<Check> )dao.findList(mapper+".sendCheck",e);
    }
}
