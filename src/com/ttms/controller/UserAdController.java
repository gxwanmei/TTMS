package com.ttms.controller;


import java.util.HashMap;



import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.ttms.common.MD5Util;
import com.ttms.model.User;
import com.ttms.service.UserService;

import net.sf.json.JSONArray;




@Controller
@RequestMapping(path="/ad/user")
public class UserAdController {
	
	@Resource(name="userService")
	private UserService userService;
	@RequestMapping(path="/isExit.do")
	@ResponseBody
	public String isExist(User user)
	{
		
		//List<Object> list = new ArrayList<>();
		//JSONObject obj = new JSONObject();
		//JSONArray json=new JSONArray();
		//JSONObject temp = new JSONObject();
		HashMap<String, String> map = new HashMap<>();
		String desc="failure";
		map.put("desc", desc);
		if(user.getPassword()==null || user.getUsername()==null||user.getPassword().equals("") || user.getUsername().equals("") || userService.getUserInfoByName(user.getUsername())==null)
		{
			
			return JSONArray.fromObject(map).toString();
		}
		String pwd = MD5Util.string2MD5(user.getPassword());
		if(userService.getPasswordByName(user.getUsername()).equals(pwd))
		{
			desc="success";
			map.put("desc", desc);
			map.put("type", userService.getUserInfoByName(user.getUsername()).getType());
			map.put("u_photo", userService.getUserInfoByName(user.getUsername()).getU_photo());
			
		}
		return JSONArray.fromObject(map).toString();
	}


}
