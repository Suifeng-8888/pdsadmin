package com.hniois.service.report.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.report.ReportDao;
import com.hniois.entity.report.Report;
import com.hniois.service.report.ReportService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(value = "reportService")
public class ReportServiceImpl extends ServiceSupport<Report, ReportDao> implements ReportService {

    @Resource(name = "reportDao")
    @Override
    public void setDao(ReportDao dao) {
        this.dao = dao;
    }
}
