package com.ttms.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttms.model.User;
import com.ttms.service.AdminService;

@Controller
@RequestMapping(path="/admin")
public class AdminController {
	@Resource(name="adminService")
	private AdminService adminService;
	
	@RequestMapping(path="/getAllUser")
	@ResponseBody
	public List<User> getAllUser(Model model){
		System.out.println("----->");
		List<User> users = new ArrayList<>();
		users = adminService.getAllUser();
		return users;
	}
	
	@RequestMapping(path="/deleteUser")

	public String deleteUser(User user){
		int result = 0;
		result = adminService.deleteUser(user);
		return "admin";
	}
	
	@RequestMapping(path="/insertUser")

	public String insertUser(User user){
		if(user.getUsername().equals("") || user.getPassword().equals("") || user.getType().equals("")){
			return "admin";
		}
		int result = 0;
		user.setU_photo("upload/1496911821377.jpg");
		result = adminService.insertUser(user);
		return "admin";
	}
	
	@RequestMapping(path="/updateUser")
	public String updateUser(User user){
		if(user.getUsername().equals("") || user.getPassword().equals("") || user.getType().equals("")){
			return "admin";
		}
		int result = 0;
		result = adminService.updateUser(user);
		return "admin";
	}
	
}
