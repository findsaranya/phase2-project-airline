package com.dao;

import java.util.List;

import com.entity.Places;

public interface IPlacesDAO {
	 int createPlace(Places place);
	  int updatePlace(Places place);
	  int deletePlace(int Id);
	  List<Places> getPlaceList();
	  Places getPlaceDetail(int Id);
}
