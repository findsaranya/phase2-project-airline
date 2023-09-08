package com.dao;

import java.util.LinkedList;
import java.util.List;

import org.hibernate.ObjectNotFoundException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entity.Places;
import com.utils.HibernateUtil;

public class PlacesDAOImpl implements IPlacesDAO {

	@Override
	public int createPlace(Places place) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		int result = (int) session.save(place);
		transaction.commit();
		session.close();
		return result;
		
	}

	@Override
	public int updatePlace(Places place) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.update(place);
		transaction.commit();
		session.close();
		return 1;
	}

	@Override
	public int deletePlace(int Id) {
int res = 0;
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		Places result = getPlaceDetail(Id);
		
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
	public List<Places> getPlaceList() {
		 List<Places> placesList = new LinkedList<>();
	        Session session = HibernateUtil.getSessionFactory().openSession();
			Query<Places> query = session.createQuery("From Places");
	        placesList = query.list();
	        return placesList;
	}

	@Override
	public Places getPlaceDetail(int Id) {
		Places result = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			result = session.load(Places.class, Id);// lazy loaded,incase of non existent id throws Objectnotfound
		} catch (ObjectNotFoundException ex) {
			System.out.println("exception"+ ex.getMessage());
			result = null;
		} finally {
			session.close();
		}

		return result;
	}

}
