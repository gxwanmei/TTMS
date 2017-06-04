package com.ttms.dao;

import java.sql.SQLException;
import java.util.List;

import com.ttms.model.Studio;

public interface StudioDao {
	public int Insert(Studio studio) throws SQLException;
	public int deleteStudioById(int id) throws SQLException;
	public int updateStudioById(Studio studio) throws SQLException;
	public List<Studio> Query() throws SQLException;
}
