package com.hniois.dao.repertory.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.repertory.PutRecordDao;
import com.hniois.entity.repertory.PutRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository(value = "putRecordDaoImpl")
public class PutRecordDaoImpl implements PutRecordDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "PutRecordMapper";
    /**
     * 保存对象
     *
     * @param putRecord
     */
    @Override
    public void save(PutRecord putRecord) throws Exception {
        dao.save(mapper + ".save", putRecord);
    }

    /**
     * 批量更新
     *
     * @param e
     */
    @Override
    public void saveBatch(List<PutRecord> e) throws Exception {

    }

    /**
     * 删除对象
     *
     * @param putRecord
     */
    @Override
    public void delete(PutRecord putRecord) throws Exception {

    }

    /**
     * 批量更新
     *
     * @param putRecord
     */
    @Override
    public void deleteBatch(PutRecord putRecord) throws Exception {

    }

    /**
     * 修改对象
     *
     * @param putRecord
     */
    @Override
    public void update(PutRecord putRecord) throws Exception {

    }

    /**
     * 批量更新
     *
     * @param putRecord
     */
    @Override
    public void updateBatch(PutRecord putRecord) throws Exception {

    }

    /**
     * 查找对象
     *
     * @param putRecord
     */
    @Override
    public PutRecord find(PutRecord putRecord) throws Exception {
        return (PutRecord) dao.find(mapper + ".find", putRecord);
    }

    /**
     * 查找List
     *
     * @param putRecord
     */
    @Override
    public List<PutRecord> findList(PutRecord putRecord) throws Exception {
        return null;
    }

    /**
     * 数量查询
     *
     * @param putRecord
     */
    @Override
    public int findCount(PutRecord putRecord) throws Exception {
        return 0;
    }

    /**
     * 分页查询
     *
     * @param putRecord
     */
    @Override
    public Page findPage(PutRecord putRecord) throws Exception {
        return dao.findPage(mapper + ".findPage",mapper + ".findPageCount",putRecord);
    }
}
