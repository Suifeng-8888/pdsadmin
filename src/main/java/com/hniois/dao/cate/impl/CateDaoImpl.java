package com.hniois.dao.cate.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.cate.CateDao;
import com.hniois.entity.cate.Cate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository("cateDaoImpl")
public class CateDaoImpl implements  CateDao {
    @Resource
    private DaoSupport dao;

    private String mapper = "CateMapper";
    @Override
    public void save(Cate e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Cate> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Cate e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Cate e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Cate e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Cate e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Cate find(Cate e) throws Exception {
        return  (Cate)dao.find(mapper+".find",e);
    }

    @Override
    public List<Cate> findList(Cate e) throws Exception {
        return  (List<Cate> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Cate e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Cate e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
