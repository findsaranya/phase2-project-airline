package com.model;



public class FlightSearch {
	private String travelDate;
	private String src;
	private String dest;
	private int count;
	public FlightSearch() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FlightSearch(String travelDate, String src, String dest, int count) {
		super();
		this.travelDate = travelDate;
		this.src = src;
		this.dest = dest;
		this.count = count;
	}
	public String getTravelDate() {
		return travelDate;
	}
	public void setTravelDate(String travelDate) {
		this.travelDate = travelDate;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public String getDest() {
		return dest;
	}
	public void setDest(String dest) {
		this.dest = dest;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "FlightSearch [travelDate=" + travelDate + ", src=" + src + ", dest=" + dest + ", count=" + count + "]";
	}
	
	

}
