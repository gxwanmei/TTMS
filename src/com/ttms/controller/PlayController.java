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



@Controller
@RequestMapping(path="/play")
public class PlayController {
	@Resource(name="playService")
	private PlayService playService;
	
	
	@RequestMapping(path="/deletePlay.do")
	public String deletePlay(Play play){
		playService.deleteByPlayNo(play);

		return "play";
	}
	
	@RequestMapping(path="/getAllData.do")
	@ResponseBody
	public List<Play> getAllData(Play play){	//查询所有数据
		List<Play> plays = new ArrayList<>();
		plays = playService.getAllData(play);
		return plays;
	}
	
	@RequestMapping(path="/searchById.do")
	public String searchById(Model model,Play play){
		System.out.println("-------searchById");
		System.out.println(play.getPlay_id());
		Play p = new Play();
		p = playService.searchById(play);
		System.out.println(p.getPlay_name());
		model.addAttribute("play", p);
		String status = "未上映";
		String type = "爱情片";
		
		if(p.getPlay_status()==0){
			status = "未上映";
		}else{
			status = "已上映";
		}
		
		if(p.getPlay_type()==1){
			type = "爱情片";
		}
		else if(p.getPlay_type()==2){
			type = "恐怖片";
		}
		else if(p.getPlay_type()==3){
			type = "动漫剧";
		}
		else if(p.getPlay_type()==4){
			type = "生活剧";
		}
		else if(p.getPlay_type()==5){
			type ="古装剧";
		}
		else if(p.getPlay_type()==6){
			type = "战争片";
		}
		else if(p.getPlay_type()==7){
			type = "科幻片";
		}
		model.addAttribute("playtype",type);
		model.addAttribute("playstatus", status);
		return "playInformation";
	}
	
	@RequestMapping(path = "/upload.do")  
    public String upload(Play play,@RequestParam(value = "file", required = false)MultipartFile file,HttpServletRequest request,Model model) {  

        System.out.println("开始");
        System.out.println(play.getPlay_name());
		System.out.println(play.getPlay_id());
		System.out.println(play.getPlay_introduce());
		System.out.println(play.getPlay_length());
		System.out.println(play.getPlay_status());
		System.out.println(play.getPlay_ticket_price());
		System.out.println(play.getPlay_type());
        String path = request.getSession().getServletContext().getRealPath("upload");
        path=path+"\\";
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
        play.setPlay_image("upload/"+fileName);
        playService.insertPlay(play);
        return "play";  
    }  
	
	@RequestMapping(path = "/uploadUpdate.do")  
    public String uploadUpdate(Play play,@RequestParam(value = "file", required = false)MultipartFile file,HttpServletRequest request,Model model) {  

        System.out.println("开始");
        System.out.println(play.getPlay_name());
		System.out.println(play.getPlay_id());
		System.out.println(play.getPlay_introduce());
		System.out.println(play.getPlay_length());
		System.out.println(play.getPlay_status());
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
        play.setPlay_image(imgPath);
        playService.updatePlay(play);
        return "play";  
    }  
}
