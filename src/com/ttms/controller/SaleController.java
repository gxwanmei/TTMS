package com.ttms.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttms.model.Play;
import com.ttms.model.Schedule;
import com.ttms.model.Ticket;
import com.ttms.service.PlayService;
import com.ttms.service.ScheduleService;
import com.ttms.service.TicketService;

@Component
@RequestMapping(path="/sale")
public class SaleController {
	@Resource(name="playService")
	private PlayService playService;
	@Resource(name="scheduleService")
	private ScheduleService scheduleService;
	@Resource(name="ticketService")
	private TicketService ticketService;
	@RequestMapping(path="/get.do")
	@ResponseBody
	public List<Play> getPlayByType(Play play)
	{
		return playService.findPlayByType(play);
	}
	@RequestMapping(path="/getSched.do")
	@ResponseBody
	public List<Schedule> getSchedByPlayId(Schedule schedule)
	{
		System.out.println(schedule.getPlay().getPlay_id());
		return scheduleService.getScheduleByPlayId(schedule);
	}
	@RequestMapping(path="/getTicket.do")
	@ResponseBody
	public List<Ticket> getTicketBySchedId(Ticket ticket)
	{
		return ticketService.getTicketBySchedId(ticket);
	}
	@RequestMapping(path="/updateTicket.do")
	@ResponseBody
	public int update(@RequestBody List<Ticket> tickets)
	{
		int count=0;
		System.out.println(tickets.size());
		return count;
	}
}
