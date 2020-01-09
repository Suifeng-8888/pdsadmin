package com.hniois.service.temp.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.temp.TempDao;
import com.hniois.entity.temp.Temp;
import com.hniois.service.temp.TempManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
*  模板 Service
*/
@Service("tempService")
public class TempService extends ServiceSupport<Temp,TempDao> implements TempManage {

    @Resource(name="tempDaoImpl")
    @Override
    public void setDao(TempDao dao) {
        this.dao = dao;
    }

}
