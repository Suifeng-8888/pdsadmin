package com.hniois.trace.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.trace.dao.AptitudeDao;
import com.hniois.trace.entity.Aptitude;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Create By javaMan
 * 2018/6/26  9:39
 * 企业资质 daoImpl
 */
@Repository(value = "aptitudeDao")
public class AptitudeDaoImpl implements AptitudeDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "AptitudeMapper";


    @Override
    public void save(Aptitude aptitude) throws Exception {
        dao.save(mapper + ".save", aptitude);
    }

    @Override
    public void saveBatch(List<Aptitude> e) throws Exception {

    }

    @Override
    public void delete(Aptitude aptitude) throws Exception {
        dao.delete(mapper + ".delete", aptitude);
    }

    @Override
    public void deleteBatch(Aptitude aptitude) throws Exception {
        dao.delete(mapper + ".batchDelete", aptitude);
    }

    @Override
    public void update(Aptitude aptitude) throws Exception {
        dao.update(mapper + ".update", aptitude);
    }

    @Override
    public void updateBatch(Aptitude aptitude) throws Exception {

    }

    @Override
    public Aptitude find(Aptitude aptitude) throws Exception {
        return (Aptitude) dao.find(mapper + ".find", aptitude);
    }

    @Override
    public List<Aptitude> findList(Aptitude aptitude) throws Exception {
        return null;
    }

    @Override
    public int findCount(Aptitude aptitude) throws Exception {
        return 0;
    }

    /**
     * 分页
     * @param aptitude
     * @return
     * @throws Exception
     */
    @Override
    public Page findPage(Aptitude aptitude) throws Exception {
        return dao.findPage(mapper + ".findPage", mapper + ".findPageCount", aptitude);
    }
}
