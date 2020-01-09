package com.hniois.service.system.dept.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.system.dept.DeptDao;
import com.hniois.entity.system.Dept;
import com.hniois.service.system.dept.DeptManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;


@Service("deptService")
public class DeptService extends ServiceSupport<Dept,DeptDao> implements DeptManage {

    @Resource(name="deptDaoImpl")
    @Override
    public void setDao(DeptDao dao) {
        this.dao = dao;
    }

    List<Dept> findTreeList = null;

    @Override
    public List<Dept> findTreeList(Dept e) throws Exception {
        if (e == null) {
            e = new Dept();
        }
        findTreeList = dao.findList(e);
        if (findTreeList == null || findTreeList.size() < 1) {
            return new ArrayList<Dept>();
        }
        List<Dept> rslist = new ArrayList<Dept>();
        createTree(rslist,"0");
        findTreeList = null ;
        return rslist;
    }

    /**
     * 取得兄弟节点
     * */
    public void createTree(List<Dept> rslist,String pid){
        List<Dept> list = findPIDList(findTreeList,pid);
        if(list.size()>0){
            for(Dept item:list){
                createChildTree(item, item.getId());
                rslist.add(item);
            }
        }
    }

    /**
     * 递归出子对象
     * */
    public void createChildTree(Dept rs,String pid){
        List<Dept> list = findPIDList(findTreeList,pid);
        if(list.size()>0){
            List<Dept> nc = new ArrayList<Dept>();
            rs.setChildren(nc);
            for(Dept item:list){
                createChildTree(item,item.getId());
                rs.getChildren().add(item);
            }
        }
    }

    /**
     * 获取pid_list
     * */
    public List<Dept> findPIDList(List<Dept> list,String pid){
        List<Dept> r = new ArrayList<Dept>();
        for (Dept item : list){
            if(item.getpId().equals(pid)){
                r.add(item);
            }
        }
        return r;
    }
}
