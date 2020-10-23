<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/css/showjob.css">
<title>Job-Quest</title>
</head>
<body>


<div class="header">
                <a href="/job-quest"><img class="appname" src="/images/Name.PNG" alt="Job Quest" width="300px"></a>
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

	
		<h2>Your Job Application to ${j.company}</h2>
	
	<div class="neww">
		<div class="leftside">
						<div class="flexthis">
		            	<h3 >Company:</h3>
		            	<p><c:out value="${j.company}"></c:out></p>
		            	</div>
						
						<div class="flexthis">
		            	<h3>Location:</h3>
		            	<p><c:out value="${j.location}"></c:out></p>
		            	</div>
		            	
		            	
						<div class="flexthis">
		            	<h3>Role Level:</h3>
		            	<p><c:out value="${j.roletype}"></c:out></p>
		            	</div>
		            	
		            	<div class="flexthis">
		            	<h3>Position:</h3>
		            	<p><c:out value="${j.role}"></c:out></p>
		            	</div>
		            	
		</div>
		<div class="rightside">
						<div class="flexthis">
		            	<h3>Salary:</h3>
		            	<p><c:out value="${j.salary}"></c:out></p>
		            	</div>
		            	<div class="flexthis">
		            	<h3>Link:</h3>
		            	<p><a href="${j.link}"><c:out value="${j.link}"></c:out></a></p>
		            	</div>
		            	<div class="flexthis">
		            	<h3>Application Date:</h3>
		            	<p><c:out value="${j.appdate}"></c:out></p>
		            	</div>
		            	<div class="flexthis">
		            	<h3>Current Status:</h3>
		            	<p><c:out value="${j.status}"></c:out></p>
		            	</div>
		      </div>
		            	
	</div>
					<div class="centerthis">
						
						<div class="flexthis">
		            	<h3>Comments:</h3>
		            	<p style="padding-bottom:100px;"><c:out value="${j.comments}"></c:out></p>
		            	</div>
		            </div>
		            	
		            	<div class="flexandspace">
		            	<a href="/jobapplication/${j.id}/edit"><button class="formbutton">Update Application</button></a>

						<form action="/jobapplication/${j.id}/delete" method="post">
					    	<input type="hidden" name="_method" value="delete">
					    	<input class="formbutton" type="submit" value="Delete Application">
						</form> 
						
						<a href="/job-quest"><button class="formbutton">Cancel</button></a>
						</div>
						

	<footer> © Copyright 2020 Shivani Autar</footer>


</body>
</html>