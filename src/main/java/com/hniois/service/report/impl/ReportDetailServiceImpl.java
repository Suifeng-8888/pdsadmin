package com.hniois.service.report.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.report.ReportDetailDao;
import com.hniois.entity.report.ReportDetail;
import com.hniois.service.report.ReportDetailService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(value = "reportDetailService")
public class ReportDetailServiceImpl extends ServiceSupport<ReportDetail, ReportDetailDao> implements ReportDetailService {

    @Resource(name = "reportDetailDao")
    @Override
    public void setDao(ReportDetailDao dao) {
        this.dao = dao;
    }
}
