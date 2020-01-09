package com.hniois.trace.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.trace.dao.AptitudeDao;
import com.hniois.trace.entity.Aptitude;
import com.hniois.trace.service.AptitudeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Create By javaMan
 * 2018/6/26  9:50
 *
 * 企业资质 ServiceImpl...
 */
@Service(value = "aptitudeService")
public class AptitudeServiceImpl extends ServiceSupport<Aptitude, AptitudeDao> implements AptitudeService{

    @Resource(name = "aptitudeDao")
    @Override
    public void setDao(AptitudeDao dao) {
        this.dao = dao;
    }
}
