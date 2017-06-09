package com.ttms.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttms.model.Play;
import com.ttms.service.PlayService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(path="/adPlay")
public class adPlayController {
	@Resource(name="playService")
	private PlayService playService;
	
	@RequestMapping(path="/insertPlay.do")
	@ResponseBody
	public String insertPlay(@RequestBody Play play,HttpServletRequest request){
		System.out.println("------------->");
		String current = String.valueOf(System.currentTimeMillis());
		play.setPlay_length(60);
		play.setPlay_status(1);
		play.setPlay_ticket_price(60);
		play.setPlay_type(1);
		play.setPlay_image("image");
		if(play.getPlay_introduce()==null){
			play.setPlay_introduce("");
		}
		//play.setPlay_introduce("asd");
		//play.setPlay_name("asd");
		//play.setPlay_imgString("d");
		
		System.out.println(play.getPlay_name());
		System.out.println(play.getPlay_introduce());
		System.out.println(play.getPlay_imgString());
		//获取存储路径
				
				String path = request.getSession().getServletContext().getRealPath("upload//");
				System.out.println(path);
				File file = new File(path);
				if(!file.exists()){
					file.mkdir();
				}
				String imgPath  = path + current+".jpg";
				System.out.println(imgPath);
				String imgStr = play.getPlay_imgString();
				boolean flag = playService.stringImage(imgStr, imgPath);
				System.out.println(flag);
				String pathStr = "upload/"+current+".jpg";
				play.setPlay_image(pathStr);
				playService.insertPlay(play);
				System.out.println(play.getPlay_id());
				System.out.println(play.getPlay_image());
//				JSONObject obj = new JSONObject();
//				obj.put("id", play.getPlay_id());
//				obj.put("play_image", play.getPlay_image());
				Map<String,Object> m = new HashMap<>();
				m.put("play_id", play.getPlay_id());
				m.put("play_img", pathStr);
				
				return JSONArray.fromObject(m).toString();
	}
	
	@RequestMapping(path="/deletePlay.do")
	@ResponseBody
	public String deletePlay(Model model,Play play){
		System.out.println("--------->delete");
		int result = playService.deleteByPlayNo(play);
		
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		
		return JSONArray.fromObject(obj).toString();
	}
	
	@RequestMapping(path="/updatePlay.do")
	@ResponseBody
	public String updatePlay(@RequestBody Play play,HttpServletRequest request){
		String current = String.valueOf(System.currentTimeMillis());
		play.setPlay_length(60);
		play.setPlay_status(1);
		play.setPlay_ticket_price(60);
		play.setPlay_type(1);
		if(play.getPlay_introduce()==null){
			play.setPlay_introduce("");
		}
		System.out.println(play.getPlay_id());
		System.out.println(play.getPlay_name());
		System.out.println(play.getPlay_introduce());
		System.out.println(play.getPlay_imgString());
		
		//获取存储路径
		
		String path = request.getSession().getServletContext().getRealPath("upload//");
		System.out.println(path);
		File file = new File(path);
		if(!file.exists()){
			file.mkdir();
		}
		String imgPath  = path + current+".jpg";
		System.out.println(imgPath);
		String imgStr = play.getPlay_imgString();
		boolean flag = playService.stringImage(imgStr, imgPath);
		System.out.println(flag);
		String pathStr = "upload/"+current+".jpg";
		play.setPlay_image(pathStr);
		int result = playService.updatePlay(play);
		System.out.println(play.getPlay_id());
		System.out.println(play.getPlay_image());
		
		JSONObject obj = new JSONObject();
		obj.put("play_img", pathStr);
		obj.put("result", result);
		
		return JSONArray.fromObject(obj).toString();
	}
	
	@RequestMapping(path="/getAllData.do")
	@ResponseBody
	public List<Play> getAllData(Model model){	//查询所有数据
		System.out.println("--------->");
		Play play = new Play();
		play.setPlay_name("");
		List<Play> plays = new ArrayList<>();
		plays = playService.getAllData(play);

		return plays;
	}

}

