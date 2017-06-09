package com.ttms.service.imp;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.dao.AdminDao;
import com.ttms.model.User;
@Service(value="adminService")
public class AdminServiceimp implements com.ttms.service.AdminService {
	@Resource
	AdminDao dao;
	@Override
	public List<User> getAllUser() {
		List<User> users = new ArrayList<User>();
		try {
			users = dao.getAllUser();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return users;
	}

	@Override
	public int insertUser(User user) {
		int result = 0;
		try {
			result = dao.insertUser(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteUser(User user) {
		int result = 0;
		try {
			result = dao.deleteUser(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int updateUser(User user) {
		int result = 0;
		try {
			result = dao.updateUser(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

}
