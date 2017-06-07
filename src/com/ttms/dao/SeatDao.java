package com.ttms.dao;


import java.sql.SQLException;
import java.util.List;

import com.ttms.model.Seat;
import com.ttms.model.Studio;

public interface SeatDao {
	//批量插入座位
	public int insertSeat(Seat seat) throws SQLException;
	//删除所有座位
	public int deleteAllSeatByStudioId(Studio studio) throws SQLException;
	
	//得到所有的座位
	public List<Seat> getAllSeat(Studio studio) throws SQLException;
	
	//根据行数和列数确定要改变的座位状态
	public int updateSeat(Seat seat) throws SQLException;
	//根据演出厅id判断座位是否存在
	public int findSeatByStudioId(Studio studio) throws SQLException;
}
