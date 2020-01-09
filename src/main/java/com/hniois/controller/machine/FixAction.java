package com.hniois.controller.machine;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.machine.Fix;
import com.hniois.entity.machine.Machine;
import com.hniois.service.machine.fix.FixManage;
import com.hniois.service.machine.mach.MachineManage;
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

@Controller
@RequestMapping("/fix")
public class FixAction extends BaseController{

    @Resource(name="fixService")
    private FixManage fixService;

    @Resource(name="machineService")
    private MachineManage machineService;

    private String fix_list="machine/fix/fix_list";
    private String fix_edit="machine/fix/fix_edit";
    private String fix_table="machine/fix/fix_table";
    private String fix_approve="machine/fix/fix_approve";

    @RequestMapping("/toPage")
    public ModelAndView toPage(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(fix_list);
        return  mv;
    }

    /**
     * 分页查询
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    @ResponseBody
    public  String list(Fix e)throws Exception{

        //获取当前页
        int cuurPage=getThisPage(e.getPage());
        //获取当前显示条数
        int limit=getThisLimit(e.getLimit());
        //设置新的偏移量和每页显示信息
        e.setOffset((cuurPage-1)*limit);
        e.setPageSize(limit);
        Page page= fixService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 查询list
     * @param e
     * @return
     */
    @RequestMapping("/findlist")
    @ResponseBody
    public String findlist(Fix e) throws Exception{
        List<Fix> list= fixService.findList(e);
        JSONArray js=JSONArray.fromObject(list);
        System.out.println(js.toString());
        return js.toString();
    }

    /**
     * 新增 or 编辑
     * @param e
     * @return
     */
    @RequestMapping("/toEdit")
    @ResponseBody
    public ModelAndView edit(Fix e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        Fix fix=new Fix();
        if(StringUtils.isNotEmpty(e.getMach_id())){
            fix=fixService.find(e);
        }
        fix.setCode(e.getCode());
        mv.addObject("fix",fix);
        mv.setViewName(fix_edit);
       /* List<Machine> mlist = machineService.findList(new Machine());
        mv.addObject("mlist",mlist);*/
        return mv;
    }

    /**
     * 保存新增
     * @param e
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public String add(Fix e)throws  Exception{
        JSONObject obj=getMsg();
        Fix fix=new Fix();
        fix.setMach_id(e.getMach_id());
        //先判断数据库是否已经存在当前对象
        if(fixService.findCount(fix)>0){
            setMsg(obj,"error","当前对象已存在");
        }else{
            //获取当前时间
            fixService.save(e);
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
    public String update(Fix e){
        JSONObject obj=getMsg();
        if(e.getStatus()!=null){
            e.setApprove_time(DateUtil.getTime());
            Session session= SessionManager.getSession();
            String username=(String) session.getAttribute(Const.SESSION_USERNAME);
            e.setAppver(username);//获取当前登录审批人
        }
        try{
            fixService.update(e);
        }catch(Exception ex){
            setMsg(obj,"error","编辑失败");
        }
        return obj.toString();
    }


    /**
     * 单个删除
     * @param e
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(Fix e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getMach_id()!=null) {
            fixService.delete(e);
        }else {
            setMsg(obj, "error", "删除失败");
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
    public String deletes(Fix e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getData().size()>0){
            fixService.deleteBatch(e);
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
    public ModelAndView approv(Fix e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        String mach_id=(String) e.getData().get(0);
        Fix fix=new Fix();
        fix.setMach_id(mach_id);
        fix=fixService.find(fix);
        mv.setViewName(fix_approve);
        mv.addObject("fix",fix);
        return mv;
    }

    /**
     * 二次弹框选择要维修的仪器
     * @return
     */
    @RequestMapping("/choose")
    public ModelAndView chose(){
      ModelAndView mv=this.getModelAndView();
      mv.setViewName(fix_table);
      return mv;
    }
}
