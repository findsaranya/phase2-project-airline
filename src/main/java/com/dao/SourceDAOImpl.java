package com.dao;

import java.util.LinkedList;
import java.util.List;

import org.hibernate.ObjectNotFoundException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entity.Source;
import com.utils.HibernateUtil;

public class SourceDAOImpl implements ISourceDAO {

	@Override
	public int createSource(Source source) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		int result = (int) session.save(source);
		transaction.commit();
		session.close();
		return result;
	}

	@Override
	public int updateSource(Source source) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		System.out.println("uodate" + source);
		session.update(source);
		transaction.commit();
		session.close();
		return 1;
	}

	@Override
	public int deleteSource(int srcId) {
		int res = 0;
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		Source result = getSourceDetail(srcId);
		
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
	public List<Source> getSourceList() {
		 List<Source> sourceList = new LinkedList<>();
	        Session session = HibernateUtil.getSessionFactory().openSession();
	        @SuppressWarnings("unchecked")
			Query<Source> query = session.createQuery("From Source");
	        sourceList = query.list();
	        return sourceList;
	}

	@Override
	public Source getSourceDetail(int srcId) {
		Source result = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			result = session.load(Source.class, srcId);// lazy loaded,incase of non existent id throws Objectnotfound
		} catch (ObjectNotFoundException ex) {
			System.out.println("exception"+ ex.getMessage());
			result = null;
		} finally {
			session.close();
		}

		return result;
	}

}
