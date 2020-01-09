package com.hniois.trace.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.trace.dao.ProduceSiteDao;
import com.hniois.trace.entity.ProduceSite;
import com.hniois.trace.service.ProduceSiteService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Create By javaMan
 * 2018/7/3  15:51
 */
@Service(value = "produceSiteService")
public class ProduceSiteServiceImpl extends ServiceSupport<ProduceSite, ProduceSiteDao> implements ProduceSiteService{

    @Resource(name = "produceSiteDao")
    @Override
    public void setDao(ProduceSiteDao dao) {
        this.dao = dao;
    }
}
