package com.ttms.service;

import java.util.List;

import com.ttms.model.User;

public interface UserService {

	
	public User getUserInfoByName(String username);
	public List<User> getAll();
}
