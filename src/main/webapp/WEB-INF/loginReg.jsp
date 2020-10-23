<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="css/loginpage.css">
<title>Job Quest</title>
</head>
<body>

<div class="header">
                <img class="appname" src="/images/Name.PNG" alt="Job Quest" width="300px">
</div>

<ul>

  <li><a href="#contact" style="margin-right:500px;">About Us</a></li>
  <li><a href="#news">Seminars</a></li>
  <li><a href="#contact">Tips</a></li>
    <li><a href="#news">Stats</a></li>
    <li><a class="active" href="/job-quest">Home</a></li>
  
</ul>

<div class="flex-container">

	<div class="register">
	<h1>Register</h1>
	    <p style="color:red"><form:errors path="user.*"/></p>
	    
	    <form:form method="POST" action="/registration" modelAttribute="user">
	        <p>
	            <form:label path="firstName">First Name:</form:label>
	            <form:input class="inputs" type="firstName" path="firstName"/>
	        </p>
	        
	       	<p>
	            <form:label path="lastName">Last Name:</form:label>
	            <form:input class="inputs" type="lastName" path="lastName"/>
	        </p>
	        
	        
	        <p>
	            <form:label path="email">Email:</form:label>
	            <form:input class="inputs" type="email" path="email"/>
	        </p>
	        <p>
	            <form:label path="password">Password:</form:label>
	            <form:password class="inputs" path="password"/>
	        </p>
	        <p>
	            <form:label path="passwordConfirmation">Password Confirmation:</form:label>
	            <form:password class="inputs" path="passwordConfirmation"/>
	
	        </p>
	        <input class="formbutton" type="submit" value="Register!"/>
	    </form:form>
	
	</div>

	<div class="login">
	    
		<h1>Login</h1>
		    <p style="color:red"><c:out value="${error}" /></p>
		    <form method="post" action="/login">
	   
		        <p>
		            <label for="email">Email: </label>
		            <input class="inputs" type="text" id="email" name="email"/>
		        </p>
		        <p>
		            <label for="password">Password: </label>
		            <input class="inputs" type="password" id="password" name="password"/>
		        </p>
		        <input class="formbutton" type="submit" value="Login!"/>
		    </form>    
		    
	</div>

</div>

	<footer> © Copyright 2020 Shivani Autar</footer>
</body>
</html>