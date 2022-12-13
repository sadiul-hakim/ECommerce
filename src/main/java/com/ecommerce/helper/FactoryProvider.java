package com.ecommerce.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	private static SessionFactory factory;
	
	public static SessionFactory getFactory() {
		if(factory==null) {
			factory=new Configuration().configure().buildSessionFactory();
		}
		
		return factory;
	}
	
	public static void close() {
		if(factory==null) return;
		
		factory.close();
	}
}
