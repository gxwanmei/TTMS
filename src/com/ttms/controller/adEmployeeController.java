package com.ttms.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttms.common.Page;
import com.ttms.model.Employee;
import com.ttms.service.EmployeeService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(path="/adEmployee")
public class adEmployeeController {
	@Resource(name="employeeService")
	private EmployeeService employeeService;
	@RequestMapping(path="/insert.do")
	@ResponseBody
	public String Insert(Employee employee)
	{
		if(employee.getEmp_name().equals("null")){
			employee.setEmp_name("");
			System.out.println("if1");
		}else if(employee.getEmp_tel_num().equals("null")){
			employee.setEmp_tel_num("");
			System.out.println("if2");
		}else if(employee.getEmp_addr().equals("null")){
			employee.setEmp_addr("");
		}
		System.out.println(employee.getEmp_name());
		System.out.println(employee.getEmp_tel_num());
		System.out.println(employee.getEmp_addr());
		employee.setEmp_email("6587561@qq.com");
		employee.setEmp_no("10000");
		employeeService.insertEmployeeAd(employee);
		employee.setEmp_no(String.valueOf(1000+employee.getEmp_id()));
		employeeService.updateEmp(employee);
		JSONObject obj = new JSONObject();
		obj.put("emp_id", employee.getEmp_id());
		return JSONArray.fromObject(obj).toString();
	}
	@RequestMapping(path="/delete.do")
	@ResponseBody
	public String Delete(Employee employee)
	{	
		int result =  employeeService.deleteEmployeeAd(employee);
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		return JSONArray.fromObject(obj).toString();
	}
	@RequestMapping(path="/update.do")
	@ResponseBody
	public String Update(Model model,Employee employee)
	{	
		if(employee.getEmp_name()==null){
			employee.setEmp_name("");
		}else if(employee.getEmp_tel_num()==null){
			employee.setEmp_tel_num("");
		}else if(employee.getEmp_addr()==null){
			employee.setEmp_addr("");
		}
		Employee emp = employeeService.searchById(employee);
		emp.setEmp_name(employee.getEmp_name());
		emp.setEmp_tel_num(employee.getEmp_tel_num());
		emp.setEmp_addr(employee.getEmp_addr());
		int result =  employeeService.updateEmp(emp);
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		return JSONArray.fromObject(obj).toString();
	}
	
	@RequestMapping(path="/query.do")
	@ResponseBody
	public List<Employee> Query(Model model,Employee employee)
	{	
		employee.setEmp_name("");
		List<Employee> employees= new ArrayList<Employee>();
		employees = employeeService.getAll(employee);
	
		return employees;
	}
}
