package com.hniois.dao.report.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.report.ReportDao;
import com.hniois.entity.report.Report;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("reportDao")
public class ReportDaoImpl implements ReportDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "ReportMapper";

    @Override
    public void save(Report report) throws Exception {
        dao.save(mapper + ".save", report);
    }

    @Override
    public void saveBatch(List<Report> e) throws Exception {

    }

    @Override
    public void delete(Report report) throws Exception {
        dao.delete(mapper + ".delete", report);
    }

    @Override
    public void deleteBatch(Report report) throws Exception {
        dao.delete(mapper + ".batchDelete", report);
    }

    @Override
    public void update(Report report) throws Exception {
        dao.update(mapper + ".update" , report);
    }

    @Override
    public void updateBatch(Report report) throws Exception {
        dao.update(mapper + ".updateBatch", report);
    }

    @Override
    public Report find(Report report) throws Exception {
        return (Report) dao.find(mapper + ".find", report);
    }

    @Override
    public List<Report> findList(Report report) throws Exception {
        return (List<Report> )dao.findList(mapper+".findList",report);
    }

    @Override
    public int findCount(Report report) throws Exception {
        return (Integer) dao.find(mapper + ".findCount",report);
    }

    @Override
    public Page findPage(Report report) throws Exception {
        return dao.findPage(mapper + ".findPage", mapper + ".findPageCount", report);
    }
}
