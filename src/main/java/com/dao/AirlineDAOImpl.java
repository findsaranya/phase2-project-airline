package com.dao;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.ObjectNotFoundException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entity.Airline;
import com.utils.HibernateUtil;

public class AirlineDAOImpl implements IAirlineDAO {

	@Override
	public int createAirline(Airline airline) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		int result = (int) session.save(airline);
		transaction.commit();
		session.close();
		return result;
	}

	@Override
	public int updateAirline(Airline airline) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.update(airline);
		transaction.commit();
		session.close();
		return 1;
	}

	@Override
	public int deleteAirline(int Id) {
int res = 0; 
Airline result = null;
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		try {
		result = getAirLineDetail(Id);
		}catch(SQLIntegrityConstraintViolationException ex) {
			result = null;
		}
		
		
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
	public List<Airline> getAirlineList() {
		 List<Airline> airlineList = new LinkedList<>();
	        Session session = HibernateUtil.getSessionFactory().openSession();
			Query<Airline> query = session.createQuery("From Airline");
	        airlineList = query.list();
	        return airlineList;
	}

	@Override
	public Airline getAirLineDetail(int Id) throws SQLIntegrityConstraintViolationException {
		Airline result = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			result = session.load(Airline.class, Id);
		} catch (ObjectNotFoundException ex) {
			System.out.println("exception"+ ex.getMessage());
			result = null;
		}
		finally {
			session.close();
		}

		return result;

	}

}
