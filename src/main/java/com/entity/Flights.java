package com.entity;


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="flights_tab")
public class Flights {
	@Id
	@Column(name="flight_ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
    private int flight_Id;
	@Column(name="flight_Name")
	private String flightName;
	@OneToOne
	@JoinColumn(name="airline_ID")
	private Airline airline;
	@OneToOne
	@JoinColumn(name="Src_ID")
	private Places source;
	@OneToOne
	@JoinColumn(name="Dest_ID")
	private Places destination;
	@Column(name="flight_price")
	private int price;
	public Flights() {
		super();
	}
	
	

	public Flights(int flight_Id, String flightName, Airline airline, Places source, Places destination, int price) {
		super();
		this.flight_Id = flight_Id;
		this.flightName = flightName;
		this.airline = airline;
		this.source = source;
		this.destination = destination;
		this.price = price;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public int getFlight_Id() {
		return flight_Id;
	}
	public String getFlightName() {
		return flightName;
	}
	

	public void setFlightName(String flightName) {
		this.flightName = flightName;
	}

	public void setFlight_Id(int flight_Id) {
		this.flight_Id = flight_Id;
	}
	public Airline getAirline() {
		return airline;
	}
	public void setAirline(Airline airline) {
		this.airline = airline;
	}
	public Places getSource() {
		return source;
	}
	public void setSource(Places source) {
		this.source = source;
	}
	public Places getDestination() {
		return destination;
	}
	public void setDestination(Places destination) {
		this.destination = destination;
	}



	@Override
	public String toString() {
		return "Flights [flight_Id=" + flight_Id + ", flightName=" + flightName + ", airline=" + airline + ", source="
				+ source + ", destination=" + destination + ", price=" + price + "]";
	}

	
	
}
