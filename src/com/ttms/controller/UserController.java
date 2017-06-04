package com.ttms.controller;


import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.ttms.common.MD5Util;
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
			 session.setAttribute("userid",userService.getUserInfoByName(user.getUsername()).getId());
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
		if(session.getAttribute("type")==null)
		{
			return "redirect:/index.jsp";
		}
		if(session.getAttribute("type").equals("0"))
		{
			
		}
		if(session.getAttribute("type").equals("1"))
		{
			
		}
		if(session.getAttribute("type").equals("2"))
		{
			
		}
		return "redirect:/employee.jsp";
	}
	@RequestMapping(path="/logout.do")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:/index.jsp";
	}
	@RequestMapping(path="/upload.do")
	public String springUpload(HttpServletRequest request,HttpSession session,User user) throws IllegalStateException, IOException
	{
		
	
		
        //将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
       CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
               request.getSession().getServletContext());
       //检查form中是否有enctype="multipart/form-data"
       if(multipartResolver.isMultipart(request))
       {
    	   
    	   
    	   
           //将request变成多部分request
           MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
          //获取multiRequest 中所有的文件名
           Iterator iter=multiRequest.getFileNames();
           Calendar cal=Calendar.getInstance();
           while(iter.hasNext())
           {
        	   String fileName=iter.next().toString();
               //一次遍历所有文件
               MultipartFile file=multiRequest.getFile(fileName);
               String path=request.getServletContext().getRealPath("")+session.getAttribute("name").toString();
               File upload = new File(path);
               if(!upload.exists())
               {
            	   upload.mkdir();
               }
               if(file!=null)
               {
            	   String temp=path+"\\"+file.getOriginalFilename();
            	   path=path+"\\"+file.getOriginalFilename();
            	   String adpath="D:\\git\\TTMS_v1.0\\WebContent\\WEB-INF\\user_photo\\"+file.getOriginalFilename();
            	   user.setU_photo("user_photo/"+file.getOriginalFilename());
            	   userService.updateUserPhoto(user);
            	   //上传
                   file.transferTo(new File(path));
                   file.transferTo(new File(adpath));
                   session.setAttribute("u_photoUp", temp);
                
               }
             
                
           }
           System.out.println(session.getAttribute("u_photo"));
          
           
       }
     
       return "redirect:/employee.jsp";
	}
}
