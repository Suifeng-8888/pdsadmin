package com.hniois.dao.norm.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.norm.NormDetailDao;
import com.hniois.entity.norm.NormDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("normDetailDaoImpl")
public class NormDetailDaoImpl implements NormDetailDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "normDetailMapper";

    @Override
    public void save(NormDetail normDetail) throws Exception {
        dao.save(mapper + ".save", normDetail);
    }

    @Override
    public void saveBatch(List<NormDetail> e) throws Exception {

    }

    @Override
    public void delete(NormDetail normDetail) throws Exception {
        dao.delete(mapper + ".delete", normDetail);
    }

    @Override
    public void deleteBatch(NormDetail normDetail) throws Exception {
        dao.delete(mapper + ".deleteBatch", normDetail);
    }

    @Override
    public void update(NormDetail normDetail) throws Exception {
        dao.update(mapper + ".update", normDetail);
    }

    @Override
    public void updateBatch(NormDetail normDetail) throws Exception {

    }

    @Override
    public NormDetail find(NormDetail normDetail) throws Exception {
        return (NormDetail) dao.find(mapper + ".find", normDetail);
    }

    @Override
    public List<NormDetail> findList(NormDetail normDetail) throws Exception {
        return (List<NormDetail>) dao.findList(mapper + ".findList", normDetail);
    }

    @Override
    public int findCount(NormDetail normDetail) throws Exception {
        return 0;
    }

    @Override
    public Page findPage(NormDetail normDetail) throws Exception {
        return dao.findPage(mapper + ".findPage", mapper + ".findPageCount", normDetail);
    }
}
