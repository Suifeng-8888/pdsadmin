package com.hniois.trace.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.trace.dao.ImportDao;
import com.hniois.trace.entity.Im_Porduct;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository("importDaoImpl")
public class ImportDaoImpl implements ImportDao {

    @Resource
    private DaoSupport dao;

    private String mapper = "ImportMapper";

    /**
     * 保存对象
     *
     */
    @Override
    public void save(Im_Porduct e) throws Exception {
        dao.save(mapper + ".save", e);
    }

    /**
     * 批量更新
     *
     */
    @Override
    public void saveBatch(List<Im_Porduct> e) throws Exception {

    }

    /**
     * 删除对象
     *
     */
    @Override
    public void delete(Im_Porduct e) throws Exception {
        dao.delete(mapper + ".delete", e);
    }

    /**
     * 批量更新
     *
     */
    @Override
    public void deleteBatch(Im_Porduct e) throws Exception {
        dao.delete(mapper + ".deleteBatch", e);
    }

    /**
     * 修改对象
     *
     */
    @Override
    public void update(Im_Porduct e) throws Exception {
        dao.update(mapper + ".update", e);
    }

    /**
     * 批量更新
     *
     */
    @Override
    public void updateBatch(Im_Porduct e) throws Exception {
        dao.update(mapper + ".updateBatch", e);
    }

    /**
     * 查找对象
     *
     */
    @Override
    public Im_Porduct find(Im_Porduct e) throws Exception {
        return (Im_Porduct) dao.find(mapper + ".find", e);
    }

    /**
     * 查找List
     *
     */
    @Override
    public List<Im_Porduct> findList(Im_Porduct e) throws Exception {
        return null;
    }

    /**
     * 数量查询
     *
     */
    @Override
    public int findCount(Im_Porduct e) throws Exception {
        return (Integer) dao.find(mapper + ".findCount", e);
    }

    /**
     * 分页查询
     */
    @Override
    public Page findPage(Im_Porduct e) throws Exception {
        return dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }


}
