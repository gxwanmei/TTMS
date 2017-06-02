package com.ttms.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttms.common.MD5Util;
import com.ttms.common.Page;
import com.ttms.model.User;
import com.ttms.service.UserService;



@Controller
@RequestMapping(path="/user")
public class UserController {
	@Resource(name="userService")
	private UserService userService;
	private MD5Util md5;
	
	/**
	 * login的验证  如果账号密码正确 则在sesssion里面会存有此人的name 头像 和 权限等级
	 * @param model
	 * @param user username和password会注入user
	 * @return
	 */
	@SuppressWarnings("static-access")
	@RequestMapping(path="/login.do")
	@ResponseBody
	public String isExists(HttpSession session,User user,Model model)
	{
		String desc="0";
		String pwd = user.getPassword();
		if(user.getUsername()==null || user.getPassword()==null || user.getUsername().equals("") || user.getPassword().equals("") || userService.getUserInfoByName(user.getUsername())==null)
		{
			
			return desc;
		}
		pwd=md5.string2MD5(pwd);
		if(userService.getPasswordByName(user.getUsername()).equals(pwd))
		{
			 desc="1";
			 session.setAttribute("name", user.getUsername());
			 session.setAttribute("type",userService.getUserInfoByName(user.getUsername()).getType());
			 session.setAttribute("u_photo", userService.getUserInfoByName(user.getUsername()).getU_photo());
		}
		return desc;
	}
	/**
	 * 根据不同的权限等级拥有不同模块的读写权限
	 * @param session
	 * @return
	 */
	@RequestMapping(path="/enter.do")
	public String enter(HttpSession session)
	{
		
		if(session.getAttribute("type").equals("0"))
		{
			
		}
		if(session.getAttribute("type").equals("1"))
		{
			
		}
		if(session.getAttribute("type").equals("2"))
		{
			
		}
		return "employee";
	}
	@RequestMapping(path="/logout.do")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:/index.jsp";
	}
	
}
