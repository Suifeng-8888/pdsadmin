package com.hniois.trace.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.trace.dao.ProductorDao;
import com.hniois.trace.entity.Productor;
import com.hniois.trace.service.ProductorManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.print.DocFlavor;

@Service("productorService")
public class ProductorService extends ServiceSupport<Productor,ProductorDao> implements ProductorManage {

    @Resource(name = "productorDaoImpl")
    @Override
    public void setDao(ProductorDao dao) {
        this.dao=dao;
    }
}
