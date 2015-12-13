package com.finanest.Util;


import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	private static SessionFactory sessionFactory;
	public static void setUp() {
		try {
			// A SessionFactory is set up once for an application
			sessionFactory = new Configuration()
					.configure() // configures settings from hibernate.cfg.xml
					.buildSessionFactory();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}		
	}
	static {
	}
	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}
}
