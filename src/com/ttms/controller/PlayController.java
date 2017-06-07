package com.ttms.controller;

import java.io.File;
import java.util.ArrayList;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ttms.model.Play;
import com.ttms.service.PlayService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(path="/play")
public class PlayController {
	@Resource(name="playService")
	private PlayService playService;
	
	@RequestMapping(path="/insertPlay.do")
	public String insertPlay(Model model,Play play){
		play.setPaly_image("asdasd");
		playService.insertPlay(play);
		List<Play> plays = new ArrayList<>();
		plays = playService.getAllData(play);
		JSONArray array = new JSONArray();
		for(Play p:plays){
			JSONObject obj = new JSONObject();
			obj.put("play_id", p.getPlay_id());
			obj.put("play_image", p.getPaly_image());
			obj.put("play_introduce", p.getPlay_introduce());
			obj.put("play_length", p.getPlay_length());
			obj.put("play_name", p.getPlay_name());
			obj.put("play_status", p.getPaly_status());
			obj.put("play_ticket_price", p.getPlay_ticket_price());
			obj.put("play_type", p.getPlay_type());
			array.add(obj);
		}
		model.addAttribute("plays",array.toString());
		System.out.println(array.toString());
		System.out.println(plays.size());
		return "project/play";
	}
	
	@RequestMapping(path="/deletePlay.do")
	@ResponseBody
	public List<Play> deletePlay(Play play){
		playService.deleteByPlayNo(play);
		System.out.println("delete");
		play.setPlay_name("");
		List<Play> plays = new ArrayList<>();
		plays = playService.getAllData(play);
		for(Play p:plays){
			System.out.println(p.getPlay_name());
			System.out.println(p.getPlay_id());
			System.out.println(p.getPlay_introduce());
		}
		return plays;
	}
	
	@RequestMapping(path="/updatePlay.do")
	public String updatePlay(Play play){
		play.setPaly_image("asdasd");
		System.out.println(play.getPlay_name());
		System.out.println(play.getPlay_id());
		System.out.println(play.getPlay_introduce());
		System.out.println(play.getPlay_length());
		System.out.println(play.getPaly_status());
		System.out.println(play.getPlay_ticket_price());
		System.out.println(play.getPlay_type());
		playService.updatePlay(play);
		return "project/play";
	}
	
	@RequestMapping(path="/getAllData.do")
	@ResponseBody
	public List<Play> getAllData(Play play){	//查询所有数据
		List<Play> plays = new ArrayList<>();
		plays = playService.getAllData(play);
		return plays;
	}
	
	@RequestMapping(path = "/upload.do")  
    public String upload(Play play,@RequestParam(value = "file", required = false)MultipartFile file,HttpServletRequest request,Model model) {  

        System.out.println("开始");
        System.out.println(play.getPlay_name());
		System.out.println(play.getPlay_id());
		System.out.println(play.getPlay_introduce());
		System.out.println(play.getPlay_length());
		System.out.println(play.getPaly_status());
		System.out.println(play.getPlay_ticket_price());
		System.out.println(play.getPlay_type());
        String path = request.getSession().getServletContext().getRealPath("upload");  
        String fileName = file.getOriginalFilename();  
//        String fileName = new Date().getTime()+".jpg";  
        System.out.println(path);  
        File targetFile = new File(path, fileName);  
        if(!targetFile.exists()){  
            targetFile.mkdirs();  
        }  
  
        //保存  
        try {  
            file.transferTo(targetFile);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }
        String realTrace = path+fileName;
        //String trace = "upload\\"+fileName;
        System.out.println(realTrace);
        System.out.println(request.getContextPath()+"/upload/"+fileName);
        //model.addAttribute("fileUrl", request.getContextPath()+"/upload/"+fileName);
        play.setPaly_image("upload/"+fileName);
        playService.insertPlay(play);
        return "project/play";  
    }  
	
	@RequestMapping(path = "/uploadUpdate.do")  
    public String uploadUpdate(Play play,@RequestParam(value = "file", required = false)MultipartFile file,HttpServletRequest request,Model model) {  

        System.out.println("开始");
        System.out.println(play.getPlay_name());
		System.out.println(play.getPlay_id());
		System.out.println(play.getPlay_introduce());
		System.out.println(play.getPlay_length());
		System.out.println(play.getPaly_status());
		System.out.println(play.getPlay_ticket_price());
		System.out.println(play.getPlay_type());
        String path = request.getSession().getServletContext().getRealPath("upload");  
        String fileName = file.getOriginalFilename();  
//        String fileName = new Date().getTime()+".jpg";  
        System.out.println(path);  
        File targetFile = new File(path, fileName);  
        if(!targetFile.exists()){  
            targetFile.mkdirs();  
        }  
  
        //保存  
        try {  
            file.transferTo(targetFile);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }
        String realTrace = path+fileName;
        //String trace = "upload\\"+fileName;
        System.out.println(realTrace);
        System.out.println(request.getContextPath()+"/upload/"+fileName);
        //model.addAttribute("fileUrl", request.getContextPath()+"/upload/"+fileName);
        String imgPath = "upload/"+fileName;
        System.out.println(file.toString());
        System.out.println(imgPath);
        play.setPaly_image(imgPath);
        playService.updatePlay(play);
        return "project/play";  
    }  
}
