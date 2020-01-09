package com.hniois.trace.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.trace.dao.OrderDao;
import com.hniois.trace.entity.Order;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository("orderDaoImpl")
public class OrderDaoImpl implements OrderDao {

    @Resource
    private DaoSupport dao;
    private String mapper = "OrderMapper";

    /**
     * 保存对象
     *
     */
    @Override
    public void save(Order e) throws Exception {
        dao.save(mapper + ".save", e);
    }

    /**
     * 批量更新
     *
     */
    @Override
    public void saveBatch(List<Order> e) throws Exception {

    }

    /**
     * 删除对象
     *
     */
    @Override
    public void delete(Order e) throws Exception {
        dao.delete(mapper + ".delete", e);
    }

    /**
     * 批量更新
     *
     */
    @Override
    public void deleteBatch(Order e) throws Exception {
        dao.delete(mapper + ".deleteBatch", e);
    }

    /**
     * 修改对象
     *
     */
    @Override
    public void update(Order e) throws Exception {
        dao.update(mapper + ".update", e);
    }

    /**
     * 批量更新
     *
     */
    @Override
    public void updateBatch(Order e) throws Exception {
        dao.update(mapper + ".updateBatch", e);
    }

    /**
     * 查找对象
     *
     */
    @Override
    public Order find(Order e) throws Exception {
        return (Order) dao.find(mapper + ".find", e);
    }

    /**
     * 查找List
     *
     */
    @Override
    public List<Order> findList(Order e) throws Exception {
        return null;
    }

    /**
     * 数量查询
     *
     */
    @Override
    public int findCount(Order e) throws Exception {
        return (Integer) dao.find(mapper + ".findCount", e);
    }

    /**
     * 分页查询
     */
    @Override
    public Page findPage(Order e) throws Exception {
        return dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }

}
