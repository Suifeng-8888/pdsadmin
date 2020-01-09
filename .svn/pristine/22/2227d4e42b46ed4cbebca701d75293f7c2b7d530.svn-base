package com.hniois.dao.system.role.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.system.role.RoleDao;
import com.hniois.entity.system.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("roleDaoImpl")
public class RoleDaoImpl implements RoleDao{
    @Autowired
    private DaoSupport dao;

    private String mapper = "RoleMapper";

    @Override
    public void save(Role e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Role> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Role e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Role e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Role e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Role e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Role find(Role e) throws Exception {
        return  (Role)dao.find(mapper+".find",e);
    }

    @Override
    public List<Role> findList(Role e) throws Exception {
        return  (List<Role> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Role e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Role e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
