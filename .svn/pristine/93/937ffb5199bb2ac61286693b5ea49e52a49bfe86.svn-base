package com.hniois.common.dao;

import com.hniois.common.page.Page;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Dao基础服务
 * */
@Repository
public class DaoSupport {
    @Resource(name = "sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;

    /**
     * 保存对象
     * @param str
     * @param obj
     * @return
     * @throws Exception
     */
    public Object save(String str, Object obj) throws Exception {
        return sqlSessionTemplate.insert(str, obj);
    }

    /**
     * 批量更新
     * @param str
     * @param objs
     * @return
     * @throws Exception
     */
    public Object batchSave(String str, List objs )throws Exception{
        return sqlSessionTemplate.insert(str, objs);
    }

    /**
     * 删除对象
     * @param str
     * @param obj
     * @return
     * @throws Exception
     */
    public Object delete(String str, Object obj) throws Exception {
        return sqlSessionTemplate.delete(str, obj);
    }

    /**
     * 批量更新
     * @param str
     * @param objs
     * @return
     * @throws Exception
     */
    public Object batchDelete(String str, List objs )throws Exception{
        return sqlSessionTemplate.delete(str, objs);
    }

    /**
     * 修改对象
     * @param str
     * @param obj
     * @return
     * @throws Exception
     */
    public Object update(String str, Object obj) throws Exception {
        return sqlSessionTemplate.update(str, obj);
    }

    /**
     * 批量更新
     * @param str
     * @param objs
     * @return
     * @throws Exception
     */
    public void batchUpdate(String str, List objs )throws Exception{
        SqlSessionFactory sqlSessionFactory = sqlSessionTemplate.getSqlSessionFactory();
        //批量执行器
        SqlSession sqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH,false);
        try{
            if(objs!=null){
                for(int i=0,size=objs.size();i<size;i++){
                    sqlSession.update(str, objs.get(i));
                }
                sqlSession.flushStatements();
                sqlSession.commit();
                sqlSession.clearCache();
            }
        }finally{
            sqlSession.close();
        }
    }

    /**
     * 查找对象
     * @param str
     * @param obj
     * @return
     * @throws Exception
     */
    public Object find(String str, Object obj) throws Exception {
        return sqlSessionTemplate.selectOne(str, obj);
    }

    /**
     * 查找List
     * @param str
     * @param obj
     * @return
     * @throws Exception
     */
    public Object findList(String str, Object obj) throws Exception {
        return sqlSessionTemplate.selectList(str, obj);
    }

    /**
     * 分页查询
     * @param str1  分页list
     * @param str2  分页count
     * @param obj   查询参数
     * @return
     * @throws Exception
     */
    public Page findPage(String str1,String str2, Object obj) throws Exception {
        Page p = new Page();
        List list = sqlSessionTemplate.selectList(str1, obj);
        p.setData(list);
        Object objCount = sqlSessionTemplate.selectOne(str2, obj);
        if(objCount==null){
            p.setCount(0);
        }else {
            p.setCount(Integer.parseInt(objCount.toString()));
        }
        return p;
    }


}
