package com.ttms.dao;

import java.sql.SQLException;
import java.util.List;

import com.ttms.model.Schedule;

public interface ScheduleDao {
	/**
	 * 增加一条演出计划  返回值是自增后主键的ID
	 * @param schedule
	 * @return
	 */
	public int InsertSched(Schedule schedule) throws SQLException;
	/**
	 * 根据id查找演出计划
	 * @return
	 * @throws SQLException
	 */
	public Schedule getScheduleById(Schedule schedule) throws SQLException;
	/**
	 * 得到所有演出计划
	 * @return
	 * @throws SQLException
	 */
	public List<Schedule> getAllSchedule() throws SQLException;
	/**
	 * 得到所有演出计划  包含其所包含的的剧目和演出厅 专为安卓而写
	 * @return
	 * @throws SQLException
	 */
	public List<Schedule> getSchedule() throws SQLException;
	/**
	 * 根据演出计划id得到所有演出计划  包含其所包含的的剧目和演出厅
	 */
	public List<Schedule> findScheduleById(Schedule schedule) throws SQLException;
	/**
	 * 根据id修改演出计划,不包含其他信息
	 * @return
	 * @throws SQLException
	 */
	public int updateScheduleById(Schedule schedule) throws SQLException;
	/**
	 * 根据id删除演出计划
	 * @return
	 * @throws SQLException
	 */
	public int deleteScheduleById(Schedule schedule) throws SQLException;
	/**
	 * 根据日期查询演出计划
	 */
	public List<Schedule> getScheduleByDate(Schedule schedule) throws SQLException;
	/**
	 * 得到所有演出计划的日期
	 */
	public List<Schedule> getScheduleDate() throws SQLException;
}
