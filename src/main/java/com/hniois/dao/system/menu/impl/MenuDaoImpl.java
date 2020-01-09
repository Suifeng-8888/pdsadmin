package com.hniois.dao.system.menu.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.system.menu.MenuDao;
import com.hniois.entity.system.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("menuDaoImpl")
public class MenuDaoImpl implements MenuDao{
    @Autowired
    private DaoSupport dao;

    private String mapper = "MenuMapper";

    @Override
    public void save(Menu e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Menu> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Menu e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Menu e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Menu e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Menu e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Menu find(Menu e) throws Exception {
        return  (Menu)dao.find(mapper+".find",e);
    }

    @Override
    public List<Menu> findList(Menu e) throws Exception {
        return  (List<Menu>)dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Menu e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Menu e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }

    @Override
    public List<Menu> findTreeList(Menu e) throws Exception {
        return (List<Menu>)dao.findList(mapper+".findTreeList",e);
    }
}
