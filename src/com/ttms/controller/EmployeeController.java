package com.ttms.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttms.common.Page;
import com.ttms.model.Employee;
import com.ttms.service.EmployeeService;

@Controller
@RequestMapping(path="/employee")
public class EmployeeController {
	@Resource(name="employeeService")
	private EmployeeService employeeService;
	@RequestMapping(path="/insert.do")
	public String Insert(Employee employee)
	{
		if(employeeService.insertEmp(employee)>0)
		{
			return "index";
		}
		return "error";
	}
	@RequestMapping(path="/delete.do")
	@ResponseBody
	public int Delete(String empNo)
	{
		return employeeService.deleteByEmpNo(empNo);
	}
	@RequestMapping(path="/update.do")
	@ResponseBody
	public int update(Employee employee)
	{
		return employeeService.updateEmp(employee);
	}
	@RequestMapping(path="/query.do")
	@ResponseBody
	public List<Employee> Query(Page page)
	{
	
		return employeeService.getAllByPage(page);
	}
	@RequestMapping(path="/get.do")
	@ResponseBody
	public List<Employee> getAllEmployee()
	{
		
		return employeeService.getAllEmployee();
	}
	
	@RequestMapping(path="/get1.do")
	@ResponseBody
	public Employee getEmployeeById(Employee employee)
	{
		System.out.println(employee.getEmp_id());
		return employeeService.getEmployeeById(employee.getEmp_id());
	}
}
