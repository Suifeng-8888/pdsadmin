package com.hniois.service.system.user.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.system.user.UserDao;
import com.hniois.entity.system.User;
import com.hniois.service.system.user.UserManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


@Service("userService")
public class UserService extends ServiceSupport<User,UserDao> implements UserManage {

    @Resource(name="userDaoImpl")
    @Override
    public void setDao(UserDao dao) {
        this.dao = dao;
    }

}
