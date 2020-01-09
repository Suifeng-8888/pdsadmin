package com.hniois.dao.tempFiled.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.tempFiled.TempFiledDao;
import com.hniois.entity.tempFiled.TempFiled;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
*  模板明细 DaoImpl
*/
@Repository("tempFiledDaoImpl")
public class TempFiledDaoImpl implements TempFiledDao{
    @Autowired
    private DaoSupport dao;

    private String mapper = "TempFiledMapper";

    @Override
    public void save(TempFiled e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<TempFiled> e) throws Exception {
    dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(TempFiled e) throws Exception {
    dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(TempFiled e) throws Exception {
    dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(TempFiled e) throws Exception {
    dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(TempFiled e) throws Exception {
    dao.update(mapper+".updateBatch",e);
    }

    @Override
    public TempFiled find(TempFiled e) throws Exception {
    return (TempFiled)dao.find(mapper+".find",e);
    }

    @Override
    public List<TempFiled> findList(TempFiled e) throws Exception {
        return  (List<TempFiled> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(TempFiled e) throws Exception { 
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(TempFiled e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    } 
            
}
