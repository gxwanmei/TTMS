package com.ttms.service.imp;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.common.Page;
import com.ttms.dao.UserDao;
import com.ttms.model.User;
import com.ttms.service.UserService;
@Service(value="userService")
public class UserServiceImp implements UserService{
	@Resource
	private UserDao dao;
	@Override
	public User getUserInfoByName(String username) {
		User user =null;
		try {
			user= dao.getUserByName(username);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	@Override
	public List<User> getAll() {
		List<User> list =null;
		try {
			list= dao.getAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<User> getUserByPage(Page page) {
		List<User> list =null;
		try {
			list=dao.getUserByPage(page);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public String getPasswordByName(String username) {
		String pwd=null;
		try {
			 pwd=dao.getPasswordByName(username);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return pwd;
	}

}
