package com.ttms.model;

public class Ticket {
	private Integer ticket_id;
	private Seat seat;
	private Schedule schedule;
	private float ticket_price;
	private int ticket_status;
	public Integer getTicket_id() {
		return ticket_id;
	}
	public void setTicket_id(Integer ticket_id) {
		this.ticket_id = ticket_id;
	}
	public Seat getSeat() {
		return seat;
	}
	public void setSeat(Seat seat) {
		this.seat = seat;
	}
	public Schedule getSchedule() {
		return schedule;
	}
	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}
	public float getTicket_price() {
		return ticket_price;
	}
	public void setTicket_price(float ticket_price) {
		this.ticket_price = ticket_price;
	}
	public int getTicket_status() {
		return ticket_status;
	}
	public void setTicket_status(int ticket_status) {
		this.ticket_status = ticket_status;
	}
	
}
