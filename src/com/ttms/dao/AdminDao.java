package com.ttms.dao;

import java.sql.SQLException;
import java.util.List;

import com.ttms.model.User;

public interface AdminDao {
	public List<User> getAllUser() throws SQLException;
	
	public int insertUser(User user) throws SQLException;
	
	public int deleteUser(User user) throws SQLException;
	
	public int updateUser(User user) throws SQLException;
}
