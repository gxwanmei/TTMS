package com.ttms.dao;
import java.sql.SQLException;
import java.util.List;

import com.ttms.common.Page;
import com.ttms.model.User;
public interface UserDao {

	public User getUserByName(String username) throws SQLException;
	public List<User> getAll() throws SQLException;
	public List<User> getUserByPage(Page page) throws SQLException;
	public String getPasswordByName(String username) throws SQLException;
	public int updateUserPhoto(User user) throws SQLException;
}
