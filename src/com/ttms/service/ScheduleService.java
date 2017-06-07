package com.ttms.service;


import java.util.List;

import com.ttms.model.Schedule;

public interface ScheduleService {
	public int InsertSched(Schedule schedule);
	public Schedule getScheduleById(Schedule schedule);
	public List<Schedule> getAllSchedule();
	public int deleteScheduleById(Schedule schedule);
	public int updateScheduleById(Schedule schedule);
	public List<Schedule> getScheduleByDate(Schedule schedule);
}
