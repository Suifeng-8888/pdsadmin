package com.hniois.trace.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.trace.dao.ProduceSiteDao;
import com.hniois.trace.entity.ProduceSite;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Create By javaMan
 * 2018/7/3  15:45
 * 生产地址  daoImpl.......
 */
@Repository(value = "produceSiteDao")
public class ProduceSiteDaoImpl implements ProduceSiteDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "ProduceSiteMapper";

    @Override
    public void save(ProduceSite produceSite) throws Exception {
        dao.save(mapper + ".save", produceSite);
    }

    @Override
    public void saveBatch(List<ProduceSite> e) throws Exception {

    }

    @Override
    public void delete(ProduceSite produceSite) throws Exception {
        dao.delete(mapper + ".delete", produceSite);
    }

    @Override
    public void deleteBatch(ProduceSite produceSite) throws Exception {
        dao.delete(mapper + ".batchDelete", produceSite);
    }

    @Override
    public void update(ProduceSite produceSite) throws Exception {
        dao.update(mapper + ".update", produceSite);
    }

    @Override
    public void updateBatch(ProduceSite produceSite) throws Exception {

    }

    @Override
    public ProduceSite find(ProduceSite produceSite) throws Exception {
        return (ProduceSite) dao.find(mapper + ".find", produceSite);
    }

    @Override
    public List<ProduceSite> findList(ProduceSite produceSite) throws Exception {
        return null;
    }

    @Override
    public int findCount(ProduceSite produceSite) throws Exception {
        return 0;
    }

    @Override
    public Page findPage(ProduceSite produceSite) throws Exception {
        return dao.findPage(mapper + ".findPage", mapper + ".findPageCount", produceSite);
    }
}
