package com.hniois.service.report.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.report.TemplateDao;
import com.hniois.entity.report.Template;
import com.hniois.service.report.TemplateService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @Version V1.0.0
 * @Since 1.0
 * @Date 2018/5/3
 */
@Service(value = "templateService")
public class TemplateServiceImpl extends ServiceSupport<Template, TemplateDao> implements TemplateService{

    @Resource(name = "templateDao")
    @Override
    public void setDao(TemplateDao dao) {
        this.dao = dao;
    }
}
