package com.ttms.dao;
import java.util.List;

import com.ttms.model.User;
public interface UserDao {

	public User getUserByName(String username);
	public List<User> getAll();
}
