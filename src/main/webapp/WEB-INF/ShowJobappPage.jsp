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
  <li><a class="active" href="#home">Home</a></li>
  <li><a href="#news">News</a></li>
  <li><a href="#contact">Contact</a></li>
</ul>

	<h1>Welcome, <c:out value="${user.firstName}" /></h1>

	<a href="/logout">Logout</a>
	
	
	
	
		            	<h3>Company:</h3>
		            	<p><c:out value="${j.company}"></c:out></p>
		            	<br>
		            	<h3>Location:</h3>
		            	<p><c:out value="${j.location}"></c:out></p>
		            	
		            	<br>
		            	<h3>Role Level:</h3>
		            	<p><c:out value="${j.roletype}"></c:out></p>
		            	
		            			            	<br>
		            	<h3>Position:</h3>
		            	<p><c:out value="${j.role}"></c:out></p>
		            	
		            			            	<br>
		            	<h3>Salary:</h3>
		            	<p><c:out value="${j.salary}"></c:out></p>
		            	
		            			            	<br>
		            	<h3>Link:</h3>
		            	<p><a href="${j.link}"><c:out value="${j.link}"></c:out></a></p>
		            	
		            			            	<br>
		            	<h3>Application Date:</h3>
		            	<p><c:out value="${j.appdate}"></c:out></p>
		            	
		            			            	<br>
		            	<h3>Current Status:</h3>
		            	<p><c:out value="${j.status}"></c:out></p>
		            	
		            			            	<br>
		            	<h3>Comments:</h3>
		            	<p><c:out value="${j.comments}"></c:out></p>
		            	
		            	<br>
		            	<br>
		            	<a href="/jobapplication/${j.id}/edit"><button>Update Application</button></a>

						<form action="/jobapplication/${j.id}/delete" method="post">
					    	<input type="hidden" name="_method" value="delete">
					    	<input type="submit" value="Delete Application">
						</form> 
						
						<a href="/job-quest"><button>Cancel</button></a>




</body>
</html>