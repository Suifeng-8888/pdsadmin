package com.hniois.dao.system.${packageName}.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.${packageName}.${objectName}Dao;
import com.hniois.entity.${packageName}.${objectName};
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("${packageName}DaoImpl")
public class ${objectName}DaoImpl implements ${objectName}Dao{
    @Autowired
    private DaoSupport dao;

    private String mapper = "${objectName}Mapper";

    @Override
    public void save(${objectName} e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<${objectName}> e) throws Exception {
    dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(${objectName} e) throws Exception {
    dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(${objectName} e) throws Exception {
    dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(${objectName} e) throws Exception {
    dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(${objectName} e) throws Exception {
    dao.update(mapper+".updateBatch",e);
    }

    @Override
    public ${objectName} find(${objectName} e) throws Exception {
    return (${objectName})dao.find(mapper+".find",e);
    }

    @Override
    public List<${objectName}> findList(${objectName} e) throws Exception {
        return  (List<${objectName}> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(${objectName} e) throws Exception { 
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(${objectName} e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    } 
            
}
