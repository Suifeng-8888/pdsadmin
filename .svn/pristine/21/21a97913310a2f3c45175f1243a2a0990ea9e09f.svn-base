package com.hniois.controller.demo;

import com.hniois.controller.base.BaseController;
import com.hniois.entity.demo.Demo;
import com.hniois.service.demo.DemoManage;
import com.hniois.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 */
@Controller
@RequestMapping(value="/demo")
public class DemoAction extends BaseController{
    //Demo模版工具
    @Resource(name="demoService")
    private DemoManage demoService;

    /**
     * 自动生成代码
     * @param response
     * @param e
     * @throws Exception
     */
    @RequestMapping(value="/doCreate")
    public void proCode(HttpServletResponse response,Demo e) throws Exception{
        //存放路径
        String filePath = "admin/ftl/demo/";
        //ftl路径
        String ftlPath = "";
        //基础文件夹
        String file_url = PathUtil.getClasspath()+"admin/ftl/demo";
        //zip路径
        String files_url = file_url + ".zip";
        //删除冗余文件
        FileUtil.delDirectory(file_url);

        //字段集合
        List<Demo> list = demoService.findTableField(e);
        //字段集合 - 追加首字母大写
        for (Demo up:list) {
            up.setNameUp(toStrUpperFirst(up.getName()));
        }

        String demo = e.getDemo();//模版Key
        String demoUp = toStrUpperFirst(demo);
        String demoName = e.getDemoName();//模版名称
        String tableName = e.getTableName(); //表名

        //创建数据模型
        Map<String,Object> root = new HashMap<String,Object>();
        root.put("fieldList",list);
        root.put("fieldUpperList",list);
        root.put("demo",demo);
        root.put("demoUp",demoUp);
        root.put("demoName",demoName);
        root.put("table",tableName);
        /* ============================================================================================= */
        /*生成Maper*/
        Freemarker.printFile("Dom_Mapper.ftl", root, "mapper/"+demo+"/"+demoUp+"Mapper.xml", filePath, ftlPath);
        /*生成实体类*/
        Freemarker.printFile("DomBean.ftl", root, "bean/"+demo+"/"+demoUp+".java", filePath, ftlPath);
        /*生成Dao*/
        Freemarker.printFile("DomDao.ftl", root, "dao/"+demo+"/"+demoUp+"Dao.java", filePath, ftlPath);
        /*生成DaoImpl*/
        Freemarker.printFile("DomDaoImpl.ftl", root, "dao/"+demo+"/impl/"+demoUp+"DaoImpl.java", filePath, ftlPath);
        /*生成ServiceManage*/
        Freemarker.printFile("DomManage.ftl", root, "service/"+demo+"/"+demoUp+"Manage.java", filePath, ftlPath);
        /*生成Service*/
        Freemarker.printFile("DomService.ftl", root, "service/"+demo+"/impl/"+demoUp+"Service.java", filePath, ftlPath);
        /*生成Action*/
        Freemarker.printFile("DomAction.ftl", root, "controller/"+demo+"/"+demoUp+"Action.java", filePath, ftlPath);
        /*生成查询页面*/
        Freemarker.printFile("Dom_list.ftl", root, "jsp/"+demo+"/"+demo+"_list.jsp", filePath, ftlPath);
        /*生成修改页面*/
        Freemarker.printFile("Dom_edit.ftl", root, "jsp/"+demo+"/"+demo+"_edit.jsp", filePath, ftlPath);
        /* ============================================================================================= */
        /*生成的全部代码压缩成zip文件*/
        //zip压缩
        if(FileZip.zip(file_url,files_url)){
            //下载
            FileDownload.fileDownload(response, files_url, "demo.zip");
        }

    }

    /*
    * 首字符-大写转换
    * @param str 原始字符串
    * @return 字符串[首字符大写]
    * */
    public String toStrUpperFirst(String str){
        return str.substring(0,1).toUpperCase() + str.substring(1);
    }

    //测试
    public List<Demo> createDOMList(String demo,String demoUp){
        List<Demo> rs = new ArrayList<Demo>();
        Demo d = new Demo();

        /*生成Maper*/
        d.setDemo("Dom_Mapper.ftl");
        d.setUrl("mapper/"+demo+"/"+demoUp+"Mapper.xml");
        rs.add(d);

        /*生成实体类*/
        d.setDemo("DomBean.ftl");
        d.setUrl("bean/"+demo+"/"+demoUp+".java");
        rs.add(d);

        /*生成Dao*/
        d.setDemo("DomDao.ftl");
        d.setUrl("dao/"+demoUp+"Dao.java");
        rs.add(d);

        /*生成DaoImpl*/
        d.setDemo("DomDaoImpl.ftl");
        d.setUrl("dao/"+demo+"/impl/"+demoUp+"DaoImpl.java");
        rs.add(d);

        /*生成ServiceManage*/
        d.setDemo("DomManage.ftl");
        d.setUrl("serivice/"+demo+"/"+demoUp+"Manage.java");
        rs.add(d);

        /*生成Service*/
        d.setDemo("DomSerivice.ftl");
        d.setUrl("serivice/"+demo+"/impl/"+demoUp+"Serivice.java");
        rs.add(d);

        /*生成Action*/
        d.setDemo("DomAction.ftl");
        d.setUrl("controller/"+demo+"/"+demoUp+"Action.java");
        rs.add(d);

        /*生成查询页面*/
        d.setDemo("Dom_list.ftl");
        d.setUrl("jsp/"+demo+"/"+demo+"_list.jsp");
        rs.add(d);

        /*生成修改页面*/
        d.setDemo("Dom_edit.ftl");
        d.setUrl("jsp/"+demo+"/"+demo+"_edit.jsp");
        rs.add(d);

        return rs;
    }
}
