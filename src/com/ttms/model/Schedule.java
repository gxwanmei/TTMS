package com.ttms.model;


public class Schedule {
	private int sched_id;
	private Studio studio;
	private Play play;
	private String sched_time;
	private float sched_ticket_price;
	private String sched_date;
	
	public String getSched_date() {
		return sched_date;
	}
	public void setSched_date(String sched_date) {
		this.sched_date = sched_date;
	}
	public int getSched_id() {
		return sched_id;
	}
	public void setSched_id(int sched_id) {
		this.sched_id = sched_id;
	}
	public Studio getStudio() {
		return studio;
	}
	public void setStudio(Studio studio) {
		this.studio = studio;
	}
	public Play getPlay() {
		return play;
	}
	public void setPlay(Play play) {
		this.play = play;
	}
	
	public String getSched_time() {
		return sched_time;
	}
	public void setSched_time(String sched_time) {
		this.sched_time = sched_time;
	}
	public float getSched_ticket_price() {
		return sched_ticket_price;
	}
	public void setSched_ticket_price(float sched_ticket_price) {
		this.sched_ticket_price = sched_ticket_price;
	}
	
}	
