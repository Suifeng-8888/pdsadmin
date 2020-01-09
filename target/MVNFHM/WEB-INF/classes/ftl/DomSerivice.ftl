package com.hniois.service.${packageName}.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.${packageName}.${objectName}Dao;
import com.hniois.entity.${packageName}.${objectName};
import com.hniois.service.${packageName}.${objectName}Manage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


@Service("${packageName}Service")
public class ${objectName}Service extends ServiceSupport<${objectName},${objectName}Dao> implements ${objectName}Manage {

    @Resource(name="${packageName}DaoImpl")
    @Override
    public void setDao(${objectName}Dao dao) {
        this.dao = dao;
    }

}
