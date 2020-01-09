package com.hniois.dao.temp.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.temp.TempDao;
import com.hniois.entity.temp.Temp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
*  模板 DaoImpl
*/
@Repository("tempDaoImpl")
public class TempDaoImpl implements TempDao{
    @Autowired
    private DaoSupport dao;

    private String mapper = "TempMapper";

    @Override
    public void save(Temp e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Temp> e) throws Exception {
    dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Temp e) throws Exception {
    dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Temp e) throws Exception {
    dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Temp e) throws Exception {
    dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Temp e) throws Exception {
    dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Temp find(Temp e) throws Exception {
    return (Temp)dao.find(mapper+".find",e);
    }

    @Override
    public List<Temp> findList(Temp e) throws Exception {
        return  (List<Temp> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Temp e) throws Exception { 
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Temp e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    } 
            
}
