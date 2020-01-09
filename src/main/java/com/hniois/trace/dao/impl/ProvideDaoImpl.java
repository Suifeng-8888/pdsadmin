package com.hniois.trace.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.trace.dao.ProvideDao;
import com.hniois.trace.entity.Provide;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Create By javaMan
 * 2018/6/28  10:41
 * 追溯  供应商  daoImpl...
 */
@Repository(value = "provideDao")
public class ProvideDaoImpl implements ProvideDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "ProvideMapper";

    @Override
    public void save(Provide provide) throws Exception {
        dao.save(mapper + ".save", provide);
    }

    @Override
    public void saveBatch(List<Provide> e) throws Exception {

    }

    @Override
    public void delete(Provide provide) throws Exception {
        dao.delete(mapper + ".delete", provide);
    }

    @Override
    public void deleteBatch(Provide provide) throws Exception {
        dao.delete(mapper + ".batchDelete", provide);
    }

    @Override
    public void update(Provide provide) throws Exception {
        dao.update(mapper + ".update", provide);
    }

    @Override
    public void updateBatch(Provide provide) throws Exception {

    }

    @Override
    public Provide find(Provide provide) throws Exception {
        return (Provide) dao.find(mapper + ".find", provide);
    }

    @Override
    public List<Provide> findList(Provide provide) throws Exception {
        return null;
    }

    @Override
    public int findCount(Provide provide) throws Exception {
        return 0;
    }

    /**
     * 分页 list
     * @param provide
     * @return
     * @throws Exception
     */
    @Override
    public Page findPage(Provide provide) throws Exception {
        return dao.findPage(mapper + ".findPage", mapper + ".findPageCount", provide);
    }
}
