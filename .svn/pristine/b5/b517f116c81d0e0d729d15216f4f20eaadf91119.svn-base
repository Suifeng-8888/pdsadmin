package com.hniois.service.report.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.report.StatisticsDao;
import com.hniois.entity.report.StatisicsCount;
import com.hniois.entity.report.Statistics;
import com.hniois.service.report.StatisticsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service(value = "statisticsService")
public class StatisticsServiceImpl extends ServiceSupport<Statistics, StatisticsDao> implements StatisticsService {

    @Resource(name = "statisticsDao")
    @Override
    public void setDao(StatisticsDao dao) {
        this.dao = dao;
    }

    @Override
    public List<StatisicsCount> countWeek(Statistics e) throws Exception {
        return dao.countWeek(e);
    }

    @Override
    public List<StatisicsCount> countMonth(Statistics e) throws Exception {
        return dao.countMonth(e);
    }
}
