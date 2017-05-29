package com.ttms.service.imp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.dao.UserDao;
import com.ttms.model.User;
import com.ttms.service.UserService;
@Service(value="userService")
public class UserServiceImp implements UserService{
	@Resource
	private UserDao dao;
	@Override
	public User getUserInfoByName(String username) {
		
		return dao.getUserByName(username);
	}
	@Override
	public List<User> getAll() {
		
		return dao.getAll();
	}

}
