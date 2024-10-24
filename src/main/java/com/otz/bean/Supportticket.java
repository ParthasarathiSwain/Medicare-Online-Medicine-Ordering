package com.otz.bean;

public class Supportticket {
	private int ticketId ;
	private String ticketTitle ;
	public int getTicketId() {
		return ticketId;
	}
	public void setTicketId(int ticketId) {
		this.ticketId = ticketId;
	}
	public String getTicketTitle() {
		return ticketTitle;
	}
	public void setTicketTitle(String ticketTitle) {
		this.ticketTitle = ticketTitle;
	}
	@Override
	public String toString() {
		return "Supportticket [ticketId=" + ticketId + ", ticketTitle=" + ticketTitle + "]";
	}
	
}
   