package com.wwh.ssh.test;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestConnection {

	public static void main(String[] args) {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("src/main/resources/applicationContext.xml");
		SessionFactory ss=(SessionFactory) ctx.getBean("sessionFactory");
		System.out.println(ss.toString());
	}

}
