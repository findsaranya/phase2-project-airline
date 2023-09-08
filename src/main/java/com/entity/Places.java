package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="places_tab")
public class Places {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
private int placeId;
	@Column(name="place_code")
private String code;
	@Column(name="place_name")
private String name;
	public Places() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Places(int placeId, String code, String name) {
		super();
		this.placeId = placeId;
		this.code = code;
		this.name = name;
	}
	public int getPlaceId() {
		return placeId;
	}
	public void setPlaceId(int placeId) {
		this.placeId = placeId;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Places [placeId=" + placeId + ", code=" + code + ", name=" + name + "]";
	}
	
}
