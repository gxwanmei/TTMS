package com.ttms.dao;

import java.sql.SQLException;
import java.util.List;

import com.ttms.common.Page;
import com.ttms.model.Employee;

public interface EmployeeDao {
	public  int insertEmp(Employee employee) throws SQLException;
	
	public int deleteByEmpNo(String empNo)throws SQLException;
	
	public int updateEmp(Employee employee)throws SQLException;
	
	public int getCount()throws SQLException;
	
	public Employee getEmployeeById(int id) throws SQLException;
	
	public List<Employee> getAllEmployee() throws SQLException;
	
	public List<Employee> getAllByPage(Page page)throws SQLException;
}
