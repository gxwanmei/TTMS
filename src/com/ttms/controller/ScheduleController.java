package com.ttms.controller;


import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttms.model.Play;
import com.ttms.model.Schedule;
import com.ttms.model.Seat;
import com.ttms.model.Studio;
import com.ttms.model.Ticket;
import com.ttms.service.PlayService;
import com.ttms.service.ScheduleService;
import com.ttms.service.StudioService;
import com.ttms.service.TicketService;

@Controller
@RequestMapping(path="/schedule")
public class ScheduleController {
	@Resource(name="scheduleService")
	private ScheduleService scheduleService;
	@Resource(name="studioService")
	private StudioService studioService;
	@Resource(name="playService")
	private PlayService playService;
	@Resource(name="ticketService")
	private TicketService ticketService;
	@RequestMapping(path="/insert.do")
	@ResponseBody
	public int insertSched(Schedule schedule)
	{
		int count=scheduleService.InsertSched(schedule);
		
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
		return count;
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
	public String getAllSchedule(Model model)
	{	
		List<Schedule> scheds=scheduleService.getAllSchedule();
		model.addAttribute("scheds", scheds);
		return "/performancePlan";
	}
	@RequestMapping(path="/delete.do")
	public String deleteById(Schedule schedule)
	{
		if(schedule.getSched_id()==0)
		{
			return null;
		}
		Ticket ticket = new Ticket();
		ticket.setSchedule(schedule);
		ticketService.deleteTicketById(ticket);
		scheduleService.deleteScheduleById(schedule);
		return "redirect:/performancePlan.jsp";
	}
	@RequestMapping(path="/update.do")
	@ResponseBody
	public int updateById(Schedule schedule)
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
		
		return count;
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
	@RequestMapping(path="/enter.do")
	@ResponseBody
	public List<Schedule> getAll(Model model,HttpSession session)
	{
		List<Schedule> scheds=scheduleService.getSchedule();

		return scheds;
	}
	@RequestMapping("/stuname.do")
	@ResponseBody
	public List<Studio> getStuidoName(Studio studio)
	{
		studio.setStudio_name("");
		List<Studio> list = studioService.getAllStudio(studio);
		return list;
	}
	@RequestMapping("/plname.do")
	@ResponseBody
	public List<Play> getPlayName(Play play)
	{
		play.setPlay_name("");
		List<Play> list = playService.getAllData(play);
		return list;
	}
	@RequestMapping(path="/find.do")
	@ResponseBody
	public List<Schedule> getAllSchedById(Schedule schedule)
	{
		return scheduleService.findScheduleById(schedule);
	}
	@RequestMapping(path="/gdate.do")
	@ResponseBody
	public List<Schedule> getDateSched()
	{
		return scheduleService.getScheduleDate();
	}
}
