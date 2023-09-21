<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Your Flight</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> 
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<h1><img class="airline" src="/images/lcaWXWraEognpoCdEfYlbkbJVIjnUnJp0MJXZf5Cs1k 3.43.11 PM.webp">Sunny Airlines</h1>
	<a href="/welcome"><button class="btnHome">Home</button></a>
	<h2>Edit Your Flight</h2>
	<div class="container">
		<form:form action="/flights/${flights.id}/edit" modelAttribute="flights" class="form" method="put">
			<div>
				<form:errors path="departure_city" class="error"/>
				<form:label class="label" for="departure_city" path="departure_city">From:</form:label><br>
				<form:input type="text" path="departure_city" class="input"/>
			</div>
			<div >
				<form:errors path="arrival_city" class="error"/>
				<form:label class="label" for="arrival_city" path="arrival_city">To:</form:label><br>
				<form:input type="text" path="arrival_city" class="input"/>
			</div>
			<div>                  
				<form:errors path="passengers" class="error"/>
				<form:label class="label" for="passengers" path="passengers">Number of Passenger(s):</form:label><br>
				<form:input type="number" path="passengers" class="input" min="0" max="10"/>
			</div>
			<div>
				<form:errors path="baggages" class="error"/>
				<form:label class="label" for="baggages" path="baggages">Number of Baggage(s):</form:label><br>
				<form:input type="number" path="baggages" class="input" min="0" max="10"/>
			</div>
			<div>
				<form:errors path="flight_class" class="error"/>
				<form:label class="label" for="flight_class" path="flight_class">Class:</form:label><br>
				<form:select type="String" path="flight_class" class="input">
					<option></option>
					<option>Economy</option>
					<option>Economy Plus</option>
					<option>Business</option>
					<option>First Class</option>
				</form:select>
			</div>
			<div>
				<form:errors path="departure_date" class="error"/>
				<form:label class="label" for="departure_date" path="departure_date">Departure Date:</form:label><br>
				<form:input type="date" path="departure_date" class="input" />
			</div>
			<div>
				<form:errors path="departure_airport" class="error"/>
				<form:label class="label" for="departure_airport" path="departure_airport">Departure Airport:</form:label><br>
				<form:input type="String" path="departure_airport" class="input" />
			</div>
			<div>
				<form:errors path="arrival_airport" class="error"/>
				<form:label class="label" for="arrival_airport" path="arrival_airport">Arrival Airport:</form:label><br>
				<form:input type="String" path="arrival_airport" class="input" />
			</div>
			<div>
				<form:errors path="user" class="error"/>
				<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
			</div>
			<div>
				<input class="buttons "type="submit" value="Submit" class="btn-primary"/>
			</div>
		</form:form>
	</div>
</body>
</html>