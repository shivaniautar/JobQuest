package com.codingdojo.jobtracker.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;
@Entity
@Table(name="jobapps")
public class Jobapp {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Size(min=1, message="Please provide a company name")
	private String company;
	
	@Size(min=1, message="Please provide a location or remote")
	private String location;
	
	@Size(min=1, message="Please provide a role")
	private String role;
	
	@Size(min=1, message="Please provide a salary, if you don't have one yet put TBD.")
	private String salary;
	
	@Size(min=1, message="Please provide a link")
	private String link;
	
	private Date appdate;
	
	@Size(min=1, message="Please provide a status")
	private String status;
	
	private String comments;
	
	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
	
	// ---------- RELATIONSHIPS ----------
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User user;
	
	// ---------- CONSTRUCTORS ----------
	
		public Jobapp() {
		}

	public Jobapp(Long id, @Size(min = 1, message = "Please provide a company name") String company,
			@Size(min = 1, message = "Please provide a location or remote") String location,
			@Size(min = 1, message = "Please provide a role") String role,
			@Size(min = 1, message = "Please provide a salary, if you don't have one yet put TBD.") String salary,
			@Size(min = 1, message = "Please provide a link") String link, 
			Date appdate,
			@Size(min = 1, message = "Please provide a status") String status, 
			String comments, 
			Date createdAt,
			Date updatedAt, 
			User user) {
		super();
		this.id = id;
		this.company = company;
		this.location = location;
		this.role = role;
		this.salary = salary;
		this.link = link;
		this.appdate = appdate;
		this.status = status;
		this.comments = comments;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.user = user;
	}
	
	
	// ---------- GETTERS AND SETTERS ----------
	
	
	

	public Long getId() {
		return id;
	}

	public String getCompany() {
		return company;
	}

	public String getLocation() {
		return location;
	}

	public String getRole() {
		return role;
	}

	public String getSalary() {
		return salary;
	}

	public String getLink() {
		return link;
	}

	public Date getAppdate() {
		return appdate;
	}

	public String getStatus() {
		return status;
	}

	public String getComments() {
		return comments;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public User getUser() {
		return user;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public void setAppdate(Date appdate) {
		this.appdate = appdate;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
	
		

}
