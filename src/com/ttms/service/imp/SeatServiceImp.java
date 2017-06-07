package com.ttms.service.imp;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.dao.SeatDao;
import com.ttms.model.Seat;
import com.ttms.model.Studio;
import com.ttms.service.SeatService;
@Service(value="seatService")
public class SeatServiceImp implements SeatService{
	@Resource
	private SeatDao dao;
	@Override
	public int insertSeat(Seat seat) {
		int count=0;
		try {
			count=dao.insertSeat(seat);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	@Override
	public int deleteAllSeatByStudioId(Studio studio) {
		int count=0;
		try {
			count=dao.deleteAllSeatByStudioId(studio);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	@Override
	public List<Seat> getAllSeat(Studio studio) {
		List<Seat> list =null; 
		try {
			list=dao.getAllSeat(studio);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int updateSeat(Seat seat) {
		int count=0;
		try {
			count=dao.updateSeat(seat);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	@Override
	public int findSeatByStudioId(Studio studio) {
		int count=0;
		try {
			count=dao.findSeatByStudioId(studio);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}


}
