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
	
	<h2>See Your Job Applications by status:</h2>
	
		<table>
	    <thead>
	        <tr class="toprow">
	            <th>Status</th>
	            <th>Job Applications:</th>

	        </tr>
	    </thead>
	    <tbody>
	    
		    		<c:forEach items="${stat}" var="s">
		    	<tr>
		            	<td><c:out value="${s.company}"></c:out></td>
		            	<td><c:out value="${s.status}"></c:out></td>
		    	</tr>
		            </c:forEach>
	    </tbody>
	</table><br><br>
	
	
	
	
						

	<footer> © Copyright 2020 Shivani Autar</footer>


</body>
</html>