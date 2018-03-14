package com.wwh.ssh.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.stereotype.Component;
@Component
@Entity
public class Users implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4549764598498994473L;
	@Id
	@GeneratedValue(generator="uemail")
	@GenericGenerator(name="uemail", strategy = "assigned")
	private String uemail;//邮箱
	private String nickname;//昵称
	private String username;//用户名
	private String password;//密码
	private String cardnum;//身份证
	private String phonenum;//电话

	public Users() {
	}

	public Users(String uemail, String username, String password, String cardnum, String phonenum) {
		this.uemail = uemail;
		this.username = username;
		this.password = password;
		this.cardnum = cardnum;
		this.phonenum = phonenum;
	}

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCardnum() {
		return cardnum;
	}

	public void setCardnum(String cardnum) {
		this.cardnum = cardnum;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "Users [uemail=" + uemail + ", username=" + username + ", password=" + password + ", cardnum=" + cardnum
				+ ", phonenum=" + phonenum + "]";
	}

}
