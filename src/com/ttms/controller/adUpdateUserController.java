package com.ttms.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import com.ttms.common.MD5Util;
import com.ttms.model.User;
import com.ttms.service.UserService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
@Controller
@RequestMapping(path="/adUser")
public class adUpdateUserController {
	@Resource(name="userService")
	UserService userService;
	@RequestMapping(path = "/userUpdate.do")
	@ResponseBody
	public String updatePlay(@RequestBody User user,HttpServletRequest request){

		System.out.println("------------->adUser");
		System.out.println(user.getPassword());
		String current = String.valueOf(System.currentTimeMillis());
		//获取存储路径
		String path = request.getSession().getServletContext().getRealPath("upload//");
		System.out.println(path);
		File file = new File(path);
		if(!file.exists()){
			file.mkdir();
		}
		String imgPath  = path + current+".jpg";
		System.out.println(imgPath);
		String imgStr = user.getImg_string();
		boolean flag = userService.stringImage(imgStr, imgPath);
		System.out.println(flag);
		String pathStr = "upload/"+current+".jpg";
		user.setU_photo(pathStr);
		user.setPassword(MD5Util.string2MD5(user.getPassword()));
		System.out.println("md5"+user.getPassword());
		int result = userService.updateUser(user);
		System.out.println(user.getU_photo());
		System.out.println(result);
		
		JSONObject obj = new JSONObject();
		obj.put("u_photo", pathStr);
		obj.put("result", result);
		
		return JSONArray.fromObject(obj).toString();
	}

}
