package com.hniois.dao.report.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.report.StatisticsDao;
import com.hniois.entity.report.StatisicsCount;
import com.hniois.entity.report.Statistics;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository(value = "statisticsDao")
public class StatisticsDaoImpl implements StatisticsDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "StatisticsMapper";

    /**
     * 保存对象
     *
     * @param statistics
     */
    @Override
    public void save(Statistics statistics) throws Exception {
        dao.save(mapper + ".save", statistics);
    }

    /**
     * 批量更新
     *
     * @param e
     */
    @Override
    public void saveBatch(List<Statistics> e) throws Exception {

    }

    /**
     * 删除对象
     *
     * @param statistics
     */
    @Override
    public void delete(Statistics statistics) throws Exception {
        dao.delete(mapper + ".delete", statistics);
    }

    /**
     * 批量更新
     *
     * @param statistics
     */
    @Override
    public void deleteBatch(Statistics statistics) throws Exception {

    }

    /**
     * 修改对象
     *
     * @param statistics
     */
    @Override
    public void update(Statistics statistics) throws Exception {
        dao.update(mapper + ".update", statistics);
    }

    /**
     * 批量更新
     *
     * @param statistics
     */
    @Override
    public void updateBatch(Statistics statistics) throws Exception {

    }

    /**
     * 查找对象
     *
     * @param statistics
     */
    @Override
    public Statistics find(Statistics statistics) throws Exception {
        return null;
    }

    /**
     * 查找List
     *
     * @param statistics
     */
    @Override
    public List<Statistics> findList(Statistics statistics) throws Exception {
        return null;
    }

    /**
     * 数量查询
     *
     * @param statistics
     */
    @Override
    public int findCount(Statistics statistics) throws Exception {
        return 0;
    }

    /**
     * 分页查询
     *
     * @param statistics
     */
    @Override
    public Page findPage(Statistics statistics) throws Exception {
        return dao.findPage(mapper + ".findPage", mapper + ".findPageCount", statistics);
    }

    @Override
    public List<StatisicsCount> countWeek(Statistics e) throws Exception {
        return (List<StatisicsCount>)dao.findList(mapper+".countWeek",e);
    }

    @Override
    public List<StatisicsCount> countMonth(Statistics e) throws Exception {
        return (List<StatisicsCount>)dao.findList(mapper+".countMonth",e);
    }
}
