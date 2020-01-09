package com.hniois.dao.report.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.report.TemplateDao;
import com.hniois.entity.report.Template;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Version V1.0.0
 * @Since 1.0
 * @Date 2018/5/3
 */
@Repository(value = "templateDao")
public class TemplateDaoImpl implements TemplateDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "TemplateMapper";
    /**
     * 保存对象
     *
     * @param template
     */
    @Override
    public void save(Template template) throws Exception {
        dao.save(mapper + ".save", template);
    }

    /**
     * 批量更新
     *
     * @param e
     */
    @Override
    public void saveBatch(List<Template> e) throws Exception {

    }

    /**
     * 删除对象
     *
     * @param template
     */
    @Override
    public void delete(Template template) throws Exception {
        dao.delete(mapper + ".delete", template);
    }

    /**
     * 批量更新
     *
     * @param template
     */
    @Override
    public void deleteBatch(Template template) throws Exception {
        dao.delete(mapper + ".batchDelete", template);
    }

    /**
     * 修改对象
     *
     * @param template
     */
    @Override
    public void update(Template template) throws Exception {

    }

    /**
     * 批量更新
     *
     * @param template
     */
    @Override
    public void updateBatch(Template template) throws Exception {

    }

    /**
     * 查找对象
     *
     * @param template
     */
    @Override
    public Template find(Template template) throws Exception {
        return (Template) dao.find(mapper + ".find", template);
    }

    /**
     * 查找List
     *
     * @param template
     */
    @Override
    public List<Template> findList(Template template) throws Exception {
        return (List<Template>) dao.findList(mapper + ".findList", template);
    }

    /**
     * 数量查询
     *
     * @param template
     */
    @Override
    public int findCount(Template template) throws Exception {
        return 0;
    }

    /**
     * 分页查询
     *
     * @param template
     */
    @Override
    public Page findPage(Template template) throws Exception {
        return dao.findPage(mapper + ".findPage", mapper + ".findPageCount", template);
    }
}
