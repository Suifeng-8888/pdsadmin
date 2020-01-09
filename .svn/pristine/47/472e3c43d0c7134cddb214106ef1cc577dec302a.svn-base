package com.hniois.dao.system.user.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.system.user.UserDao;
import com.hniois.entity.system.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao{
    @Autowired
    private DaoSupport dao;

    private String mapper = "UserMapper";

    @Override
    public void save(User e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<User> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(User e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(User e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(User e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(User e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public User find(User e) throws Exception {
        return (User)dao.find(mapper+".find",e);
    }

    @Override
    public List<User> findList(User e) throws Exception {
        return  (List<User> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(User e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(User e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
