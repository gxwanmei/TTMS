package com.ttms.model;

import java.util.List;

public class Studio {
	private Integer studio_id;
	private String studio_name;
	private String studio_language;
	private String studio_size;
	private String studio_type;
	private List<Seat> seats;
	public List<Seat> getSeats() {
		return seats;
	}
	public void setSeats(List<Seat> seats) {
		this.seats = seats;
	}
	public Integer getStudio_id() {
		return studio_id;
	}
	public void setStudio_id(Integer studio_id) {
		this.studio_id = studio_id;
	}
	public String getStudio_name() {
		return studio_name;
	}
	public void setStudio_name(String studio_name) {
		this.studio_name = studio_name;
	}
	public String getStudio_language() {
		return studio_language;
	}
	public void setStudio_language(String studio_language) {
		this.studio_language = studio_language;
	}
	public String getStudio_size() {
		return studio_size;
	}
	public void setStudio_size(String studio_size) {
		this.studio_size = studio_size;
	}
	public String getStudio_type() {
		return studio_type;
	}
	public void setStudio_type(String studio_type) {
		this.studio_type = studio_type;
	}
	
	
}
