package com.hniois.trace.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.trace.dao.KeyContrlDao;
import com.hniois.trace.entity.Key_Control;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository("keyContrlDaoImpl")
public class KeyContrlDaoImpl implements KeyContrlDao {

    @Resource
    private DaoSupport dao;

    private String mapper = "ContrlMapper";

    @Override
    public void save(Key_Control e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Key_Control> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Key_Control e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Key_Control e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Key_Control e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Key_Control e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Key_Control find(Key_Control e) throws Exception {
        return (Key_Control)dao.find(mapper+".find",e);
    }

    @Override
    public List<Key_Control> findList(Key_Control e) throws Exception {
        return  (List<Key_Control> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Key_Control e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Key_Control e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }

}
