package com.hniois.dao.item.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.item.ItemDao;
import com.hniois.entity.item.Item;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository("itemDaoImpl")
public class ItemDaoImpl implements ItemDao {

    @Resource
    private DaoSupport dao;

    private String mapper = "ItemMapper";

    /**
     * 保存对象
     *
     * @param item
     */
    @Override
    public void save(Item item) throws Exception {
        dao.save(mapper + ".save", item);
    }

    /**
     * 批量更新
     *
     * @param e
     */
    @Override
    public void saveBatch(List<Item> e) throws Exception {

    }

    /**
     * 删除对象
     *
     * @param item
     */
    @Override
    public void delete(Item item) throws Exception {
        dao.delete(mapper + ".delete", item);
    }

    /**
     * 批量更新
     *
     * @param item
     */
    @Override
    public void deleteBatch(Item item) throws Exception {
        dao.delete(mapper + ".deleteBatch", item);
    }

    /**
     * 修改对象
     *
     * @param item
     */
    @Override
    public void update(Item item) throws Exception {
        dao.update(mapper + ".update", item);
    }

    /**
     * 批量更新
     *
     * @param item
     */
    @Override
    public void updateBatch(Item item) throws Exception {
        dao.update(mapper + ".updateBatch", item);
    }

    /**
     * 查找对象
     *
     * @param item
     */
    @Override
    public Item find(Item item) throws Exception {
        return (Item) dao.find(mapper + ".find", item);
    }

    /**
     * 查找List
     *
     * @param item
     */
    @Override
    public List<Item> findList(Item item) throws Exception {
        return null;
    }

    /**
     * 数量查询
     *
     * @param item
     */
    @Override
    public int findCount(Item item) throws Exception {
        return (Integer) dao.find(mapper + ".findCount", item);
    }

    /**
     * 分页查询
     *
     * @param item
     */
    @Override
    public Page findPage(Item item) throws Exception {
        return dao.findPage(mapper+".findPage",mapper+".findPageCount",item);
    }

    @Override
    public List<Item> sendCheck(Item item) throws Exception {
        return (List<Item>) dao.findList(mapper + ".sendCheck",item);
    }
}
