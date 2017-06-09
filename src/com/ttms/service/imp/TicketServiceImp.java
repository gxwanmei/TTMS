package com.ttms.service.imp;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.dao.TicketDao;

import com.ttms.model.Ticket;
import com.ttms.service.TicketService;

@Service(value="ticketService")
public class TicketServiceImp implements TicketService {

	@Resource
	private TicketDao dao;
	@Override
	public int insertTicket(Ticket ticket) {
		int count=0;
		try {
			count=dao.insertTicket(ticket);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	@Override
	public int deleteTicketById(Ticket ticket) {
		int count = 0;
		try {
			count=dao.deleteTicketById(ticket);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	@Override
	public List<Ticket> getAll(Ticket ticket) {
		List<Ticket> tickets = new ArrayList<Ticket>(); 
		try {
			 tickets = dao.getAll(ticket);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return tickets;
	}
	@Override
	public int updateTicket(Ticket ticket) {
		int count = 0;
		try {
			count=dao.updateTicket(ticket);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	@Override
	public List<Ticket> getTicketBySchedId(Ticket ticket) {
		List<Ticket> list =null;
		try {
			list=dao.getTicketBySchedId(ticket);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
