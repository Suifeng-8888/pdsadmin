package com.hniois.dao.machine.record.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.machine.record.RecordDao;
import com.hniois.entity.machine.Record;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("recordDaoImpl")
public class RecordDaoImpl implements RecordDao {
    @Autowired
    private DaoSupport dao;

    private String mapper = "RecordMapper";

    @Override
    public void save(Record e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Record> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Record e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Record e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Record e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Record e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Record find(Record e) throws Exception {
        return (Record)dao.find(mapper+".find",e);
    }

    @Override
    public List<Record> findList(Record e) throws Exception {
        return  (List<Record> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Record e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Record e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
