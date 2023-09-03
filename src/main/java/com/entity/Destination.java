package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="dest_tab")
public class Destination {
	@Id
	@Column(name="dest_ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int destId;
	@Column(name="dest_name")
	private String name;
    @Column(name="dest_city")
	private String city;
    @Column(name="dest_state")
	private String state;
    @Column(name="dest_country")
	private String country;
	public Destination() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Destination(int destId, String name, String city, String state, String country) {
		super();
		this.destId = destId;
		this.name = name;
		this.city = city;
		this.state = state;
		this.country = country;
	}
	public int getDestId() {
		return destId;
	}
	public void setDestId(int destId) {
		this.destId = destId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	@Override
	public String toString() {
		return "Destination [destId=" + destId + ", name=" + name + ", city=" + city + ", state=" + state + ", country="
				+ country + "]";
	}
    
    
}
