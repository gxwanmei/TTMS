package com.ttms.service;

import java.util.List;
import java.util.Map;

import com.ttms.common.Page;
import com.ttms.model.Employee;

public interface EmployeeService {
	public  int insertEmp(Employee employee);
	public int deleteByEmpNo(String empNo);
	public int updateEmp(Employee employee);
	public Employee searchById(Employee employee);
	public int getCount(Employee employee);
	public Map<String, Object> getAllByPage(Employee employee);
	public List<Employee> getAll(Employee employee);
	public int insertEmployeeAd(Employee employee);
	public int deleteEmployeeAd(Employee employee);
}
