package com.voyagerproject.model;
// Generated Feb 27, 2016 12:34:42 PM by Hibernate Tools 4.3.1.Final

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Permission generated by hbm2java
 */
@Entity
@Table(name = "permission", catalog = "Voyager")
public class Permission implements java.io.Serializable {

	private static final long serialVersionUID = 1956956798380611341L;
	private int idPermission;
	private String name;
	private Date createdOn;

	public Permission() {
	}

	public Permission(int idPermission, String name, Date createdOn) {
		this.idPermission = idPermission;
		this.name = name;
		this.createdOn = createdOn;
	}
	
	public Permission(String name, Date createdOn) {
		this.name = name;
		this.createdOn = createdOn;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "idPermission", unique = true, nullable = false)
	public int getIdPermission() {
		return this.idPermission;
	}

	public void setIdPermission(int idPermission) {
		this.idPermission = idPermission;
	}

	@Column(name = "name", nullable = false, length = 100)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "createdOn", length = 19, insertable = false)
	public Date getCreatedOn() {
		return this.createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}
}
