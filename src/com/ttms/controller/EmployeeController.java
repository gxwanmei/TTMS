package com.ttms.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ttms.common.Page;
import com.ttms.model.Employee;
import com.ttms.service.EmployeeService;

@Controller
@RequestMapping(path="/employee")
public class EmployeeController {
	@Resource(name="employeeService")
	private EmployeeService employeeService;
	@RequestMapping(path="/insert.do")
	public String Insert(Model model,Employee employee)
	{
		if(employeeService.insertEmp(employee)>0)
		{
			employee.setEmp_no("");
			int count = employeeService.getCount(employee);
			int allCountPage =   (count + Page.getPAGE_SIZE()- 1) / Page.getPAGE_SIZE();
			int currentPage = allCountPage;
			Page.setCurrentPage(currentPage);
			Map<String,Object> empPage= employeeService.getAllByPage(employee);		//获取查询的结果集
			List<Employee> employees = (List<Employee>) empPage.get("employees");

			int nextPage = (currentPage+1)>Page.allCountPage?Page.allCountPage:(currentPage+1);	//下一页的页号
			int beforePage = (currentPage-1)<1?1:(currentPage-1);						//上一页的页号
			model.addAttribute("employees", employees);						//model可以看做一个map，put进去的值实际上都存在了request的attribute中了
			model.addAttribute("currentPage",Page.currentPage);
			model.addAttribute("allCountPage", allCountPage);
			model.addAttribute("nextPage",	nextPage);
			model.addAttribute("beforePage", beforePage);
			
			return "/employee";
			
		}
			return "error";
	}
	@RequestMapping(path="/delete.do")
	public String Delete(Model model,int currentPage,Employee employee)
	{	
		String empNo = employee.getEmp_no();
		employeeService.deleteByEmpNo(empNo);
		employee.setEmp_no("");
		Page.setCurrentPage(currentPage);
		Map<String,Object> empPage= employeeService.getAllByPage(employee);		//获取查询的结果集
		List<Employee> employees = (List<Employee>) empPage.get("employees");

		int allCountPage = (int)empPage.get("allPageCount");
		int nextPage = (currentPage+1)>Page.allCountPage?Page.allCountPage:(currentPage+1);	//下一页的页号
		int beforePage = (currentPage-1)<1?1:(currentPage-1);						//上一页的页号
		model.addAttribute("employees", employees);						//model可以看做一个map，put进去的值实际上都存在了request的attribute中了
		model.addAttribute("currentPage",Page.getCurrentPage());
		model.addAttribute("allCountPage", allCountPage);
		model.addAttribute("nextPage",	nextPage);
		model.addAttribute("beforePage", beforePage);
		
		return "/employee";
	}
	@RequestMapping(path="/update.do")
	public String update(Model model,Employee employee)
	{	
		System.out.println(employee.getEmp_id());
		System.out.println(employee.getEmp_no());
		employeeService.updateEmp(employee);
		int currentPage = Page.currentPage;
		employee.setEmp_no("");
		Map<String,Object> empPage= employeeService.getAllByPage(employee);		//获取查询的结果集
		List<Employee> employees = (List<Employee>) empPage.get("employees");

		int allCountPage = (int)empPage.get("allPageCount");
		int nextPage = (currentPage+1)>Page.allCountPage?Page.allCountPage:(currentPage+1);	//下一页的页号
		int beforePage = (currentPage-1)<1?1:(currentPage-1);						//上一页的页号
		model.addAttribute("employees", employees);						//model可以看做一个map，put进去的值实际上都存在了request的attribute中了
		model.addAttribute("currentPage",Page.currentPage);
		model.addAttribute("allCountPage", allCountPage);
		model.addAttribute("nextPage",	nextPage);
		model.addAttribute("beforePage", beforePage);
		return "/employee";
	}
	//分页查询
	@RequestMapping(path="/query.do")
	public String Query(Model model,Employee employee,Integer currentPage)
	{
		if(currentPage==null || employee.getEmp_no()==null)
		{
			currentPage=1;
			employee.setEmp_no("");
		}
		/*首页与尾页：点击超链接时直接传来currentPage为首页或者尾页的页号
		  在每次执行getAllPage()时每次都会计算出上一页与下一页的页号。在点击首页和尾页时因为接受的时固定的页号，则不受影响，
		  而在执行上一页与下一页时接收的位nextPage和beforePage则会执行翻页操作。
		*/
		Page.setCurrentPage(currentPage);						//设置当前页
		Map<String,Object> empPage= employeeService.getAllByPage(employee);		//获取查询的结果集
		List<Employee> employees = (List<Employee>) empPage.get("employees");

		int allPageCount = (int)empPage.get("allPageCount");	//分页的总页数
		int nextPage = (currentPage+1)>Page.allCountPage?Page.allCountPage:(currentPage+1);	//下一页的页号
		int beforePage = (currentPage-1)<1?1:(currentPage-1);						//上一页的页号
		System.out.println(employee.getEmp_no());
		Page.setCurrentPage(currentPage);				//将信息绑定在model中输出在jsp页面
		model.addAttribute("emp_no",employee.getEmp_no());
		model.addAttribute("employees", employees);						//model可以看做一个map，put进去的值实际上都存在了request的attribute中了
		model.addAttribute("currentPage",Page.currentPage);
		model.addAttribute("allCountPage", allPageCount);
		model.addAttribute("nextPage",	nextPage);
		model.addAttribute("beforePage", beforePage);
		return "/employee";
	}
}
