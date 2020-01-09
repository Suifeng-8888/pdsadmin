package com.hniois.dao.report.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.report.ReportDetailDao;
import com.hniois.entity.report.ReportDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository(value = "reportDetailDao")
public class ReportDetailDaoImpl implements ReportDetailDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "ReportDetailMapper";

    /**
     * 保存对象
     *
     * @param reportDetail
     */
    @Override
    public void save(ReportDetail reportDetail) throws Exception {
        dao.save(mapper + ".save", reportDetail);
    }

    /**
     * 批量添加
     *
     * @param e
     */
    @Override
    public void saveBatch(List<ReportDetail> e) throws Exception {
        dao.batchSave(mapper + ".batchSave", e);
    }

    /**
     * 删除对象
     *
     * @param reportDetail
     */
    @Override
    public void delete(ReportDetail reportDetail) throws Exception {
        dao.delete(mapper + ".delete", reportDetail);
    }

    /**
     * 批量更新
     *
     * @param reportDetail
     */
    @Override
    public void deleteBatch(ReportDetail reportDetail) throws Exception {
        dao.delete(mapper + ".batchDelete", reportDetail);
    }

    /**
     * 修改对象
     *
     * @param reportDetail
     */
    @Override
    public void update(ReportDetail reportDetail) throws Exception {
        dao.update(mapper + ".update", reportDetail);
    }

    /**
     * 批量更新
     *
     * @param reportDetail
     */
    @Override
    public void updateBatch(ReportDetail reportDetail) throws Exception {

    }

    /**
     * 查找对象
     *
     * @param reportDetail
     */
    @Override
    public ReportDetail find(ReportDetail reportDetail) throws Exception {
        return (ReportDetail) dao.find(mapper + ".find", reportDetail);
    }

    /**
     * 查找List
     *
     * @param reportDetail
     */
    @Override
    public List<ReportDetail> findList(ReportDetail reportDetail) throws Exception {
        return (List<ReportDetail>) dao.findList(mapper + ".findList", reportDetail);
    }

    /**
     * 数量查询
     *
     * @param reportDetail
     */
    @Override
    public int findCount(ReportDetail reportDetail) throws Exception {
        return 0;
    }

    /**
     * 分页查询
     *
     * @param reportDetail
     */
    @Override
    public Page findPage(ReportDetail reportDetail) throws Exception {
        return dao.findPage(mapper + ".findPage",mapper + ".findPageCount", reportDetail);
    }
}
