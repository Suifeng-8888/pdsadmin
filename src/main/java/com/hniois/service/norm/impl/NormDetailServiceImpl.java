package com.hniois.service.norm.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.norm.NormDetailDao;
import com.hniois.entity.norm.NormDetail;
import com.hniois.service.norm.NormDetailService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(value = "normDetailService")
public class NormDetailServiceImpl extends ServiceSupport<NormDetail, NormDetailDao> implements NormDetailService {

    @Resource(name = "normDetailDaoImpl")
    @Override
    public void setDao(NormDetailDao dao) {
       this.dao = dao;
    }
}
