package com.hniois.dao.send.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.send.SendDao;
import com.hniois.entity.send.SendCheck;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository("sendDaoImpl")
public class SendDaoImpl implements SendDao {

    @Resource
    private DaoSupport dao;
    private String mapper = "SendMapper";

    /**
     * 保存对象
     *
     * @param sendCheck
     */
    @Override
    public void save(SendCheck sendCheck) throws Exception {

    }

    /**
     * 批量更新
     *
     * @param e
     */
    @Override
    public void saveBatch(List<SendCheck> e) throws Exception {
        dao.batchSave(mapper + ".saveBatch", e);
    }

    /**
     * 删除对象
     *
     * @param sendCheck
     */
    @Override
    public void delete(SendCheck sendCheck) throws Exception {
        dao.delete(mapper + ".delete", sendCheck);
    }

    /**
     * 批量更新
     *
     * @param sendCheck
     */
    @Override
    public void deleteBatch(SendCheck sendCheck) throws Exception {
        dao.delete(mapper + ".deleteBatch", sendCheck);
    }

    /**
     * 修改对象
     *
     * @param sendCheck
     */
    @Override
    public void update(SendCheck sendCheck) throws Exception {
        dao.update(mapper + ".update", sendCheck);
    }

    /**
     * 批量更新
     *
     * @param sendCheck
     */
    @Override
    public void updateBatch(SendCheck sendCheck) throws Exception {

    }

    /**
     * 查找对象
     *
     * @param sendCheck
     */
    @Override
    public SendCheck find(SendCheck sendCheck) throws Exception {
        return (SendCheck) dao.find(mapper + ".find", sendCheck);
    }

    /**
     * 查找List
     *
     * @param sendCheck
     */
    @Override
    public List<SendCheck> findList(SendCheck sendCheck) throws Exception {
        return null;
    }

    /**
     * 数量查询
     *
     * @param sendCheck
     */
    @Override
    public int findCount(SendCheck sendCheck) throws Exception {
        return 0;
    }

    /**
     * 分页查询
     *
     * @param sendCheck
     */
    @Override
    public Page findPage(SendCheck sendCheck) throws Exception {
        return dao.findPage(mapper + ".findPage", mapper + ".findPageCount", sendCheck);
    }
}
