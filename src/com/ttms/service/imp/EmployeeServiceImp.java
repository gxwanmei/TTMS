package com.ttms.service.imp;

import java.sql.SQLException;
import java.util.List;

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
	public int getCount() {
		int count=0;
		try {
			count=dao.getCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public List<Employee> getAllByPage(Page page) {
		List<Employee> list = null;
		try {
			list= dao.getAllByPage(page);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Employee getEmployeeById(int id) {
		Employee emp = null;
		try {
			emp=dao.getEmployeeById(id);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return emp;
	}

	@Override
	public List<Employee> getAllEmployee()  {
		List<Employee> list =null;
		try {
			list=dao.getAllEmployee();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	

}
