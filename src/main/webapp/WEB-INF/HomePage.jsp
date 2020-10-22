<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shows</title>
</head>
<body>


	<h1>Welcome, <c:out value="${user.firstName}" /></h1>

	<a href="/logout">Logout</a>
	<h1>TV Shows</h1>

	<p><a href="/shows/new"><button>Add a Show</button></a></p>




</body>
</html>