package com.ttms.service.imp;


import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.dao.StudioDao;
import com.ttms.model.Studio;
import com.ttms.service.StudioService;

@Service(value="studioService")
public class StudioServiceImp implements StudioService {
	@Resource
	private StudioDao dao;

	@Override
	public int InsertStudio(Studio studio) {
		int count=0;
		System.out.println(studio.getStudio_name());
		try {
			count=dao.Insert(studio);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int deleteStudioById(int id) {
		int count=0;
		try {
			count=dao.deleteStudioById(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int updateStudioById(Studio studio) {
		int count=0;
		try {
			count=dao.updateStudioById(studio);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public List<Studio> Query(Studio studio) {
		List<Studio> list=null;
		try {
			list=dao.Query(studio);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Studio> getAllStudio(Studio studio) {
		List<Studio> list=null;
		try {
			list=dao.getAllStudio(studio);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Studio getStudioById(Studio studio) {
		Studio temp = null;
		try {
			temp=dao.getStudioById(studio);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	@Override
	public List<Studio> QueryAll() {
		List<Studio> list=null;
		try {
			list=dao.QueryAll();
			System.out.println(list.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

		
}
	

