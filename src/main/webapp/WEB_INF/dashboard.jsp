<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Airline Solo Project</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/style.css"> 
</head>
<body>
	<div class="dashboard">
		<h1><img class="airline" src="/images/lcaWXWraEognpoCdEfYlbkbJVIjnUnJp0MJXZf5Cs1k 3.43.11 PM.webp">Sunny Airlines</h1>
		<a href="/logout"><button class="btnHome">Logout</button></a>
		<h2>Welcome, <c:out value="${user.firstName}"/>
		</h2>
		<h3> Here Are Your Upcoming Flights!</h3>
				<a href="/addFlight"><button class="btnAdd">Book a flight</button></a>
		<table>
			<tr class="label">
				<th>Arrival City</th>
				<th>Passenger Count</th>
				<th>Class</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="flights" items="${flights}">
				<c:if test="${user.id!=flights.save_flight.id}">
				<tr class="result">
				<c:if test="${user==flights.user}">
					<td><c:out value="${flights.arrival_city}"></c:out></td>
					<td><c:out value="${flights.passengers}"></c:out></td>
					<td><c:out value="${flights.flight_class}"></c:out></td>
					<td><a href="flights/${flights.id}/edit"><button class="buttons">Edit</button></a> | 
						<a href="/view/${flights.id}"><button class="buttons">View</button></a> | 
						<a href="flights/${flights.id}/saveFlight"><button class="buttons">Add to Past Flights</button></a> |
						<a href="flights/${flights.id}/delete"><button class="buttons">Delete</button></a>
				</c:if>
				</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
	<div class="dashboard">
		<h3 class="past">Here's Your Past Flights!</h3>
		<table>
			<tr class="label">
				<th>Past Flights</th>
				<th>Rating</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="flights" items="${flights}">
				<c:if test="${user.id==flights.save_flight.id}">
				<tr class="result">
					<td><c:out value="${flights.arrival_city}"></c:out></td>
					<td>
						<select name="rating" class="rating">
							<option>Select A Rating</option>
							<option value="1">1 - Poor</option>
							<option value="2">2 - Could be better</option>
							<option value="3">3 - Average</option>
							<option value="4">4 - Very good</option>
							<option value="5">5 - Excellent</option>
						</select>
					</td>
					<td>
						<a href="flights/${flights.id}/delete"><button class="buttons">Delete</button></a> |
						<a href="flights/${flights.id}/rebook"><button class="buttons">ReBook</button></a>
					</td>
				</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
</body>
</html>