<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show</title>
</head>
<body>


				<h1><c:out value="${show.title}" /></h1>
				<h6>Network: <c:out value="${show.network}" /></h6>
				<h6>Average Rating: <c:out value="${show.avgRating}" /></h6>
				

				<c:if test = "${show.userT.id == user.id}">
					<p><a href="/shows/${show.id}/edit"><button>Edit Show</button></a></p>
				</c:if>
				<hr>
				<h3>Users who rated this show:</h3>
				<table>
					<thead>
						<tr>
							<th>Name:</th>
							<th>Rating:</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${show.reviews}" var="s">
							<tr>
								<td>${s.user.name}</td>
								<td>${s.rating}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<h3>Leave a Rating:</h3>
				
				<p style="color: red;"><c:out value="${error}" /></p>
				
			    <p style="color: red;"><form:errors path="review.*"/></p>

				<form:form method="POST" action="/shows/${show.id}/review" modelAttribute="review">
			        <p>
			            <form:label path="rating">Rating:</form:label>
			            <form:select path="rating">
			            	<form:option value="5">5</form:option>
			            	<form:option value="4">4</form:option>
			            	<form:option value="3">3</form:option>
			            	<form:option value="2">2</form:option>
			            	<form:option value="1">1</form:option>
			            </form:select>
			        </p>
			        <form:input type="hidden" path="user" value="${user.id}" />
			        <form:input type="hidden" path="show" value="${show.id}" />
			        <input type="submit" value="Submit Rating"/>
			    </form:form>
			    
			    <br>
			    <br>
			    <a href="/shows">Back to All Shows Page</a>

</body>
</html>