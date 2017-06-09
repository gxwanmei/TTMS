package com.ttms.dao;


import java.sql.SQLException;
import java.util.List;

import com.ttms.model.Ticket;

public interface TicketDao {
	//插入一张票的信息
	public int insertTicket(Ticket ticket) throws SQLException;
	//删除票
	public int deleteTicketById(Ticket ticket) throws SQLException;
	//根据票id查询所有 包括演出厅和座位信息
	public List<Ticket> getAll(Ticket ticket) throws SQLException;
	//更新票的信息
	public int updateTicket(Ticket ticket) throws SQLException;
	//根据演出计划id查飘信息
	public List<Ticket> getTicketBySchedId(Ticket ticket) throws SQLException;
	
}
