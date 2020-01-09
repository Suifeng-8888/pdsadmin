package com.hniois.dao.demo.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.demo.DemoDao;
import com.hniois.entity.demo.Demo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("demoDaoImpl")
public class DemoDaoImpl implements DemoDao {
    @Autowired
    private DaoSupport dao;

    private String mapper = "DemoMapper";

    @Override
    public void save(Demo e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Demo> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Demo e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Demo e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Demo e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Demo e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Demo find(Demo e) throws Exception {
        return  (Demo)dao.find(mapper+".find",e);
    }

    @Override
    public List<Demo> findList(Demo e) throws Exception {
        return  (List<Demo> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Demo e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Demo e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }

    @Override
    public List<Demo> findTableField(Demo e) throws Exception {
        return  (List<Demo> )dao.findList(mapper+".findTableField",e);
    }

}
