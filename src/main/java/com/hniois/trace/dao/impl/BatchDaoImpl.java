package com.hniois.trace.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.trace.dao.BatchDao;
import com.hniois.trace.entity.Batch_Material;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository("batchDaoImpl")
public class BatchDaoImpl implements BatchDao {
    @Resource
    private DaoSupport dao;

    private String mapper = "BatchMapper";

    @Override
    public void save(Batch_Material e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Batch_Material> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Batch_Material e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Batch_Material e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Batch_Material e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Batch_Material e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Batch_Material find(Batch_Material e) throws Exception {
        return (Batch_Material)dao.find(mapper+".find",e);
    }

    @Override
    public List<Batch_Material> findList(Batch_Material e) throws Exception {
        return  (List<Batch_Material> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Batch_Material e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Batch_Material e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
