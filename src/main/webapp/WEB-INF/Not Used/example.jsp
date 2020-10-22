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


	<h1>Welcome, <c:out value="${user.name}" /></h1>

	<a href="/logout">Logout</a>
	<h1>TV Shows</h1>

<%-- <table style="border: 3px solid black; padding:7px;">
	    <thead>
	        <tr>
	            <th>Show:</th>
	            <th>Network:</th>
	            <th>Avg Rating:</th>
	        </tr>
	    </thead>
	    <tbody>
		    		<c:forEach items="${shows}" var="show">
		    	<tr>
		            	<td><a href="/shows/${show.id}"><c:out value="${show.title}"/></a></td>
		            	<td><c:out value="${show.network}"></c:out></td>
		            	<td><c:out value="${show.avgRating}"></c:out></td>
		    	</tr>
		            </c:forEach>
	    </tbody>
	</table><br><br> --%>
	
	<p><a href="/shows/new"><button>Add a Show</button></a></p>




</body>
</html>