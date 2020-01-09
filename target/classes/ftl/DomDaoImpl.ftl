package com.hniois.dao.system.${demo}.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.${demo}.${demoUp}Dao;
import com.hniois.entity.${demo}.${demoUp};
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
*  ${demoName} DaoImpl
*/
@Repository("${demo}DaoImpl")
public class ${demoUp}DaoImpl implements ${demoUp}Dao{
    @Autowired
    private DaoSupport dao;

    private String mapper = "${demoUp}Mapper";

    @Override
    public void save(${demoUp} e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<${demoUp}> e) throws Exception {
    dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(${demoUp} e) throws Exception {
    dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(${demoUp} e) throws Exception {
    dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(${demoUp} e) throws Exception {
    dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(${demoUp} e) throws Exception {
    dao.update(mapper+".updateBatch",e);
    }

    @Override
    public ${demoUp} find(${demoUp} e) throws Exception {
    return (${demoUp})dao.find(mapper+".find",e);
    }

    @Override
    public List<${demoUp}> findList(${demoUp} e) throws Exception {
        return  (List<${demoUp}> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(${demoUp} e) throws Exception { 
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(${demoUp} e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    } 
            
}
