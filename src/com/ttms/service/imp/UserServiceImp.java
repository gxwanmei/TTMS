package com.ttms.service.imp;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.common.Page;
import com.ttms.dao.UserDao;
import com.ttms.model.User;
import com.ttms.service.UserService;

import sun.misc.BASE64Decoder;
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
	@Override
	public int updateUserPhoto(User user) {
		int count=0;
		try {
			count=dao.updateUserPhoto(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public int updateUser(User user){
		int result = 0;
		try {
			result = dao.updateUser(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	
	/**
	 * 通过BASE64Decoder解码，并生成图片
	 * @param imgStr 解码后的string
	 */
	public boolean stringImage(String imgStr, String imgFilePath) {
		// 对字节数组字符串进行Base64解码并生成图片
		if (imgStr == null)
			return false;
		try {
			// Base64解码
			byte[] b = new BASE64Decoder().decodeBuffer(imgStr);
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {
					// 调整异常数据
					b[i] += 256;
				}
			}
			// 生成Jpeg图片
			OutputStream out = new FileOutputStream(imgFilePath);
			out.write(b);
			out.flush();
			out.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}	
	@Override
	public int updatePassword(User user) {
		int result = 0;
		try {
			result = dao.updatePassword(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

}
