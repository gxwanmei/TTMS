package com.ttms.controller;


import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttms.model.Seat;
import com.ttms.model.Studio;
import com.ttms.service.SeatService;
import com.ttms.service.StudioService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping(path="/ad/studio")
public class StudioAdController {
	@Resource(name="studioService")
	private StudioService studioService;
	@Resource(name="seatService")
	private SeatService seatService;
	@RequestMapping(path="/insert.do")
	@ResponseBody
	public String insert(Studio studio)
	{
		studioService.InsertStudio(studio);
		HashMap<String, Integer > map = new HashMap<>();
		map.put("studio_id", studio.getStudio_id());
		return JSONArray.fromObject(map).toString();
	}
	@RequestMapping(path="/delete.do")
	@ResponseBody
	public String delete(Studio studio)
	{
		HashMap<String, Integer > map = new HashMap<>();
		map.put("result",studioService.deleteStudioById(studio.getStudio_id()));
		return JSONArray.fromObject(map).toString();
	}
	@RequestMapping(path="/updateSeat.do")
	@ResponseBody
	public int updateSeat(@RequestBody List<Seat> seats)
	{
		int count=0;
		for(Seat seat:seats)
		{
			System.out.println(seat.getStudio().getStudio_id());
			seatService.updateSeat(seat);
			count++;
		}
		return count;
	}
	@RequestMapping(path="/update.do")
	@ResponseBody
	public String update(Studio studio)
	{
		HashMap<String, Integer > map = new HashMap<>();
		map.put("result", studioService.updateStudioById(studio));
		return JSONArray.fromObject(map).toString();
	}
	@RequestMapping(path="/query.do")
	@ResponseBody
	public List<Studio> query(Studio studio)
	{
		return studioService.QueryAll();
	}
	@RequestMapping(path="/creat.do")
	@ResponseBody
	public int creat(Studio studio)
	{
		int count=0;
		if(studio.getStudio_size()==null || studio.getStudio_id()==null)
		{
			return count;
		}
		seatService.deleteAllSeatByStudioId(studio);
		System.out.println(studio.getStudio_size());
		if(studio.getStudio_size().equals("big"))
		{
			for(int i=1;i<8;i++)
				for(int j=1;j<11;j++)
				{
					Seat seat = new Seat();
					seat.setSeat_row(String.valueOf(i));
					seat.setSeat_colum(String.valueOf(j));
					seat.setSeat_status(String.valueOf(0));
					seat.setStudio(studio);
					seatService.insertSeat(seat);
					count++;
				}
		}
		else if(studio.getStudio_size().equals("default"))
		{
			for(int i=1;i<7;i++)
				for(int j=1;j<10;j++)
				{
					Seat seat = new Seat();
					seat.setSeat_row(String.valueOf(i));
					seat.setSeat_colum(String.valueOf(j));
					seat.setSeat_status(String.valueOf(0));
					seat.setStudio(studio);
					seatService.insertSeat(seat);
					count++;
				}
		}
		else if(studio.getStudio_size().equals("small"))
		{
			for(int i=1;i<6;i++)
				for(int j=1;j<9;j++)
				{
					Seat seat = new Seat();
					seat.setSeat_row(String.valueOf(i));
					seat.setSeat_colum(String.valueOf(j));
					seat.setSeat_status(String.valueOf(0));
					seat.setStudio(studio);
					seatService.insertSeat(seat);
					count++;
				}
		}
		return count;
	}
	@RequestMapping(path="/creat1.do")
	@ResponseBody
	public List<Seat> creat1(Studio studio)
	{
		seatService.deleteAllSeatByStudioId(studio);
		if(studio.getStudio_size().equals("big"))
		{
			for(int i=1;i<8;i++)
				for(int j=1;j<11;j++)
				{
					Seat seat = new Seat();
					seat.setSeat_row(String.valueOf(i));
					seat.setSeat_colum(String.valueOf(j));
					seat.setSeat_status(String.valueOf(0));
					seat.setStudio(studio);
					seatService.insertSeat(seat);
				}
		}
		else if(studio.getStudio_size().equals("default"))
		{
			for(int i=1;i<7;i++)
				for(int j=1;j<10;j++)
				{
					Seat seat = new Seat();
					seat.setSeat_row(String.valueOf(i));
					seat.setSeat_colum(String.valueOf(j));
					seat.setSeat_status(String.valueOf(0));
					seat.setStudio(studio);
					seatService.insertSeat(seat);
				}
		}
		else if(studio.getStudio_size().equals("small"))
		{
			for(int i=1;i<6;i++)
				for(int j=1;j<9;j++)
				{
					Seat seat = new Seat();
					seat.setSeat_row(String.valueOf(i));
					seat.setSeat_colum(String.valueOf(j));
					seat.setSeat_status(String.valueOf(0));
					seat.setStudio(studio);
					seatService.insertSeat(seat);
				}
		}
		System.out.println(studio.getStudio_id());
		System.out.println(studio.getStudio_size());
		List<Seat> list = seatService.getAllSeat(studio);
		return list;
	}
}
		

