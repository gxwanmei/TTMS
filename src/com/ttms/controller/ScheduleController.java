package com.ttms.controller;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttms.model.Schedule;
import com.ttms.service.ScheduleService;

@Controller
@RequestMapping(path="/schedule")
public class ScheduleController {
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
	@ResponseBody
	public int updateById(Schedule schedule)
	{
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
}
