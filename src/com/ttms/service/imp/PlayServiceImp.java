package com.ttms.service.imp;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.dao.PlayDao;
import com.ttms.model.Play;
import com.ttms.service.PlayService;

import sun.misc.BASE64Decoder;
@Service(value="playService")
public class PlayServiceImp implements PlayService{
	@Resource
	private PlayDao dao;
	@Override
	public int insertPlay(Play play) {
		int result = 0;
		try {
			result = dao.insertPlay(play);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
		}
		return result;
	}

	@Override
	public int deleteByPlayNo(Play play) {
		int result = 0;
		try {
			result = dao.deleteByPlayNo(play);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public int updatePlay(Play play) {
		int result = 0;
		try {
			result = dao.updatePlay(play);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public Play searchById(Play play) {
		Play pl = new Play();
		try {
			
			pl = dao.searchById(play);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			// TODO: handle exception
		}
		return pl;
	}

	@Override
	public int getCount(Play play) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Play> getAllData(Play play) {
		List<Play> plays = new ArrayList<Play>();
		try {
			plays = dao.getAllData(play);
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
		}
		return plays;
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
	
}
