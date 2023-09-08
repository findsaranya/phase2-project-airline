package com.dao;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.LazyInitializationException;
import org.hibernate.ObjectNotFoundException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;

import com.entity.Flights;
import com.utils.HibernateUtil;

public class FlightDAOImpl implements IFlightDAO {

	@Override
	public int createFlight(Flights flight) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		int result = (int) session.save(flight);
		transaction.commit();
		session.close();
		return result;
	}

	@Override
	public int updateFlight(Flights flight) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.update(flight);
		transaction.commit();
		session.close();
		return 1;
	}

	@Override
	public int deleteFlight(int Id) {
int res = 0;
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		Flights result = getFlightDetail(Id);
		
		if (result == null) {
			res = 0;
		} else {
			session.delete(result);
			res = 1;
		}

		transaction.commit();
		session.close();
		
		return res;
	}

	@Override
	public List<Flights> getFlightList() {
		 List<Flights> airlineList = new LinkedList<>();
	        Session session = HibernateUtil.getSessionFactory().openSession();
			Query<Flights> query = session.createQuery("From Flights");
	        airlineList = query.list();
	        return airlineList;
	}

	@Override
	public Flights getFlightDetail(int Id) {
		Flights result = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			result = session.load(Flights.class, Id);// lazy loaded,incase of non existent id throws Objectnotfound
		} catch (ObjectNotFoundException ex) {
			System.out.println("exception"+ ex.getMessage());
			result = null;
		}catch(LazyInitializationException ex) {
			result = null;
		} finally {
			session.close();
		}

		return result;
	}

	@Override
	public List<Flights> searchFlights(String src, String dest) {
		 List<Flights> airlineList = new LinkedList<Flights>();
		 Session session = HibernateUtil.getSessionFactory().openSession();
		 Criteria criteriaObj = session.createCriteria(Flights.class,"flight");
		 criteriaObj.createAlias("flight.source", "srcfd");
		 criteriaObj.createAlias("flight.destination", "destfd");
		 
		 Criterion criterionObj1 = Restrictions.eq("srcfd.placeId", Integer.parseInt(src));  // roll_No >= 2
		Criterion criterionObj2 = Restrictions.eq("destfd.placeId",Integer.parseInt(dest));
		criteriaObj.add(Restrictions.and(criterionObj1, criterionObj2));
		airlineList = criteriaObj.list();
		return airlineList;
	}

}
