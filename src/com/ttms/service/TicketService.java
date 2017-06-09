package com.ttms.service;



import java.util.List;

import com.ttms.model.Ticket;

public interface TicketService {
		public int insertTicket(Ticket ticket);

		public int deleteTicketById(Ticket ticket);

		public List<Ticket> getAll(Ticket ticket);

		public int updateTicket(Ticket ticket);
		
		public List<Ticket> getTicketBySchedId(Ticket ticket);
	
}
