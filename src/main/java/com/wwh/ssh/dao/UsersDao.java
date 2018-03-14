package com.wwh.ssh.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.wwh.ssh.entity.Users;
@Repository
public class UsersDao extends SuperDao{

	public boolean usersLogin(Users user) {
		String hql="from Users where uemail=? and password=?";
		Query query=getSession().createQuery(hql);
		query.setParameter(0, user.getUemail());
		query.setParameter(1, user.getPassword());
		List<Users> list=query.list();
		if(list.size()>0){
			return true;
		}else{
			return false;
		}
	}

	public Users queryUsername(String uemail) {
		String hql="from Users where uemail=?";
		Query query=getSession().createQuery(hql);
		query.setParameter(0, uemail);
		Users user=(Users) query.uniqueResult();
		return user;
	}
	
	public boolean regUsers(Users user){
		String hql="from Users where uemail=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, user.getUemail());
		if("".equals(query.uniqueResult())||query.uniqueResult()==null){
			getSession().save(user);
			return true;
		}else{
			return false;
		}	
	}
}
