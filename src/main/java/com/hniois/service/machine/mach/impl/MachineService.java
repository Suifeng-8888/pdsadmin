package com.hniois.service.machine.mach.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.machine.mach.MachineDao;
import com.hniois.entity.machine.Machine;
import com.hniois.service.machine.mach.MachineManage;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service("machineService")
public class MachineService extends ServiceSupport<Machine,MachineDao> implements MachineManage{

    @Resource(name="machineDaoImpl")
    @Override
    public void setDao(MachineDao dao) {
        this.dao=dao;
    }
}
