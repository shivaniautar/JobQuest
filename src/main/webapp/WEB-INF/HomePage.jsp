<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>






<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/main.css">
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
    <li><a class="active" href="/job-quest">Home</a></li>
  
</ul>

	<h1>Welcome <c:out value=" ${user.firstName} ${user.lastName}" /> !</h1>
	
	<p id="total">You currently have a total of <c:out value="${user.jobapps.size()}"></c:out> job application(s)!</p>

	<div class="flex-container">
	<p><a href="/new/jobapplication"><button>Add a New Job Application</button></a></p>
	<h2 class="sortby">Sort By</h2>
	<p><a href="/"><button>Company</button></a></p>
	<p><a href="/"><button>Location</button></a></p>
	<p><a href="/"><button>Role Level</button></a></p>
	<p><a href="/"><button>Position</button></a></p>
	<p><a href="/"><button>Salary</button></a></p>
	<p><a href="/"><button>Application Date</button></a></p>
	<p><a href="/"><button>Status</button></a></p>
	
	</div>
	
	
	
	<table>
	    <thead>
	        <tr class="toprow">
	            <th>Company:</th>
	            <th>Location:</th>
	            <th>Role Level:</th>
	           	<th>Position Title:</th>
	            <th>Salary:</th>
	            <th>Link:</th>
	            <th>Application Date:</th>
	            <th>Status:</th>
	            <th>Comments:</th>
	            <th>Actions:</th>
	        </tr>
	    </thead>
	    <tbody>
	    
		    		<c:forEach items="${jobs}" var="job">
		    	<tr>
		            	<td><a href="/jobapplication/${job.id}"><c:out value="${job.company}"></c:out></a></td>
		            	<td><c:out value="${job.location}"></c:out></td>
		            	<td><c:out value="${job.roletype}"></c:out></td>
		            	<td><c:out value="${job.role}"></c:out></td>
		            	<td><c:out value="${job.salary}"></c:out></td>
		            	<td><a href="${job.link}"><c:out value="${job.link}"></c:out></a></td>
		            	<td><c:out value="${job.appdate}"></c:out></td>
		            	<td><c:out value="${job.status}"></c:out></td>
		            	<td><c:out value="${job.comments}"></c:out></td>
		            	<td><a href="/jobapplication/${job.id}/edit">Update Application</a></td>
		    	</tr>
		            </c:forEach>
	    </tbody>
	</table><br><br>
	
	<footer> © Copyright 2020 Shivani Autar</footer>
	
	




</body>
</html>