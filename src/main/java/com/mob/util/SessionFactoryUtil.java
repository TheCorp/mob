package com.mob.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

public class SessionFactoryUtil {
	public static SessionFactory 
	getSessionFactory(){
	SessionFactory factory =new AnnotationConfiguration().configure().buildSessionFactory();
	return factory;
}

public static SessionFactory getAccountsSessionFactory(){
	
	SessionFactory factory = 
		new Configuration().
		buildSessionFactory();
	return factory;
}

}
