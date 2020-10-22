<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Show Page</title>
</head>
<body>

		<h1>Edit ${show.title}</h1>

	    <p style="color: red;"><form:errors path="show.*"/></p>

		<form:form method="POST" action="/shows/${show.id}/update" modelAttribute="show">
	        <p>
	            <form:label path="title">Title:</form:label>
	            <form:input type="text" path="title" />
	        </p>
	        <p>
	            <form:label path="network">Network:</form:label>
	            <form:input type="text" path="network" />
	        </p>
     	    <form:input type="hidden" path="avgRating" value="${show.avgRating}"/>
	        <form:input type="hidden" path="userT" value="${user.id}"/>
	        <input type="submit" value="Update Show"/> <a href="/shows/${show.id}"><button type="button" >Cancel</button></a>
	    </form:form>

	    <br>
	    <form action="/shows/${show.id}" method="post">
	    	<input type="hidden" name="_method" value="delete">
	    	<input type="submit" value="Delete Show">
		</form> 

</body>
</html>