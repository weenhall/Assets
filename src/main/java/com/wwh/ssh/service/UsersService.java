package com.wwh.ssh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wwh.ssh.dao.UsersDao;
import com.wwh.ssh.entity.Users;

@Service
public class UsersService {
	@Autowired
	private UsersDao usersDao;
	public boolean usersLogin(Users user){
		if(usersDao.usersLogin(user)){
			return true;
		}else{
			return false;
		}
	}
	public Users queryUsername(String uemail) {
		return usersDao.queryUsername(uemail);
	}
	public boolean regUsers(Users user) {
		if(usersDao.regUsers(user)){
			return true;
		}else{
			return false;
		}
	};
}
