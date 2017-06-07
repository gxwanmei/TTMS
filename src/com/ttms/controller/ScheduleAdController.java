package com.ttms.controller;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttms.model.Schedule;
import com.ttms.service.ScheduleService;

@Controller
@RequestMapping(path="/ad/schedule")
public class ScheduleAdController {
	@Resource(name="scheduleService")
	private ScheduleService scheduleService;
	@RequestMapping(path="/insert.do")
	@ResponseBody
	public int insertSched(Schedule schedule)
	{
		int count=scheduleService.InsertSched(schedule);
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
	public List<Schedule> getAllSchedule()
	{
			return scheduleService.getAllSchedule();
	}
	@RequestMapping(path="/delete.do")
	@ResponseBody
	public int deleteById(Schedule schedule)
	{
		if(schedule.getSched_id()==0)
		{
			return 0;
		}
		return scheduleService.deleteScheduleById(schedule);
	}
	@RequestMapping(path="/update.do")
	public int updateById(Schedule schedule)
	{
		System.out.println(schedule.getStudio().getStudio_name());
		System.out.println(schedule.getPlay().getPlay_name());
		if(schedule.getSched_id()==0)
		{
			return 0;
		}
		return scheduleService.updateScheduleById(schedule);
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
}
