package com.ttms.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttms.model.Studio;
import com.ttms.service.StudioService;

@Controller
@RequestMapping(path="/studio")
public class StudioController {
	@Resource(name="studioService")
	private StudioService studioService;
	@RequestMapping(path="/insert.do")
	@ResponseBody
	public int insert(Studio studio)
	{
	
		return studioService.InsertStudio(studio);
	}
	@RequestMapping(path="/delete.do")
	@ResponseBody
	public int delete(Studio studio)
	{
	
		return studioService.deleteStudioById(studio.getStudio_id());
	}
	@RequestMapping(path="/update.do")
	@ResponseBody
	public int update(Studio studio)
	{
	
		return studioService.updateStudioById(studio);
	}
	@RequestMapping(path="/query.do")
	@ResponseBody
	public List<Studio> query()
	{
		return studioService.Query();
	}
}
