package com.hniois.dao.machine.checkRecord.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.machine.checkRecord.CheckRecordDao;
import com.hniois.entity.machine.CheckRecord;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository("checkRecordDaoImpl")
public class CheckRecordDaoImpl implements CheckRecordDao {

    @Resource
    private DaoSupport dao;

    private String mapper = "CheckRecordMapper";
    @Override
    public void save(CheckRecord e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<CheckRecord> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(CheckRecord e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(CheckRecord e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(CheckRecord e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(CheckRecord e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public CheckRecord find(CheckRecord e) throws Exception {
        return  (CheckRecord)dao.find(mapper+".find",e);
    }

    @Override
    public List<CheckRecord> findList(CheckRecord e) throws Exception {
        return  (List<CheckRecord> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(CheckRecord e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(CheckRecord e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }



}
