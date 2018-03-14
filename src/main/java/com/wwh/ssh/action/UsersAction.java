package com.wwh.ssh.action;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import javax.servlet.http.Cookie;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.wwh.ssh.entity.Users;
import com.wwh.ssh.service.UsersService;

@Controller
@Scope("prototype")
public class UsersAction extends SuperAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private Users user;
	@Autowired
	private UsersService usersService;

	public String login() {
		String[] isUseCookies = request.getParameterValues("isUseCookie");
		System.out.println("cookie:" + isUseCookies);
		if (isUseCookies != null && isUseCookies.length > 0) {

			String uemail = null;
			String password = null;
			try {

				uemail = URLEncoder.encode(request.getParameter("uemail"), "utf-8");
				password = URLEncoder.encode(request.getParameter("password"), "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Cookie uemailCookie = new Cookie("uemail", uemail);
			Cookie passwordCookie = new Cookie("password", password);
			uemailCookie.setMaxAge(604800);
			passwordCookie.setMaxAge(604800);
			response.addCookie(uemailCookie);
			response.addCookie(passwordCookie);
		} else {
			Cookie[] cookies = request.getCookies();
			if (cookies != null && cookies.length > 0) {
				for (Cookie c : cookies) {
					if (c.getName().equals("uemail") || c.getName().equals("password")) {
						c.setMaxAge(0);
						response.addCookie(c);
					}
				}
			}
		}

		user.setUemail(request.getParameter("uemail"));
		user.setPassword(request.getParameter("password"));
		if (usersService.usersLogin(user)) {
			user = usersService.queryUsername(request.getParameter("uemail"));
			session.setAttribute("loginUserName", user.getUsername());
			System.out.println("登陆成功" + user.getUsername());
			return "login_success";
		} else {
			System.out.println("登陆失败");
			return "login_failure";
		}
	}

	@SkipValidation
	public String logout() {
		if (session.getAttribute("loginUserName") != null) {
			session.removeAttribute("loginUserName");
		}
		System.out.println("退出成功");
		return "logout_success";
	}

	@Override
	public void validate() {
		user.setUemail(request.getParameter("uemail"));
		user.setPassword(request.getParameter("password"));
		System.out.println(user);
		if (!usersService.usersLogin(user)) {
			this.addFieldError("AllError", "用户名或密码错误");
		}
		session.setAttribute("loginUserName", user.getUemail());
	}

}
