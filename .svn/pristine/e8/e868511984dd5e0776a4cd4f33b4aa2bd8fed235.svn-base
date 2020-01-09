package com.hniois.trace.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.trace.dao.TdataDao;
import com.hniois.trace.entity.TraceData;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository("tdataDaoImpl")
public class TdataDaoImpl implements TdataDao {

    @Resource
    private DaoSupport dao;

    private String mapper = "TdataMapper";

    @Override
    public void save(TraceData e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<TraceData> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(TraceData e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(TraceData e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(TraceData e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(TraceData e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public TraceData find(TraceData e) throws Exception {
        return (TraceData)dao.find(mapper+".find",e);
    }

    @Override
    public List<TraceData> findList(TraceData e) throws Exception {
        return  (List<TraceData> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(TraceData e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(TraceData e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
