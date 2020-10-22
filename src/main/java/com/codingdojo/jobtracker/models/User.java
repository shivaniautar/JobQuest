package com.codingdojo.jobtracker.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;



@Entity
@Table(name="users")
public class User {
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
	
	@NotBlank(message="Please enter your first name")
	private String firstName;
	
	@NotBlank(message="Please enter your last name")
	private String lastName;
    
	@NotBlank(message="Please enter your email")
    @Email(message="Email must be valid")
    private String email;
   
    @Size(min=8, message="Password must be greater than 8 characters")
    private String password;
    
    @Transient
    private String passwordConfirmation;
    
    @Column(updatable=false)
    private Date createdAt;
	private Date updatedAt;
	
	// ---------- RELATIONSHIPS ----------
	
		@OneToMany(mappedBy="user", fetch=FetchType.LAZY)
		private List<Jobapp> jobapps;

		// ---------- CONSTRUCTORS ----------
		
		public User() {
		}

		public User(Long id, @NotBlank(message = "Please enter your first name") String firstName,
				@NotBlank(message = "Please enter your last name") String lastName,
				@NotBlank(message = "Please enter your email") @Email(message = "Email must be valid") String email,
				@Size(min = 8, message = "Password must be greater than 8 characters") String password,
				String passwordConfirmation, Date createdAt, Date updatedAt, List<Jobapp> jobapps) {
			super();
			this.id = id;
			this.firstName = firstName;
			this.lastName = lastName;
			this.email = email;
			this.password = password;
			this.passwordConfirmation = passwordConfirmation;
			this.createdAt = createdAt;
			this.updatedAt = updatedAt;
			this.jobapps = jobapps;
		}
		

		// ---------- GETTERS AND SETTERS ----------
		
		

		public Long getId() {
			return id;
		}

		public String getFirstName() {
			return firstName;
		}

		public String getLastName() {
			return lastName;
		}

		public String getEmail() {
			return email;
		}

		public String getPassword() {
			return password;
		}

		public String getPasswordConfirmation() {
			return passwordConfirmation;
		}

		public Date getCreatedAt() {
			return createdAt;
		}

		public Date getUpdatedAt() {
			return updatedAt;
		}

		public List<Jobapp> getJobapps() {
			return jobapps;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public void setFirstName(String firstName) {
			this.firstName = firstName;
		}

		public void setLastName(String lastName) {
			this.lastName = lastName;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public void setPasswordConfirmation(String passwordConfirmation) {
			this.passwordConfirmation = passwordConfirmation;
		}

		public void setCreatedAt(Date createdAt) {
			this.createdAt = createdAt;
		}

		public void setUpdatedAt(Date updatedAt) {
			this.updatedAt = updatedAt;
		}

		public void setJobapps(List<Jobapp> jobapps) {
			this.jobapps = jobapps;
		}
	
	
}