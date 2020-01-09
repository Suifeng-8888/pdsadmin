package com.hniois.util;

import com.hniois.entity.demo.Demo;
import com.hniois.entity.system.Menu;
import com.hniois.entity.system.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;

import java.util.List;

/**
 * shiro框架Session管理
 */
public class SessionManager {
	/**
	 * shiro管理的session
	 * @return Session
	 */
	public static Session getSession(){
		return SecurityUtils.getSubject().getSession();
	}

	/**
	 * 获取当前登录的用户信息
	 * @return User
	 */
	public static User getUser(){
		return (User)getSession().getAttribute(Const.SESSION_USER);
	}


	/**
	 * 获取当前登录的用户名
	 * @return username
	 */
	public static String getUsername(){
		return getSession().getAttribute(Const.SESSION_USERNAME).toString();
	}

	/**
	 * 获取权限
	 * @return List<Menu>
	 */
	public static List<Menu> getQX(){
		return (List<Menu>) getSession().getAttribute(getUsername() + Const.SESSION_QX);
	}

	/**
	 * 获取ExcelDemo
	 * @return List<Menu>
	 */
	public static Demo getExcelDemo(){
		return (Demo) getSession().getAttribute(Const.SESSION_excelDemo);
	}

}
