package com.hniois.trace.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.trace.dao.BagDao;
import com.hniois.trace.entity.Bag;
import com.hniois.trace.service.BagManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("bagService")
public class BagService extends ServiceSupport<Bag,BagDao> implements BagManage {

   @Resource(name = "bagDaoImpl")
    @Override
    public void setDao(BagDao dao) {
        this.dao=dao;
    }

    List<Bag> findTreeList = null;

    @Override
    public List<Bag> findTreeList(Bag e) throws Exception {
        if (e == null) {
            e = new Bag();
        }
        findTreeList = dao.findList(e);
        if (findTreeList == null || findTreeList.size() < 1) {
            return new ArrayList<Bag>();
        }
        List<Bag> rslist = new ArrayList<Bag>();
        createTree(rslist,"0");
        findTreeList = null ;
        return rslist;
    }

    /**
     * 取得兄弟节点
     * */
    public void createTree(List<Bag> rslist,String pid){
        List<Bag> list = findPIDList(findTreeList,pid);
        if(list.size()>0){
            for(Bag item:list){
                createChildTree(item, item.getId());
                rslist.add(item);
            }
        }
    }

    //递归出对象中的子对象
    public void createChildTree(Bag bg,String pId){
       //先获取上层问pId的集合
        List<Bag> pid_list =findPIDList(findTreeList, pId);
        List<Bag> children=new ArrayList<>();
        bg.setChildren(children);
        //遍历pid_list中的每个对象
        for(Bag item:pid_list){
            createChildTree(item,item.getId());
            bg.getChildren().add(item);
        }
    }


    //获取pId_list
    public List<Bag> findPIDList(List<Bag> list,String pId){
       List<Bag> item=new ArrayList<>();
       for(Bag bg:list){
           if(bg.getpId().equals(pId)){
               item.add(bg);
           }
       }

       return item;
    }
}
