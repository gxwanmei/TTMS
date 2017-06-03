package com.ttms.service;

import java.util.List;

import com.ttms.common.Page;
import com.ttms.model.User;

public interface UserService {

	
	public User getUserInfoByName(String username);
	public List<User> getAll();
	public List<User> getUserByPage(Page page);
	public String getPasswordByName(String username);
	public int updateUserPhoto(User user);
}
