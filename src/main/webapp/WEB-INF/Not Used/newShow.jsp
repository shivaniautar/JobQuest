<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shows</title>
</head>
<body>


<h1>Create a new show</h1>

	 <p style="color: red;"><form:errors path="show.*"/></p>

		<form:form method="POST" action="/shows" modelAttribute="show">
	        <p>
	            <form:label path="title">Title:</form:label>
	            <form:input type="text" path="title"/>
	        </p>
	        <p>
	            <form:label path="network">Network:</form:label>
	            <form:input type="text" path="network"/>
	        </p>
	        <form:input type="hidden" path="userT" value="${user.id}"/>
	        <input type="submit" value="Add TV Show"/>
	        
	    </form:form>







</body>
</html>