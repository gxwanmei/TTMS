package com.ttms.controller;


import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttms.model.Schedule;
import com.ttms.model.Seat;
import com.ttms.model.Studio;
import com.ttms.model.Ticket;
import com.ttms.service.PlayService;
import com.ttms.service.ScheduleService;
import com.ttms.service.SeatService;
import com.ttms.service.StudioService;
import com.ttms.service.TicketService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping(path="/ad/schedule")
public class ScheduleAdController {
	@Resource(name="scheduleService")
	private ScheduleService scheduleService;
	@Resource(name="studioService")
	private StudioService studioService;
	@Resource(name="playService")
	private PlayService playService;
	@Resource(name="ticketService")
	private TicketService ticketService;
	@Resource(name="seatService")
	private SeatService seatService;
	@RequestMapping(path="/insert.do")
	@ResponseBody
	public String insertSched(Schedule schedule)
	{
		
		List<Studio> list=studioService.Query(schedule.getStudio());
		Iterator<Studio> it=list.iterator();
		List<Seat> seats=it.next().getSeats();
		for(Seat seat:seats)
		{
			Ticket ticket = new Ticket();
			ticket.setSchedule(schedule);
			ticket.setTicket_price(schedule.getSched_ticket_price());
			ticket.setSeat(seat);
			if(seat.getSeat_status().equals("0"))
			{
				ticket.setTicket_status(0);
			}
			else
			{
				ticket.setTicket_status(1);
			}
			ticketService.insertTicket(ticket);
		}
		HashMap<String, Integer> map = new HashMap<>();
		map.put("sched_id", schedule.getSched_id());
		return JSONArray.fromObject(map).toString();
	}
	@RequestMapping(path="/get.do")
	@ResponseBody
	public Schedule getSchedById(Schedule schedule)
	{
			if(schedule==null)
			{
				return null;
			}
			return scheduleService.getScheduleById(schedule);
	}
	@RequestMapping(path="/query.do")
	@ResponseBody
	public List<Schedule> getAllSchedule()
	{
			return scheduleService.getAllSchedule();
	}
	@RequestMapping(path="/delete.do")
	@ResponseBody
	public String deleteById(Schedule schedule)
	{
		if(schedule.getSched_id()==0)
		{
			return null;
		}
		Ticket ticket = new Ticket();
		ticket.setSchedule(schedule);
		ticketService.deleteTicketById(ticket);
		HashMap<String, Integer> map = new HashMap<>();
		map.put("result",scheduleService.deleteScheduleById(schedule));
		return JSONArray.fromObject(map).toString();
	}
	@RequestMapping(path="/update.do")
	@ResponseBody
	public String updateById(Schedule schedule)
	{
		Ticket ticket1 = new Ticket();
		ticket1.setSchedule(schedule);
		ticketService.deleteTicketById(ticket1);
		int count=scheduleService.updateScheduleById(schedule);
		
		List<Studio> list=studioService.Query(schedule.getStudio());
		Iterator<Studio> it=list.iterator();
		List<Seat> seats=it.next().getSeats();
		for(Seat seat:seats)
		{
			Ticket ticket = new Ticket();
			ticket.setSchedule(schedule);
			ticket.setTicket_price(schedule.getSched_ticket_price());
			ticket.setSeat(seat);
			if(seat.getSeat_status().equals("0"))
			{
				ticket.setTicket_status(0);
			}
			else
			{
				ticket.setTicket_status(1);
			}
			ticketService.insertTicket(ticket);
		}
		HashMap<String, Integer> map = new HashMap<>();
		map.put("result",count);
		return JSONArray.fromObject(map).toString();
	}
	@RequestMapping(path="/date.do")
	@ResponseBody
	public List<Schedule> updateByDate(Schedule schedule)
	{
		if(schedule.getSched_time()==null)
		{
			return null;
		}
		return scheduleService.getScheduleByDate(schedule);
	}
	@RequestMapping(path="/getall.do")
	@ResponseBody
	public List<Schedule> getAll()
	{
		return scheduleService.getSchedule();
	}
	@RequestMapping(path="/find.do")
	@ResponseBody
	public List<Schedule> getAllSchedById(Schedule schedule)
	{
		return scheduleService.findScheduleById(schedule);
	}
	@RequestMapping(path="/updateSeat.do")
	@ResponseBody
	public String updateSeat(Seat seat)
	{
		int count=seatService.updateSeat(seat);
		HashMap<String, Integer> map = new HashMap<>();
		map.put("result", count);
		return JSONArray.fromObject(map).toString();
	}
}
