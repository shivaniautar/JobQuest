<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/css/editjobapppage.css">
<title>Job-Quest</title>
</head>
<body>


<div class="header">
                <img class="appname" src="/images/Name.PNG" alt="Job Quest" width="300px">
</div>

<ul>
<li><a style="margin-right:420px;" href="/logout">Logout</a></li>
  <li><a href="#contact">About Us</a></li>
  <li><a href="#news">Seminars</a></li>
  <li><a href="#contact">Tips</a></li>
  <li><a href="#news">Stats</a></li>
  <li><a href="/job-quest">Home</a></li>
  
</ul>

	<h1>Hi <c:out value="${user.firstName}" />!</h1>

	
	<h3>Now Updating Your Job Application to ${jobapp.company}</h3>
	
	<div class="neww">
	
	<p style="color: red;"><form:errors path="jobapp.*"/></p>

		<form:form method="POST" action="/editjobapp/${jobapp.id}/process" modelAttribute="jobapp">
	        <p>
	            <form:label path="company">Company Name:</form:label>
	            <form:input class="input" type="text" path="company"/>
	        </p>
	       	<p>
	            <form:label path="location">Location:</form:label>
 	            <form:input class="input" type="text" path="location"/>
	        </p>
	        
	       	<p>
	            <form:label path="roletype">Role Type:</form:label>
                                <select class="input" name="roletype">
                                    <option value="${jobapp.roletype}">${jobapp.roletype}</option>
                                    <option value="Jr">Junior</option>
                                    <option value="Mid">Mid-level</option>
                                    <option value="Sr">Senior</option>
                                    <option value="NA">NA</option>
                                </select>
	        </p>
	        
	       	<p>
	            <form:label path="role">Role:</form:label>
 	            <select class="input" name="role">
					<option value="${jobapp.role}">${jobapp.role}</option>
					<option value="Internship">Intern</option>
					<option value="Software Developer">Software Developer</option>
					<option value="Full-Stack Developer">Software Developer</option>
					<option value="Front-end Developer">Front-end Developer</option>
					<option value="Back-end Developer">Back-end Developer</option>
					<option value="Software Engineer">Software Engineer</option>
					<option value="Full-Stack Engineer">Full-Stack Engineer</option>
					<option value="Front-end Engineer">Front-end Engineer</option>
					<option value="Back-end Engineer">Back-end Engineer</option>
					<option value="Other">Not listed</option>
				</select>
 	            
	        </p>
	        
	       	<p>
	            <form:label path="salary">Salary:</form:label>
                                <select class="input" name="salary">
                                    <option value="${jobapp.salary}">${jobapp.salary}</option>
                                    <option value="$50k-$59k">$50k-$59k</option>
                                    <option value="$60k-$69k">$60k-$69k</option>
                                    <option value="$70k-$79k">$70k-$79k</option>
                                    <option value="$80k-$89k">$80k-$89k</option>
                                    <option value="$90k-$99k">$90k-$99k</option>
                                    <option value="$100k-$109k">$100k-$109k</option>
                                    <option value="$110k-$119k">$110k-$119k</option>
                                    <option value="$120k-$129k">$120k-$129k</option>
                                    <option value="$130k-$139k">$130k-$139k</option>                                 
									<option value="$140k-$149k">$140k-$149k</option>
                                    <option value="$150k-$159k">$150k-$159k</option>
                                    <option value="$160k-$169k">$160k-$169k</option>
                                    <option value=">$170k">>$170k</option>
                                    <option value="TBD">TBD</option>
                                </select>
	        </p>
	        <p>
	            <form:label path="link">Link or Website:</form:label>
	            <form:input class="input" type="text" path="link"/>
	        </p>
	        
	       	<p>
	            <form:label path="appdate">Date Applied:</form:label>
	            <form:input class="input" type="date" path="appdate"/>
	        </p>
	        
	       	<p>
	            <form:label path="status">Status:</form:label>
                                <select class="input" name="status">
                                    <option value="${jobapp.status}">${jobapp.status}</option>
                                    <option value="Applied">Applied</option>
                                    <option value="Need To Apply">Need to apply</option>
                                    <option value="First Interview Done">First interview passed</option>
                                    <option value="Second Interview Done">Second interview passed</option>
                                    <option value="Third Interview Done">Third interview passed</option>
                                    <option value="Offer Letter Received">Offer Letter Received</option>
                                    <option value="Rejected">Rejected</option>
                                </select>
	        </p>
	        <p>
	            <form:label path="comments">Comment(s):</form:label>
	            <form:input class="input" type="textarea" path="comments"/>
	        </p>
	        <form:input type="hidden" path="user" value="${user.id}"/>
	        
	        <input class="formbutton" type="submit" value="Update Job Application"/>
	        
	    </form:form>

	<p><a href="/job-quest"><button class="formbutton">Cancel</button></a></p>
	
	
	</div>

	<footer> © Copyright 2020 Shivani Autar</footer>


</body>
</html>