package com.wwh.ssh.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.stereotype.Component;
@Component
@Entity
public class Assets implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 512771631162739343L;
	@Id
	@GeneratedValue(generator="aid")
	@GenericGenerator(name="aid", strategy = "assigned")
	private String aid;
	private String aname;
	private String anum;
	private String akeeper;
	private String aunit;
	private String atype;
	private String adepart;
	private String adescripe;

	public Assets() {

	}

	public Assets(String aid, String aname, String anum, String akeeper,
			String aunit, String atype, String adepart, String adescripe) {
		super();
		this.aid = aid;
		this.aname = aname;
		this.anum = anum;
		this.akeeper = akeeper;
		this.aunit = aunit;
		this.atype = atype;
		this.adepart = adepart;
		this.adescripe = adescripe;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String string) {
		this.aid = string;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getAnum() {
		return anum;
	}

	public void setAnum(String anum) {
		this.anum = anum;
	}

	public String getAkeeper() {
		return akeeper;
	}

	public void setAkeeper(String akeeper) {
		this.akeeper = akeeper;
	}

	public String getAunit() {
		return aunit;
	}

	public void setAunit(String aunit) {
		this.aunit = aunit;
	}

	public String getAtype() {
		return atype;
	}

	public void setAtype(String atype) {
		this.atype = atype;
	}

	public String getAdepart() {
		return adepart;
	}

	public void setAdepart(String adepart) {
		this.adepart = adepart;
	}

	public String getAdescripe() {
		return adescripe;
	}

	public void setAdescripe(String adescripe) {
		this.adescripe = adescripe;
	}

	@Override
	public String toString() {
		return "Assets [aid=" + aid + ", aname=" + aname + ", anum=" + anum
				+ ", akeeper=" + akeeper + ", aunit=" + aunit + ", atype="
				+ atype + ", adepart=" + adepart + ", adescripe=" + adescripe
				+ "]";
	}

}
