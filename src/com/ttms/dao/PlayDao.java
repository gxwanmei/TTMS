package com.ttms.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ttms.model.Play;
import com.ttms.model.Studio;

public interface PlayDao {
	public  int insertPlay(Play play) throws SQLException;
	
	public int deleteByPlayNo(Play play)throws SQLException;
	
	public int updatePlay(Play play)throws SQLException;
	
	public int getCount(Play play)throws SQLException;
	
	public Play searchById(Play play)throws SQLException;
	
	public List<Play> getAllData(Play play)throws SQLException;
	
}
