package com.hniois.service.norm.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.norm.NormDao;
import com.hniois.entity.norm.Norm;
import com.hniois.service.norm.NormService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(value = "normService")
public class NormServiceImpl extends ServiceSupport<Norm, NormDao> implements NormService {

    @Resource(name = "normDaoImpl")
    @Override
    public void setDao(NormDao dao) {
        this.dao = dao;
    }

    /**
     * 标准编号，名称重复验证
     *
     * @param norm
     * @return
     */
    @Override
    public Integer repeatedVerification(Norm norm) throws Exception {
        return dao.repeatedVerification(norm);
    }
}
