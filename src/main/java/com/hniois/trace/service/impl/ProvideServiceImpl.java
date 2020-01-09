package com.hniois.trace.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.trace.dao.ProvideDao;
import com.hniois.trace.entity.Provide;
import com.hniois.trace.service.ProvideService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Create By javaMan
 * 2018/6/28  11:20
 * 追溯  供应商  serviceImpl...
 */
@Service(value = "provideService")
public class ProvideServiceImpl extends ServiceSupport<Provide, ProvideDao> implements ProvideService {

    @Resource(name = "provideDao")
    @Override
    public void setDao(ProvideDao dao) {
        this.dao = dao;
    }
}
