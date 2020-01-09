package com.hniois.service.system.role.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.system.role.RoleDao;
import com.hniois.entity.system.Role;
import com.hniois.service.system.role.RoleManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 角色
 */
@Service("roleService")
public class RoleService extends ServiceSupport<Role,RoleDao> implements RoleManage {

    @Resource(name="roleDaoImpl")
    @Override
    public void setDao(RoleDao dao) {
        this.dao = dao;
    }
}
