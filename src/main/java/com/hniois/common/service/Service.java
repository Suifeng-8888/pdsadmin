package com.hniois.common.service;

import com.hniois.common.page.Page;

import java.util.List;

/**
 * Service基础服务
 * */
 public interface Service<E extends Page> {

    /**
     * 保存对象
     * @param e
     */
     void save(E e) throws Exception;

    /**
     * 批量更新
     * @param e
     */
     void saveBatch(List<E> e) throws Exception;

    /**
     * 删除对象
     * @param e
     */
     void delete(E e) throws Exception;

    /**
     * 批量删除
     * @param e
     */
     void deleteBatch(E e) throws Exception;

    /**
     * 修改对象
     * @param e
     */
     void update(E e) throws Exception;

    /**
     * 批量更新
     * @param e
     */
     void updateBatch(E e) throws Exception;

    /**
     * 查找对象
     * @param e
     */
     E find(E e) throws Exception;

    /**
     * 查找List
     * @param e
     */
     List<E> findList(E e) throws Exception;

    /**
     * 数量查询
     * @param e
     * */
     int findCount(E e) throws Exception;

    /**
     * 分页查询
     * @param e
     */
    Page findPage(E e) throws Exception;
}
