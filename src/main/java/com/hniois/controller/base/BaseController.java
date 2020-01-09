package com.hniois.controller.base;

import com.hniois.common.page.Page;
import com.hniois.entity.demo.Demo;
import com.hniois.entity.system.Menu;
import com.hniois.util.Const;
import com.hniois.util.ExportExcelUtil;
import com.hniois.util.Logger;
import com.hniois.util.SessionManager;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.session.Session;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

public class BaseController {
	protected Logger logger = Logger.getLogger(this.getClass());

	/**
	 * 得到ModelAndView
	 * @return
	 */
	public ModelAndView getModelAndView(){
		return new ModelAndView();
	}

	/**
	 * 得到ModelAndView toPage + QX权限
	 * @return
	 */
	public ModelAndView getModelAndViewToPage(Page e){
		ModelAndView mv = new ModelAndView();
		Session session = SessionManager.getSession();
		List<Menu> menu = (List<Menu>) session.getAttribute(SessionManager.getUsername() + Const.SESSION_QX);
		StringBuilder rightsUrl = new StringBuilder(",");
		for(Menu m : menu){
			if(m.getMenu_id().equals(e.getId())){
				for(Menu p : m.getChildren()){
					rightsUrl.append(p.getMenu_url()).append(",");
				}
				//跳出循环
				break;
			}
		}
		mv.addObject("QX",rightsUrl);
		return mv;
	}

	/**
	 * 得到request对象
	 * @return HttpServletRequest
	 */
	public HttpServletRequest getRequest() {
		return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
	}

	/**
	 * 得到response对象
	 * @return HttpServletResponse
	 */
	public HttpServletResponse getResponse() {
		return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getResponse();
	}

	public static void logBefore(Logger logger, String interfaceName){
		logger.info("");
		logger.info("start");
		logger.info(interfaceName);
	}

	public static void logAfter(Logger logger){
		logger.info("end");
		logger.info("");
	}

	//获取当前页数
	public Integer getThisPage(String curr){
		if(StringUtils.isEmpty(curr)){
			return 1;
		}
		return Integer.parseInt(curr);
	}

	//获取当前分页大小
	public Integer getThisLimit(String limit){
		if(StringUtils.isEmpty(limit)){
			return Const.PAGE;
		}
		return Integer.parseInt(limit);
	}

	public JSONObject getMsg(){
		JSONObject obj = new JSONObject();
		obj.put("state","ok");
		obj.put("msg","操作成功");
		return obj;
	}

	public JSONObject setMsg(JSONObject obj,String state,String msg){
		obj.put("state",state);
		obj.put("msg",msg);
		return obj;
	}

	/**
     * 导出数据
     * @param fileName 文件名
     * @param list 数据
     * */
    public void doExport(String fileName,List list,ExportExcelUtil export) throws Exception{
    	//response响应
        HttpServletResponse response = getResponse();
		//取得输出流
        OutputStream os = response.getOutputStream();
		// 清空输出流
        response.reset();
		// 设定输出文件头
        response.setHeader("Content-disposition", "attachment; filename="+fileName+"."+(export.isExcel2003()?"xls":"xlsx"));
		// 定义输出类型
        response.setContentType("application/msexcel");

        //执行导出
        export.export(list,os);
    }
}
