package com.wwh.ssh.action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.wwh.ssh.entity.Users;
import com.wwh.ssh.service.UsersService;
@Controller
@Scope("prototype")
public class RegAction extends SuperAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7087363677923060911L;
	@Autowired
	private Users user;
	@Autowired
	private UsersService usersService;

	public String doReg() {
		user.setUemail(request.getParameter("uemail"));
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setCardnum(request.getParameter("cardnum"));
		user.setPhonenum(request.getParameter("phonenum"));
		System.out.println("注册的Email为:" + request.getParameter("uemail"));
		if (usersService.regUsers(user)) {
			return "reg_success";
		} else {
			return "reg_failure";
		}
	}

	@Override
	public void validate() {
		session.setAttribute("loginUserName", request.getParameter("username"));
	}
}
