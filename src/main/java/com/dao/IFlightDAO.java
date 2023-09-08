package com.dao;

import java.util.List;


import com.entity.Flights;

public interface IFlightDAO {
	 int createFlight(Flights flight);
	  int updateFlight(Flights flight);
	  int deleteFlight(int Id);
	  List<Flights> getFlightList();
	  Flights getFlightDetail(int Id);
	  List<Flights> searchFlights(String src,String dest);
}
