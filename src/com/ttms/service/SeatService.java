package com.ttms.service;

import java.util.List;

import com.ttms.model.Seat;
import com.ttms.model.Studio;

public interface SeatService {
	public int insertSeat(Seat seat);
	public int deleteAllSeatByStudioId(Studio studio);
	public List<Seat> getAllSeat(Studio studio);
	public int updateSeat(Seat seat);
	public int findSeatByStudioId(Studio studio);
}
