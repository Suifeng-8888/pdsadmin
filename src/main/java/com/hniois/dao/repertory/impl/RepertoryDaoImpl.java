package com.hniois.dao.repertory.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.repertory.RepertoryDao;
import com.hniois.entity.repertory.Repertory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository(value = "repertoryDaoImpl")
public class RepertoryDaoImpl implements RepertoryDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "RepertoryMapper";

    /**
     * 保存对象
     *
     * @param repertory
     */
    @Override
    public void save(Repertory repertory) throws Exception {
        dao.save(mapper + ".save", repertory);
    }

    /**
     * 批量更新
     *
     * @param e
     */
    @Override
    public void saveBatch(List<Repertory> e) throws Exception {

    }

    /**
     * 删除对象
     *
     * @param repertory
     */
    @Override
    public void delete(Repertory repertory) throws Exception {

    }

    /**
     * 批量更新
     *
     * @param repertory
     */
    @Override
    public void deleteBatch(Repertory repertory) throws Exception {

    }

    /**
     * 修改对象
     *
     * @param repertory
     */
    @Override
    public void update(Repertory repertory) throws Exception {
        dao.update(mapper + ".update", repertory);
    }

    /**
     * 批量更新
     *
     * @param repertory
     */
    @Override
    public void updateBatch(Repertory repertory) throws Exception {

    }

    /**
     * 查找对象
     *
     * @param repertory
     */
    @Override
    public Repertory find(Repertory repertory) throws Exception {
        return (Repertory) dao.find(mapper + ".find", repertory);
    }

    /**
     * 查找List
     *
     * @param repertory
     */
    @Override
    public List<Repertory> findList(Repertory repertory) throws Exception {
        return (List<Repertory>) dao.findList(mapper + ".findList",repertory);
    }

    /**
     * 数量查询
     *
     * @param repertory
     */
    @Override
    public int findCount(Repertory repertory) throws Exception {
        return 0;
    }

    /**
     * 分页查询
     *
     * @param repertory
     */
    @Override
    public Page findPage(Repertory repertory) throws Exception {
        return dao.findPage(mapper + ".findPage",mapper + ".findPageCount", repertory);
    }

    @Override
    public Repertory selectById(Integer id) throws Exception{
        return (Repertory)dao.find(mapper +".selectById",id);
    }
}
