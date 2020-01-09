package com.hniois.service.repertory.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.repertory.RepertoryDao;
import com.hniois.entity.repertory.Repertory;
import com.hniois.service.repertory.RepertoryService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(value = "repertoryService")
public class RepertoryServiceImpl extends ServiceSupport<Repertory, RepertoryDao> implements RepertoryService {


    @Resource(name = "repertoryDaoImpl")
    @Override
    public void setDao(RepertoryDao dao) {
        this.dao = dao;
    }

    @Override
    public Repertory selectById(String id) throws Exception {
        if (StringUtils.isNotEmpty(id)) {
            return dao.selectById(Integer.parseInt(id));
        }
        return null;
    }
}
