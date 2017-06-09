package com.ttms.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttms.model.Seat;
import com.ttms.model.Studio;
import com.ttms.service.SeatService;
import com.ttms.service.StudioService;

@Controller
@RequestMapping(path="/studio")
public class StudioController {
	@Resource(name="studioService")
	private StudioService studioService;
	@Resource(name="seatService")
	private SeatService seatService;
	@RequestMapping(path="/insert.do")
	public String insert(Studio studio)
	{
		studioService.InsertStudio(studio);
		return "redirect:/studio/enter.do";
	}
	@RequestMapping(path="/delete.do")
	public String delete(Studio studio)
	{
		studioService.deleteStudioById(studio.getStudio_id());
		return "redirect:/studio/enter.do";
	}
	@RequestMapping(path="/get.do")
	@ResponseBody
	public Studio get(Studio studio)
	{
	
		return studioService.getStudioById(studio);
	}
	@RequestMapping(path="/update.do")
	public String update(Studio studio)
	{
		studioService.updateStudioById(studio);
	
		return "redirect:/studio/enter.do" ;
	}
	@RequestMapping(path="/query.do")
	@ResponseBody
	public List<Studio> query(Studio studio)
	{
		return studioService.Query(studio);
	}
	@RequestMapping(path="/updateSeat.do")
	@ResponseBody
	public int updateSeat(Seat seat)
	{
		int count=seatService.updateSeat(seat);
		return count;
	}
	@RequestMapping(path="/enter.do")
	public String getAllStudio(Model model,Studio studio,HttpSession session)
	{
		if(studio.getStudio_name()==null)
		{
			studio.setStudio_name("");
		}
		List<Studio> list=studioService.getAllStudio(studio);
		model.addAttribute("studios", list);
		return "/studio";
	}
	@RequestMapping(path="/enterSeat.do")
	@ResponseBody
	public List<Studio> getAllSeat(Model model,Studio studio,HttpSession session)
	{
		if(studio.getStudio_name()==null)
		{
			studio.setStudio_name("");
		}
		List<Studio> list=studioService.getAllStudio(studio);
		model.addAttribute("studios", list);
		return list;
	}
	@RequestMapping(path="/creat.do")
	@ResponseBody
	public List<Seat> creat(Studio studio,Model model)
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
		
		List<Seat> list = seatService.getAllSeat(studio);
		return list;
	}
}
