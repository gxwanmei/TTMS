package com.ttms.service;



import java.util.List;

import com.ttms.model.Studio;

public interface StudioService {
	public int InsertStudio(Studio studio);
	public int deleteStudioById(int id);
	public int updateStudioById(Studio studio);
	public List<Studio> Query();
}
