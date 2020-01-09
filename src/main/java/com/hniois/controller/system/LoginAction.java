package com.hniois.controller.system;

import com.hniois.controller.base.BaseController;
import com.hniois.entity.system.Menu;
import com.hniois.entity.system.User;
import com.hniois.service.system.menu.MenuManage;
import com.hniois.service.system.user.UserManage;
import com.hniois.util.Const;
import com.hniois.util.SessionManager;
import com.hniois.util.Tools;
import net.sf.json.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class LoginAction extends BaseController{
    //用户
    @Resource(name="userService")
    private UserManage userService;
    //角色
//    @Resource(name="roleService")
//    private RoleManage roleService;
    //菜单
    @Resource(name="menuService")
    private MenuManage menuService;

    //登录页面
    String login_page = "system/login/login";
    //主界面
    String main_page = "system/index/main";
    //首页
    String show_page = "system/index/show";
    /**访问登录页
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/login_tologin")
    public ModelAndView toLogin()throws Exception{
        ModelAndView mv = this.getModelAndView();
        mv.addObject("SYSNAME", Tools.readTxtFile(Const.SYSNAME));
        mv.setViewName(login_page);
        return mv;
    }

    /**
     * 访问登录页
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/login_login",produces="application/json;charset=UTF-8")
    @ResponseBody
    public String login(User e) throws Exception{
        JSONObject obj = new JSONObject();
        Session session = SessionManager.getSession();
        String user_id = e.getUser_id();
        String password = e.getPassword();
        String pass = new SimpleHash("SHA-1",user_id,password).toString();
        User p = new User();
        p.setUser_id(user_id);
        p.setPassword(pass);
        User user = userService.find(p);
        if(user!=null){
            session.setAttribute(Const.SESSION_USER, user);
            session.setAttribute(Const.SESSION_USERNAME, user.getUsername());
            obj.put("state","ok");
            obj.put("msg","登陆成功");

            //shiro加入身份验证
            Subject subject = SecurityUtils.getSubject();
            UsernamePasswordToken token = new UsernamePasswordToken(user_id, password);
            try {
                subject.login(token);
            } catch (AuthenticationException ex) {
                obj.put("state","error");
                obj.put("msg","身份验证失败");
            }
        }else{
            obj.put("state","error");
            obj.put("msg","用户名或密码错误");
        }
        return obj.toString();
    }

    /**
     * 访问登录页
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/main/index")
    public ModelAndView main()throws Exception{
        ModelAndView mv = getModelAndView();
        mv.addObject("SYSNAME", Tools.readTxtFile(Const.SYSNAME));
        try {
            Session session = SessionManager.getSession();
            User user = SessionManager.getUser();
            String user_name = user.getUsername();
            if(user != null){
                Menu p = new Menu();
                p.setMenu_ids(user.getRights().equals("#")?"":user.getRights());

                System.out.println(user.getRights()+"=======================================================================");
                //权限
                List<Menu> roleRights = menuService.getMenuButton(p);
                session.setAttribute(user_name + Const.SESSION_QX, roleRights); 	//将角色权限存入session

                //菜单
                p.setMenu_type(Menu.Menu_list);
                List<Menu> menuList = menuService.findTreeMenu(p);

                mv.addObject("user", user);
                mv.addObject("menuList", menuList);
                mv.addObject("qxList", roleRights);
            }
            mv.setViewName(main_page);
        } catch(Exception e){
            mv.setViewName(login_page);
            logger.error(e.getMessage(), e);
        }
        return mv;
    }

    /**
     * 用户注销
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/login_logout")
    public ModelAndView logout() throws Exception{
        String USERNAME = SessionManager.getUser().toString();	//当前登录的用户名
        ModelAndView mv = this.getModelAndView();
        this.removeSession(USERNAME);//请缓存
        //shiro销毁登录
        Subject subject = SecurityUtils.getSubject();
        subject.logout();

        mv.addObject("SYSNAME", Tools.readTxtFile(Const.SYSNAME));
        mv.setViewName(login_page);
        return mv;
    }

    /**
     * 清理session
     */
    public void removeSession(String userName){
        Session session = SessionManager.getSession();	//以下清除session缓存
        session.removeAttribute(Const.SESSION_USER);
        session.removeAttribute(Const.SESSION_USERNAME);
        session.removeAttribute(userName + Const.SESSION_menuList);
        session.removeAttribute(userName + Const.SESSION_allmenuList);
        session.removeAttribute(userName + Const.SESSION_QX);
    }

    /**
     * 首页
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/login_default")
    public ModelAndView login_default() throws Exception{
        ModelAndView mv = this.getModelAndView();
        User user = SessionManager.getUser();

        mv.addObject("user", user);
        mv.addObject("SYSNAME", Tools.readTxtFile(Const.SYSNAME));
        mv.setViewName(show_page);
        return mv;
    }

}
