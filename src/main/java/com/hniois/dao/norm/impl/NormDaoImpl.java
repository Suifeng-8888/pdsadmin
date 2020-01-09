package com.hniois.dao.norm.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.norm.NormDao;
import com.hniois.entity.norm.Norm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("normDaoImpl")
public class NormDaoImpl implements NormDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "NormMapper";

    @Override
    public void save(Norm e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Norm> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Norm e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Norm e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Norm e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Norm e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Norm find(Norm e) throws Exception {
        return (Norm)dao.find(mapper+".find",e);
    }

    @Override
    public List<Norm> findList(Norm e) throws Exception {
        return (List<Norm>) dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Norm e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Norm e) throws Exception {
        return dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }

    /**
     * 标准编号，名称重复验证
     *
     * @param norm
     * @return
     */
    @Override
    public Integer repeatedVerification(Norm norm) throws Exception {
        return (Integer) dao.find(mapper + ".repeatedVerification", norm);
    }
}
