package com.ttms.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ttms.common.Page;
import com.ttms.model.Employee;

public interface EmployeeDao {
	public  int insertEmp(Employee employee) throws SQLException;
	
	public int deleteByEmpNo(String empNo)throws SQLException;
	
	public int updateEmp(Employee employee)throws SQLException;
	
	public int getCount(Employee employee)throws SQLException;
	
	public Employee searchById(Employee employee)throws SQLException;
	
	public List<Employee> getAllByPage(Map<String, Object> employeeParam)throws SQLException;

	public List<Employee> getAll(Employee employee)throws SQLException;
	
	public int insertEmployeeAd(Employee employee)throws SQLException;
	
	public int deleteEmployeeAd(Employee employee)throws SQLException;
}
