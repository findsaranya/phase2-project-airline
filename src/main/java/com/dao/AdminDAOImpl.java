package com.dao;

import java.util.Iterator;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entity.Admin;
import com.utils.HibernateUtil;

public class AdminDAOImpl implements IAdminDAO {

	@Override
	public int createAdmin(Admin admin) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		int result = (int) session.save(admin);
		transaction.commit();
		session.close();
		return result;
	}

	@Override
	public int updateAdminPassword(Admin admin) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(admin);
		transaction.commit();
		session.close();
		return 1;
	}

	@Override
	public Admin getAdminDetails(String username, String password) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Query<Admin> query = session.createQuery("from Admin where username=:username and password=:pass");
		query.setParameter("username", username);
		query.setParameter("pass", password);
		Admin result = (Admin) query.uniqueResult();
		return result;
	}

	@Override
	public Long getAdminRowCount() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Query<Iterator> query = session.createQuery("select count(*) from Admin");
		Iterator itr = query.iterate();
		return (Long) itr.next();
	}

}
