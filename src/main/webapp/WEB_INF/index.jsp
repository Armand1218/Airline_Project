<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register/Login</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> 
</head>
<body>
<h1><img class="airline" src="/images/lcaWXWraEognpoCdEfYlbkbJVIjnUnJp0MJXZf5Cs1k 3.43.11 PM.webp">Sunny Airlines</h1>
<div class="formAccount">
<div class="register">
	<form:form action="/register" method="post" modelAttribute="newUser">
		<h2>Create your account</h2>
			<div>
				<p>First Name:</p>
				<form:errors path="firstName" class="text-danger"></form:errors>
				<form:input class="input" path="firstName" />
			</div>
				<div>
					<p>Last Name:</p>
					<form:errors path="lastName" class="text-danger"></form:errors>
					<form:input class="input" path="lastName" />
				</div>
				<div>
					<p>Email:</p>
					<form:errors path="email" class="text-danger"></form:errors>
					<form:input class="input" path="email" />
				</div>
					<div>
					<p>Password:</p>
					<form:errors path="password" class="text-danger"></form:errors>
					<form:input class="input" path="password" />
				</div>
				<div>
					<p>Confirm Password:</p>
					<form:errors path="confirm" class="text-danger"></form:errors>
					<form:input class="input" path="confirm" />
				</div>
				<tr>
					<td colspan=2><input class="inputButton" type="submit" value="Create Account" /></td>
				</tr>
	</form:form>
</div>
<div class="login">
	<form:form action="/login" method="post" modelAttribute="newLogin">
		<h2>Login</h2>
			<p>Email:</p>
	            <form:errors path="email" class="text-danger"/>
				<form:input class="input" path="email"/>
			<p>Password:</p>
	            <form:errors path="password" class="text-danger"/>
				<form:input type="password" class="input" path="password"/>
			<div><input class="inputButton" type="submit" value="Login"></input></div>
	</form:form>
</div>
</div>


</body>
</html>