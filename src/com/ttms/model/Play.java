package com.ttms.model;

public class Play {
	private int play_id;
	private String play_name;
	private int play_type;
	private String play_introduce;
	private String play_image;
	private int play_length;
	private double play_ticket_price;
	private int play_status;
	private String play_imgString;
	public int getPlay_id() {
		return play_id;
	}
	public void setPlay_id(int play_id) {
		this.play_id = play_id;
	}
	public String getPlay_name() {
		return play_name;
	}
	public void setPlay_name(String play_name) {
		this.play_name = play_name;
	}
	public int getPlay_type() {
		return play_type;
	}
	public void setPlay_type(int play_type) {
		this.play_type = play_type;
	}
	public String getPlay_introduce() {
		return play_introduce;
	}
	public void setPlay_introduce(String play_introduce) {
		this.play_introduce = play_introduce;
	}
	public String getPlay_image() {
		return play_image;
	}
	public void setPlay_image(String play_image) {
		this.play_image = play_image;
	}
	public int getPlay_length() {
		return play_length;
	}
	public void setPlay_length(int play_length) {
		this.play_length = play_length;
	}
	public double getPlay_ticket_price() {
		return play_ticket_price;
	}
	public void setPlay_ticket_price(double play_ticket_price) {
		this.play_ticket_price = play_ticket_price;
	}
	public int getPlay_status() {
		return play_status;
	}
	public void setPlay_status(int play_status) {
		this.play_status = play_status;
	}

	@Override
	public String toString() {
		return "Play [play_id=" + play_id + ", play_name=" + play_name + ", play_type=" + play_type
				+ ", play_introduce=" + play_introduce + ", play_image=" + play_image + ", play_length=" + play_length
				+ ", play_ticket_price=" + play_ticket_price + ", play_status=" + play_status + "]";
	}
	public String getPlay_imgString() {
		return play_imgString;
	}
	public void setPlay_imgString(String play_imgString) {
		this.play_imgString = play_imgString;
	}
	
}
