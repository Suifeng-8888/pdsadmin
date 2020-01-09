package com.hniois.common.service;

import com.hniois.common.dao.Dao;
import com.hniois.common.page.Page;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Dao基础服务
 * @author liuhao 2018-03
 * */
public abstract class ServiceSupport <E extends Page, DAO extends Dao<E>> implements Service<E>{
    //Dao基础服务
    protected DAO dao;

    public DAO getDao() {return dao;}
    public abstract void setDao(DAO dao);

    @Override
    public void save(E e) throws Exception {
        dao.save(e);
    }

    @Override
    public void saveBatch(List<E> e) throws Exception {
        dao.saveBatch(e);
    }

    @Override
    public void delete(E e) throws Exception {
        dao.delete(e);
    }

    @Override
    public void deleteBatch(E e) throws Exception {
        dao.deleteBatch(e);
    }

    @Override
    public void update(E e) throws Exception {
        dao.update(e);
    }

    @Override
    public void updateBatch(E e) throws Exception {
        dao.updateBatch(e);
    }

    @Override
    public E find(E e) throws Exception {
        return dao.find(e);
    }

    @Override
    public List<E> findList(E e) throws Exception {
        return dao.findList(e);
    }

    @Override
    public int findCount(E e) throws Exception {
        return dao.findCount(e);
    }

    @Override
    public Page findPage(E e) throws Exception {
        return dao.findPage(e);
    }
}
