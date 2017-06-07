package com.ttms.model;

public class Seat {
	private Integer seat_id;
	private String seat_row;
	private String seat_colum;
	private String seat_status;
	private Studio studio;
	public Integer getSeat_id() {
		return seat_id;
	}
	public void setSeat_id(Integer seat_id) {
		this.seat_id = seat_id;
	}
	public String getSeat_row() {
		return seat_row;
	}
	public void setSeat_row(String seat_row) {
		this.seat_row = seat_row;
	}
	public String getSeat_colum() {
		return seat_colum;
	}
	public void setSeat_colum(String seat_colum) {
		this.seat_colum = seat_colum;
	}
	public String getSeat_status() {
		return seat_status;
	}
	public void setSeat_status(String seat_status) {
		this.seat_status = seat_status;
	}
	public Studio getStudio() {
		return studio;
	}
	public void setStudio(Studio studio) {
		this.studio = studio;
	}
	@Override
	public String toString() {
		return "Seat [seat_id=" + seat_id + ", seat_row=" + seat_row + ", seat_colum=" + seat_colum + ", seat_status="
				+ seat_status + ", studio=" + studio + "]";
	}
	
}
