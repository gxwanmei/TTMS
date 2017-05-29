package com.ttms.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttms.model.User;
import com.ttms.service.UserService;



@Controller
public class UserController {
	@Resource(name="userService")
	private UserService userService;
	@RequestMapping(path="/user/check.do")
	public String getUser(Model model,User user)
	{
		
		System.out.println(user.getName());
		System.out.println(user.getPwd());
		return "index";
	}
	@RequestMapping(path="/user/get.do")
	@ResponseBody
	public List<User> get(Model model,User user)
	{
		
		return userService.getAll();
	}
	
}
