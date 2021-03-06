package com.voyagerproject.model;
// Generated Feb 27, 2016 12:34:42 PM by Hibernate Tools 4.3.1.Final

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * RuleManager generated by hbm2java
 */
@Entity
@Table(name = "rulemanager", catalog = "Voyager")
public class RuleManager implements java.io.Serializable {

	private static final long serialVersionUID = -287280493501087711L;
	private int idRuleManager;
	private String name;
	private String url;
	private RuleManagerType ruleManagerType;
	private Date createdOn;
	private String createdBy;

	public RuleManager() {
	}

	public RuleManager(int idRuleManager, String name, String url, RuleManagerType ruleManagerType, Date createdOn,
			String createdBy) {
		this.idRuleManager = idRuleManager;
		this.name = name;
		this.url = url;
		this.ruleManagerType = ruleManagerType;
		this.createdOn = createdOn;
		this.createdBy = createdBy;
	}
	
	public RuleManager(String name, String url, RuleManagerType ruleManagerType, Date createdOn,
			String createdBy) {
		this.name = name;
		this.url = url;
		this.ruleManagerType = ruleManagerType;
		this.createdOn = createdOn;
		this.createdBy = createdBy;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "idRuleManager", unique = true, nullable = false)
	public int getIdRuleManager() {
		return this.idRuleManager;
	}

	public void setIdRuleManager(int idRuleManager) {
		this.idRuleManager = idRuleManager;
	}

	@Column(name = "name", nullable = false, length = 100)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "url", nullable = false, length = 200)
	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	@OneToOne
    @JoinColumn(name = "ruleManagerType", nullable = false)
	public RuleManagerType getRuleManagerType() {
		return this.ruleManagerType;
	}

	public void setRuleManagerType(RuleManagerType ruleManagerType) {
		this.ruleManagerType = ruleManagerType;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "createdOn", length = 19, insertable = false)
	public Date getCreatedOn() {
		return this.createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	@Column(name = "createdBy", nullable = false, length = 100)
	public String getCreatedBy() {
		return this.createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

}
