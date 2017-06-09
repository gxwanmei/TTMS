package com.ttms.service;

import java.util.List;

import com.ttms.model.User;

public interface AdminService {
	public List<User> getAllUser();
	
	public int insertUser(User user);
	
	public int deleteUser(User user);
	
	public int updateUser(User user);
}
