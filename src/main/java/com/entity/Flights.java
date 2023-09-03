package com.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Entity
@Table(name="flights_tab")
public class Flights {
	@Id
	@Column(name="flight_ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
  private int flight_Id;
	@Column(name="flight_model")
  private String modelNo;
	@OneToOne
	@JoinColumn(name="src_ID")
  private Source from;
	@OneToOne
	@JoinColumn(name="dest_ID")
  private Destination to;
	@OneToOne
	@JoinColumn(name="airline_ID")
  private Airline airline;
	@Temporal(TemporalType.DATE)
	@Column(name="dept_date")
  private Date departureDate;
	@Temporal(TemporalType.DATE)
	@Column(name="arrival_date")
  private Date arrivalDate;
	@Temporal(TemporalType.TIME)
	@Column(name="dept_time")
  private Date departureTime;
	@Temporal(TemporalType.TIME)
	@Column(name="arrival_time")
  private Date arrivalTime;
	@Column(name="flight_capacity")
  private int capacity;
	public Flights() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Flights(int flight_Id, String modelNo, Source from, Destination to, Airline airline, Date departureDate,
			Date arrivalDate, Date departureTime, Date arrivalTime, int capacity) {
		super();
		this.flight_Id = flight_Id;
		this.modelNo = modelNo;
		this.from = from;
		this.to = to;
		this.airline = airline;
		this.departureDate = departureDate;
		this.arrivalDate = arrivalDate;
		this.departureTime = departureTime;
		this.arrivalTime = arrivalTime;
		this.capacity = capacity;
	}
	public int getFlight_Id() {
		return flight_Id;
	}
	public void setFlight_Id(int flight_Id) {
		this.flight_Id = flight_Id;
	}
	public String getModelNo() {
		return modelNo;
	}
	public void setModelNo(String modelNo) {
		this.modelNo = modelNo;
	}
	public Source getFrom() {
		return from;
	}
	public void setFrom(Source from) {
		this.from = from;
	}
	public Destination getTo() {
		return to;
	}
	public void setTo(Destination to) {
		this.to = to;
	}
	public Airline getAirline() {
		return airline;
	}
	public void setAirline(Airline airline) {
		this.airline = airline;
	}
	public Date getDepartureDate() {
		return departureDate;
	}
	public void setDepartureDate(Date departureDate) {
		this.departureDate = departureDate;
	}
	public Date getArrivalDate() {
		return arrivalDate;
	}
	public void setArrivalDate(Date arrivalDate) {
		this.arrivalDate = arrivalDate;
	}
	public Date getDepartureTime() {
		return departureTime;
	}
	public void setDepartureTime(Date departureTime) {
		this.departureTime = departureTime;
	}
	public Date getArrivalTime() {
		return arrivalTime;
	}
	public void setArrivalTime(Date arrivalTime) {
		this.arrivalTime = arrivalTime;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	@Override
	public String toString() {
		return "Flights [flight_Id=" + flight_Id + ", modelNo=" + modelNo + ", from=" + from + ", to=" + to
				+ ", airline=" + airline + ", departureDate=" + departureDate + ", arrivalDate=" + arrivalDate
				+ ", departureTime=" + departureTime + ", arrivalTime=" + arrivalTime + ", capacity=" + capacity + "]";
	}
	
}
