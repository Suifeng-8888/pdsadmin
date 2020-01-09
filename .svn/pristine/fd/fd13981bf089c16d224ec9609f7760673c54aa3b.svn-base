package com.hniois.service.cate.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.cate.CateDao;
import com.hniois.entity.cate.Cate;
import com.hniois.service.cate.CateManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("cateService")
public class CateService extends ServiceSupport<Cate,CateDao> implements CateManage {

    @Resource(name = "cateDaoImpl")
    @Override
    public void setDao(CateDao dao) {
        this.dao=dao;
    }
}
