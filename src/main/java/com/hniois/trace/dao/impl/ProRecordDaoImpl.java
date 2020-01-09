package com.hniois.trace.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.trace.dao.ProRecordDao;
import com.hniois.trace.entity.Pro_Record;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository("proRecordDaoImpl")
public class ProRecordDaoImpl implements ProRecordDao {
    @Resource
    private DaoSupport dao;

    private String mapper = "ProRecordMapper";

    @Override
    public void save(Pro_Record e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Pro_Record> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Pro_Record e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Pro_Record e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Pro_Record e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Pro_Record e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Pro_Record find(Pro_Record e) throws Exception {
        return (Pro_Record)dao.find(mapper+".find",e);
    }

    @Override
    public List<Pro_Record> findList(Pro_Record e) throws Exception {
        return  (List<Pro_Record> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Pro_Record e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Pro_Record e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
