package com.hniois.dao.system.dept.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.system.dept.DeptDao;
import com.hniois.entity.system.Dept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("deptDaoImpl")
public class DeptDaoImpl implements DeptDao{
    @Autowired
    private DaoSupport dao;

    private String mapper = "DeptMapper";

    @Override
    public void save(Dept e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Dept> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Dept e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Dept e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Dept e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Dept e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Dept find(Dept e) throws Exception {
        return (Dept)dao.find(mapper+".find",e);
    }

    @Override
    public List<Dept> findList(Dept e) throws Exception {
        return  (List<Dept>)dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Dept e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Dept e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
