package com.ttms.dao;

import java.sql.SQLException;
import java.util.List;

import com.ttms.model.Schedule;
import com.ttms.model.Studio;

public interface StudioDao {
	//增加演出厅
	public int Insert(Studio studio) throws SQLException;
	//根据id删除演出厅
	public int deleteStudioById(int id) throws SQLException;
	//根据id更新演出厅
	public int updateStudioById(Studio studio) throws SQLException;
	//会得到座位的信息
	public List<Studio> Query(Studio studio) throws SQLException;
	//得到所有演出厅及座位(为安卓)
	public List<Studio> QueryAll() throws SQLException;
	//只查找到演出厅的信息
	public List<Studio> getAllStudio(Studio studio)throws SQLException;
	//根据id查找演出厅
	public Studio getStudioById(Studio studio) throws SQLException;
	
	
}
