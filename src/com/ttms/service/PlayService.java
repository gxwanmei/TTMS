package com.ttms.service;

import java.util.List;

import com.ttms.model.Play;

public interface PlayService {
	public  int insertPlay(Play play);				//增
	public int deleteByPlayNo(Play play);			//删
	public int updatePlay(Play play);				//改
	public Play searchById(Play play);			//查--按ID
	public int getCount(Play play);					//查--总数
	public List<Play> getAllData(Play play);	//查--总数据
	public boolean stringImage(String imgStr, String imgFilePath);
}
