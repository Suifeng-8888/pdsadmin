package com.hniois.trace.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.trace.dao.ImportDao;
import com.hniois.trace.entity.Im_Porduct;
import com.hniois.trace.service.ImportManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("importService")
public class ImportService extends ServiceSupport<Im_Porduct,ImportDao> implements ImportManage {

    @Resource(name = "importDaoImpl")
    @Override
    public void setDao(ImportDao dao) {
        this.dao=dao;
    }
}
