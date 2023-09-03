package com.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="airline_tab")
public class Airline {
	@Id
	@Column(name="airline_ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int airlineId;
	@Column(name="airline_name")
	private String airlineName;
	@Column(name="airline_regId")
	private String regId;

	public Airline() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Airline(int airlineId, String airlineName, String regId) {
		super();
		this.airlineId = airlineId;
		this.airlineName = airlineName;
		this.regId = regId;
	}
	public int getAirlineId() {
		return airlineId;
	}
	public void setAirlineId(int airlineId) {
		this.airlineId = airlineId;
	}
	public String getAirlineName() {
		return airlineName;
	}
	public void setAirlineName(String airlineName) {
		this.airlineName = airlineName;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	@Override
	public String toString() {
		return "Airline [airlineId=" + airlineId + ", airlineName=" + airlineName + ", regId=" + regId + "]";
	}
	
	

}
