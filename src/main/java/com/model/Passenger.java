package com.model;

public class Passenger {
private String fullName;
private String email;
private String mobile;
private String adharNo;
public Passenger() {
	super();
}
public Passenger(String fullName, String email, String mobile, String adharNo) {
	super();
	this.fullName = fullName;
	this.email = email;
	this.mobile = mobile;
	this.adharNo = adharNo;
}
public String getFullName() {
	return fullName;
}
public void setFullName(String fullName) {
	this.fullName = fullName;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getMobile() {
	return mobile;
}
public void setMobile(String mobile) {
	this.mobile = mobile;
}
public String getAdharNo() {
	return adharNo;
}
public void setAdharNo(String adharNo) {
	this.adharNo = adharNo;
}
@Override
public String toString() {
	return "Passenger [fullName=" + fullName + ", email=" + email + ", mobile=" + mobile + ", adharNo=" + adharNo + "]";
}




}
