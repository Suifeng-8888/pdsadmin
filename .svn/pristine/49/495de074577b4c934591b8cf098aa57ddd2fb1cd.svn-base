package com.hniois.dao.machine.mach.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.machine.mach.MachineDao;
import com.hniois.entity.machine.Machine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("machineDaoImpl")
public class MachineDaoImpl implements MachineDao {
    @Autowired
    private DaoSupport dao;

    private String mapper = "MachineMapper";

    @Override
    public void save(Machine e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Machine> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Machine e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Machine e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Machine e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Machine e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Machine find(Machine e) throws Exception {
        return (Machine)dao.find(mapper+".find",e);
    }

    @Override
    public List<Machine> findList(Machine e) throws Exception {
        return  (List<Machine> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Machine e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Machine e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
