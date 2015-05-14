<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>CSUI Parking System</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name = "description" content="Web-based parking system for fasilkom UI">
	<meta name = "author" content="Tsabita Vera Cyavrilla, Yanuar Wicaksana, Hakeem Radiansyah Daud, Abicantya Prasidya Sophie, Yohana Fransiska Kanisia Hadiati">
	<link href = "<%=request.getContextPath()%>/style/Bootstrap/css/bootstrap.min.css" rel = "stylesheet">
	<link href = "<%=request.getContextPath()%>/style/stylesheet.css" rel="stylesheet">
	<link href = "<%=request.getContextPath()%>/style/FontAwesome/css/font-awesome.min.css" rel = "stylesheet">
	<script src = "<%=request.getContextPath()%>/style/Bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
	<div id = "top">
		<img src = "${pageContext.request.contextPath}/img/carlogo.png" alt = "csuiparkingsystemlogo">
		<h1> CSUI PARKING SYSTEM </h1>
	</div>
	
	<div id = "nav">
		<div class = "col-xs-15">
			<a class = "home"><button class = "btn btn-default btn-circle btn-lg"><i class ="fa fa-home fa-lg"></i></button></a>
			<span id="hometext">Home</span>
		</div>
		<div class = "col-xs-15">
			<a class = "checkin"><button class = "btn btn-default btn-circle btn-lg"><i class ="fa fa-map-marker fa-lg"></i></button></a>
			<span id="checkintext">Check-in</span>
		</div>
		<div class = "col-xs-15">
			<a class = "booking"><button class = "btn btn-default btn-circle btn-lg"><i class ="fa fa-car fa-lg"></i></button></a>
			<span id="booktext">Booking</span>
		</div>
		<div class = "col-xs-15">
			<a class = "directions"><button class = "btn btn-default btn-circle btn-lg"><i class ="fa fa-location-arrow fa-lg"></i></button></a>
			<span id="directtext">Show Directions</span>
		</div>
		<div class = "col-xs-15">
			<a class = "signout"><button class = "btn btn-default btn-circle btn-lg"><i class ="fa fa-arrow-circle-left fa-lg"></i></button></a>
			<span id="signouttext">Log Out</span>
		</div>
	</div>
	<br /><br /><br /><br /><br />
	
	<div id = "availability">
		<div class = "col-md-4" id = "carsicons">
			<br /><br />
			<h1 id ="carz"><i class = "fa fa-car"></i> <i class = "fa fa-cab"></i> <i class = "fa fa-bus"></i></h1>
		</div>
		<div class = "col-md-8" id = "spots">
			<h3>Available Parking Spot</h3>
			<h2>50</h2>
			<h5>Spots Available</h5>
		</div>
	</div>
	<div id = "menus">
		<div class = "col-md-6 col-sm-height" id = "griduno">
			<h1><i class = "fa fa-map-marker"></i></h1>
			<h3>Check-in</h3><br />
			<button class = "btn btn-success">Check in</button>
			<button class = "btn btn-danger">Check out</button>
			<br/><br/>
		</div>
		<div class = "col-md-6 col-sm-height" id = "griddos">
			<h1><i class = "fa fa-car"></i></h1>
			<h3>Available Parking Spot</h3>
			<h2>50</h2>
			<h5>Spots Available</h5>
		</div>
	</div>
	
	<div id = "map">
		<iframe src="https://www.google.com/maps/d/u/0/embed?mid=zhv4Hz3WXoN4.kfDnfZAiSom8" width="640" height="480"></iframe>
	</div>
	
	<br /><br />
	<footer id = "below" class="col-md-12">
		<p>Copyright 2015. A project by Group 2 for Advanced Programming assignment.</p>
		<p>Created by Tsabita Vera Cyavrilla, Yanuar Wicaksana, Hakeem Radiansyah Daud, Abicantya Prasidya Sophie, Yohana Fransiska Kanisia Hadiati.</p>
	</footer>
</body>

</html>