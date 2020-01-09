package com.hniois.trace.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.trace.dao.RetailerDao;
import com.hniois.trace.entity.Retailer;
import com.hniois.trace.service.RetailerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Create By javaMan
 * 2018/6/29  9:17
 *
 * 追溯  销售商 serviceImpl
 */
@Service(value = "retailerService")
public class RetailerServiceImpl extends ServiceSupport<Retailer, RetailerDao> implements RetailerService {

    @Resource(name = "retailerDao")
    @Override
    public void setDao(RetailerDao dao) {
        this.dao = dao;
    }
}
