package com.ttms.service;
import java.util.List;

import com.ttms.common.Page;
import com.ttms.model.Employee;

public interface EmployeeService {
	public  int insertEmp(Employee employee);
	public int deleteByEmpNo(String empNo);
	public int updateEmp(Employee employee);
	public int getCount();
	public List<Employee> getAllByPage(Page page);
	public Employee getEmployeeById(int id);
	public List<Employee> getAllEmployee();
}
