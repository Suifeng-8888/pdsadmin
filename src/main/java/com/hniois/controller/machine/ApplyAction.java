package com.hniois.controller.machine;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.machine.Apply;
import com.hniois.service.machine.apply.ApplyManage;
import com.hniois.util.Const;
import com.hniois.util.DateUtil;
import com.hniois.util.SessionManager;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * 仪器购买申请功能
 */
@Controller
@RequestMapping("/apply")
public class ApplyAction extends BaseController {

    @Resource(name="applyService")
    private ApplyManage applyService;

    private String apply_list="machine/apply/apply_list";
    private String apply_edit="machine/apply/apply_edit";
    private String apply_img="machine/apply/apply_img";
    private String apply_approve="machine/apply/apply_approve";

    @RequestMapping("/toPage")
   public ModelAndView tolist(Page e){
       ModelAndView mv=this.getModelAndViewToPage(e);
       mv.setViewName(apply_list);
       return mv;
   }

    /**
     * 分页查找
     * @param e
     * @return
     * @throws Exception
     */
   @RequestMapping("/list")
   @ResponseBody
   public String getlist(Apply e)throws Exception{

        //获取当前页
       int currPage=getThisPage(e.getPage());
       //获取分页数
       int limit=getThisLimit(e.getLimit());
       //设置新的对象
       e.setPageSize(limit);
       e.setOffset((currPage-1)*limit);
       Page page=applyService.findPage(e);
       return JSON.toJSONString(page);

   }

    /**
     *  查询list
     * @param e
     * @return
     */
    @RequestMapping("/findlist")
    @ResponseBody
   public String alllist(Apply e)throws Exception{
       List<Apply> list=applyService.findList(e);
        JSONArray js=JSONArray.fromObject(list);
        return js.toString();
   }

    /**
     * 新增or 编辑
     * @param e
     * @return
     */
    @RequestMapping("/toEdit")
   public ModelAndView edit(Apply e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        Apply app=new Apply();
        if(StringUtils.isNotEmpty(e.getApply_id())){
            app=applyService.find(e);
        }
        app.setCode(e.getCode());
        mv.setViewName(apply_edit);
        mv.addObject("apply",app);
        return mv;
   }

    /**
     * 保存新增
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
   public String add(Apply e)throws Exception{
        JSONObject obj=getMsg();
        //先判断是否已经存在要保存的对象
        Apply apply=new Apply();
        apply.setApply_id(e.getApply_id());
        if(applyService.findCount(apply)>0){
            setMsg(obj,"error","当前对象已存在");
        }else{
            applyService.save(e);
        }
        return obj.toString();
   }

    /**
     * 编辑保存
     * @param e
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
   public String update(Apply e)throws Exception{
       JSONObject obj=getMsg();
        if(e.toString()!=null){
            applyService.update(e);
        }else{
            setMsg(obj,"error","编辑失败");
        }
        return obj.toString();
   }

    /**
     * 删除
     * @param e
     * @return
     */
   @RequestMapping("/delete")
   @ResponseBody
   public String delete(Apply e)throws Exception{
       JSONObject obj=getMsg();
       if(e.getApply_id()!=null){
           applyService.delete(e);
       }else{
           setMsg(obj,"error","删除失败");
       }
            return obj.toString();
   }

    /**
     * 批量删除
     * @param e
     * @return
     */
   @RequestMapping("/deletes")
   @ResponseBody
   public String deletes(Apply e)throws Exception{
       JSONObject obj=getMsg();
       if(e.getData()!=null){
           applyService.deleteBatch(e);
       }else{
           setMsg(obj,"error","删除失败");
       }
       return obj.toString();
   }

    /**
     * 审批购买申请
     * @param e
     * @return
     */
    @RequestMapping("/approve")
    @ResponseBody
   public ModelAndView approv(Apply e)throws Exception{
       ModelAndView mv=this.getModelAndView();
       String apply_id=(String) e.getData().get(0);
       Apply app=new Apply();
       app.setApply_id(apply_id);
       app=applyService.find(app);
       //获取当前用户名
        Session session=SessionManager.getSession();
        String username=(String) session.getAttribute(Const.SESSION_USERNAME);
        app.setApprover(username);//获取当前登录审批人
        app.setApprove_time(DateUtil.getDay());
        mv.setViewName(apply_approve);
        mv.addObject("apply",app);
        return mv;
   }

    /**
     * 打开文件上传窗口
     * @return
     */
   @RequestMapping("/upload")
   public ModelAndView chooseFile(){
        ModelAndView mv=this.getModelAndView();
        mv.setViewName(apply_img);
        return mv;
   }


}
