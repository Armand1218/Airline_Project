<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> 
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<c:if test="${user==flights.user}">
		<a href="/welcome"><button class="buttons">Home</button></a> | <a href="/"><button class="buttons">Logout</button></a>
	</c:if>
	<h1><img class="airline" src="/images/lcaWXWraEognpoCdEfYlbkbJVIjnUnJp0MJXZf5Cs1k 3.43.11 PM.webp">Sunny Airlines</h1>
	<div class="containerView">
	<h3>Your Flight Details:</h3>
		<p>From:  <c:out value="${flights.departure_city}"></c:out></p>
		<p>To:  <c:out value="${flights.arrival_city}"></c:out></p>
		<p>Seat Class:  <c:out value="${flights.flight_class}"></c:out></p>
		<p>Number of Passenger(s):  <c:out value="${flights.passengers}"></c:out></p>
		<p>Number of Baggage(s):  <c:out value="${flights.baggages}"></c:out></p>
		<p>Departure Airport:  <c:out value="${flights.departure_airport}"></c:out></p>
		<p>Departure Date:  <c:out value="${flights.departure_date}"></c:out></p>
		<p>Arrival Airport:  <c:out value="${flights.arrival_airport}"></c:out></p>
	</div>
</body>
</html>