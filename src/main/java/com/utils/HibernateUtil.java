package com.utils;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


public class HibernateUtil {
	 private static final SessionFactory sessionFactory;
	    
	    static {
	        try {
	            // Create the SessionFactory from standard (hibernate.cfg.xml) 
	            // config file.
	            sessionFactory = new Configuration().configure().buildSessionFactory();
//	        	StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
//
//	    		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
//
//	    		sessionFactory = meta.getSessionFactoryBuilder().build();
	        
	        
//	        	Configuration configuration=new Configuration();
//	        	configuration.configure("hibernate.cfg.xml");
//	        	
//	            ServiceRegistry serviceRegistry 
//	              = new StandardServiceRegistryBuilder()
//	              .applySettings(configuration.getProperties()).build();
//	        			 
//	          // configuration.addAnnotatedClass(Source.class);	 
//	           
//	           sessionFactory=configuration
//	            	.buildSessionFactory(serviceRegistry);	
	        } catch (Throwable ex) {
	            // Log the exception. 
	            System.err.println("Initial SessionFactory creation failed." + ex);
	            throw new ExceptionInInitializerError(ex);
	        }
	    }
	    
	    public static SessionFactory getSessionFactory() {
	        return sessionFactory;
	    }
}
