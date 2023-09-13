package com.dao;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

import com.entity.Airline;

public interface IAirlineDAO {
 int createAirline(Airline airline);
 int updateAirline(Airline airline);
 int deleteAirline(int Id);
 List<Airline> getAirlineList();
 Airline getAirLineDetail(int Id) throws SQLIntegrityConstraintViolationException;
}
