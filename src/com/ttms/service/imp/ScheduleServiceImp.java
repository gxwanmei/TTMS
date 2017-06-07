package com.ttms.service.imp;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.dao.ScheduleDao;
import com.ttms.model.Schedule;
import com.ttms.service.ScheduleService;


@Service(value="scheduleService")
public class ScheduleServiceImp implements ScheduleService{
	@Resource
	private ScheduleDao dao;

	@Override
	public int InsertSched(Schedule schedule) {
		int count=0;
		try {
			count=dao.InsertSched(schedule);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public Schedule getScheduleById(Schedule schedule) {
		Schedule temp=null;
		try {
			temp=dao.getScheduleById(schedule);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	@Override
	public List<Schedule> getAllSchedule() {
		List<Schedule> list = null;
		try {
			list=dao.getAllSchedule();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int deleteScheduleById(Schedule schedule) {
		int count=0;
		try {
			count=dao.deleteScheduleById(schedule);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int updateScheduleById(Schedule schedule) {
		int count=0;
		try {
			count=dao.updateScheduleById(schedule);
			System.out.println(count);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public List<Schedule> getScheduleByDate(Schedule schedule) {
		List<Schedule> list = null;
		try {
			list= dao.getScheduleByDate(schedule);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	


}
