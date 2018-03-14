package com.wwh.ssh.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class SuperDao {
	   //获取sessionFactory
	    @Autowired
		private SessionFactory sessionFactory;
		public void setSessionFactory(SessionFactory sessionFactory){
			this.sessionFactory=sessionFactory;
		}
		public Session getSession(){
			return this.sessionFactory.getCurrentSession();
		}

}
