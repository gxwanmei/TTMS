package com.ttms.service.imp;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.common.Page;
import com.ttms.dao.EmployeeDao;
import com.ttms.model.Employee;
import com.ttms.service.EmployeeService;
@Service(value="employeeService")
public class EmployeeServiceImp implements EmployeeService{
	@Resource
	private EmployeeDao dao;
	
	@Override
	public int insertEmp(Employee employee) {
		int count=0;
		try {
			count= dao.insertEmp(employee);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int deleteByEmpNo(String empNo) {
		int count=0;
		try {
			 count=dao.deleteByEmpNo(empNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int updateEmp(Employee employee) {
		int count=0;
		
		try {
			count= dao.updateEmp(employee);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int getCount(Employee employee) {
		int count=0;	//总记录数
		try {
			count=dao.getCount(employee);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public Map<String, Object> getAllByPage(Employee employee) {
		System.out.println("getAllByPage执行------》");
		Map<String,Object> employeeParam = new HashMap<String,Object>();	//查询参数
		int count = getCount(employee);
        int allPageCount = (count + Page.getPAGE_SIZE()- 1) / Page.getPAGE_SIZE();		// 记算总页数
        Page.setAllCountPage(allPageCount);
        if (allPageCount > 0 && Page.currentPage > allPageCount)
          Page.setCurrentPage(allPageCount);
        int currentData = (Page.currentPage-1)*Page.getPAGE_SIZE();	//当前起始查询条数
		String employee_no = employee.getEmp_no();			//获取查询的雇员编号
		System.out.println(employee_no);
		System.out.println(currentData);
		System.out.println(Page.getPAGE_SIZE());
		//给分页查询语句设置参数
		employeeParam.put("emp_no", employee_no);
		employeeParam.put("current", currentData);
		employeeParam.put("pageSize", Page.getPAGE_SIZE());
		List<Employee> employees = null;
		try {
			employees= dao.getAllByPage(employeeParam);
			for(Employee e:employees){								//调试信息
				System.out.println(e.getEmp_no());
				System.out.println(e.getEmp_name());
				System.out.println(e.getEmp_tel_num());
				System.out.println("---------->");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		Map<String,Object> empPage = new HashMap<String,Object>();
		empPage.put("employees",employees);
		empPage.put("allPageCount", allPageCount);
		return empPage;
	}

	@Override
	public Employee searchById(Employee employee) {
		Employee result = null;
		try {
			result = dao.searchById(employee);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public List<Employee> getAll(Employee employee){
		List<Employee> employess = new ArrayList<Employee>();
		try {
			employess = dao.getAll(employee);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			// TODO: handle exception
		}
		return employess;
	}

	//安卓
	public int insertEmployeeAd(Employee employee){
		int result = 0;
		try {
			result = dao.insertEmployeeAd(employee);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteEmployeeAd(Employee employee){
		int result = 0;
		try {
			result = dao.deleteEmployeeAd(employee);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	} 
}
