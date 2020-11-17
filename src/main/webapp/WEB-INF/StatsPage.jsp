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
  <li><a href="/status/stats">Status Stats</a></li>
  <li><a href="/job-quest">Home</a></li>
  
</ul>


	<h1>Hi <c:out value="${user.firstName}" />!</h1>
	
	<h2>See Your Job Applications by status: Applied <c:out value="${s.len}"></c:out></h2>
	
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
	            <th>Comments:</th>
	            <th>Actions:</th>

	        </tr>
	    </thead>
	    <tbody>
	    
		    		<c:forEach items="${stat}" var="s">
		    	<tr>
		            	<td><a href="/jobapplication/${s.id}"><c:out value="${s.company}"></c:out></a></td>
		            	<td><c:out value="${s.location}"></c:out></td>
		            	<td><c:out value="${s.roletype}"></c:out></td>
		            	<td><c:out value="${s.role}"></c:out></td>
		            	<td><c:out value="${s.salary}"></c:out></td>
		            	<td><a href="${s.link}"><c:out value="${s.link}"></c:out></a></td>
		            	<td><c:out value="${s.appdate}"></c:out></td>
		            	<td><c:out value="${s.comments}"></c:out></td>
		            	<td><a href="/jobapplication/${s.id}/edit">Update Application</a></td>
		    	</tr>
		            </c:forEach>
	    </tbody>
	</table><br><br>
	
	<h2>See Your Job Applications by status: Applied<c:out value="${n.len}"></c:out></h2>
	
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
	            <th>Comments:</th>
	            <th>Actions:</th>

	        </tr>
	    </thead>
	    <tbody>
	    
		    		<c:forEach items="${need}" var="n">
		    	<tr>
		            	<td><a href="/jobapplication/${n.id}"><c:out value="${n.company}"></c:out></a></td>
		            	<td><c:out value="${n.location}"></c:out></td>
		            	<td><c:out value="${n.roletype}"></c:out></td>
		            	<td><c:out value="${n.role}"></c:out></td>
		            	<td><c:out value="${n.salary}"></c:out></td>
		            	<td><a href="${n.link}"><c:out value="${s.link}"></c:out></a></td>
		            	<td><c:out value="${n.appdate}"></c:out></td>
		            	<td><c:out value="${n.comments}"></c:out></td>
		            	<td><a href="/jobapplication/${n.id}/edit">Update Application</a></td>
		    	</tr>
		            </c:forEach>
	    </tbody>
	</table><br><br>
	
	
	
	
						

	<footer> © Copyright 2020 Shivani Autar</footer>


</body>
</html>