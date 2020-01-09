package com.hniois.service.system.menu.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.system.menu.MenuDao;
import com.hniois.entity.system.Menu;
import com.hniois.service.system.menu.MenuManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/** 
 * 类名称：MenuService 菜单处理
 */
@Service("menuService")
public class MenuService extends ServiceSupport<Menu,MenuDao> implements MenuManage{

    @Resource(name="menuDaoImpl")
    @Override
    public void setDao(MenuDao dao) {
        this.dao = dao;
    }

    @Override
    public List<Menu> findTreeMenu(Menu e) throws Exception{
        List<Menu> A = new ArrayList<Menu>();
        List<Menu> B = new ArrayList<Menu>();
        List<Menu> C = new ArrayList<Menu>();
        Integer len_A = 2;
        Integer len_B = 2;
        Integer len_C = 2;

        //加载全部信息
        List<Menu> allMenu = dao.findList(e);

        for(Menu m : allMenu){
            //主菜单
            if(m.getMenu_id().length()<=len_A){
                A.add(m);
            }
            //子菜单
            else if(m.getMenu_id().length()<=(len_A+len_B)){
                B.add(m);
            }
            //权限
            else if(m.getMenu_id().length()<=(len_A+len_B+len_C)){
                C.add(m);
            }

        }

        //循环 C,组装 B A
        if(C.size()>0){
            loadLensTree(B,C,len_A+len_B);
        }

        //循环 B,组装  A
        if(B.size()>0){
            loadLensTree(A,B,len_A);
        }

        return A;
    }

    @Override
    public List<Menu> findTreeList(Menu e) throws Exception {
        return dao.findTreeList(e);
    }

    @Override
    public List<Menu> getMenuButton(Menu e) throws Exception {
        List<Menu> B = new ArrayList<Menu>();
        List<Menu> C = new ArrayList<Menu>();
        Integer len_A = 2;
        Integer len_B = 2;
        Integer len_C = 2;

        //加载全部信息
        List<Menu> allMenu = dao.findList(e);

        for(Menu m : allMenu){
            //子菜单
            if(m.getMenu_id().length()==(len_A+len_B)){
                B.add(m);
            }
            //权限
            else if(m.getMenu_id().length()==(len_A+len_B+len_C)){
                C.add(m);
            }

        }

        //循环 C,组装 B A
        if(C.size()>0){
            loadLensTree(B,C,len_A+len_B);
        }

        return B;
    }

    /**
     * 组装tree 基层函数
     * @param  parent（List<E>）   目标数据
     * @param  children（List<E>） 对象数据
     * @param  sub_len（int）      比对ID长度
     * */
    public void loadLensTree(List<Menu> parent,List<Menu> children,int sub_len){
        String theID = "";
        String ckTheID = "";
        List<Menu> t = null;
        for(int j=0;j<parent.size();j++){
            Menu p = parent.get(j);
            ckTheID = p.getMenu_id();

            t = new ArrayList<Menu>();
            for(int i=0;i<children.size();i++){
                Menu pp = children.get(i);
                theID = pp.getMenu_id().substring(0, sub_len);
                if(theID.equals(ckTheID)){
                    t.add(pp);
                    children.remove(pp);
                    i--;
                }
            }

            //第一次赋值，后续添加
            if(p.getChildren()==null){
                p.setChildren(t);
            }else{
                p.getChildren().addAll(t);
            }
        }
    }
}
