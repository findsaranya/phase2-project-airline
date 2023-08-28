package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="source_tab")
public class Source {
	@Id
	@Column(name="source_ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sourceId;
	@Column(name="source_name")
	private String name;
    @Column(name="source_city")
	private String city;
    @Column(name="source_state")
	private String state;
    @Column(name="source_country")
	private String country;
	public Source() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public Source(int sourceId, String name, String city, String state, String country) {
		super();
		this.sourceId = sourceId;
		this.name = name;
		this.city = city;
		this.state = state;
		this.country = country;
	}

	
	


	
	public int getSourceId() {
		return sourceId;
	}



	public void setSourceId(int sourceId) {
		this.sourceId = sourceId;
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
		return "Source [sourceId=" + sourceId + ", name=" + name + ", city=" + city + ", state=" + state + ", country="
				+ country + "]";
	}

	

}
