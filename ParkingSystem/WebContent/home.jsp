<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>CSUI Parking System</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name = "description" content="Web-based parking system for fasilkom UI">
	<meta name = "author" content="Tsabita Vera Cyavrilla, Yanuar Wicaksana, Hakeem Radiansyah Daud, Abicantya Prasidya Sophie, Yohana Fransiska Kanisia Hadiati">
	<link href = "bootstrap.min.css" rel = "stylesheet">
	<link href = "stylesheet.css" rel="stylesheet">
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<script src = "bootstrap.min.js"></script>
	<script type="text/javascript">
	    function toggle_visibility(id) {
	       var e = document.getElementById(id);
	       if(e.style.display == 'block')
	          e.style.display = 'none';
	       else
	          e.style.display = 'block';
	    }
	</script>
</head>

<body>
	<%@ page import="Parking.ParkingSpace" %>
	<%@ page import="Parking.ParkingLot" %>
	<%@ page import="Parking.MainProgram" %>
	<%@ page import="Parking.ConnectDB" %>
	<%@ page import="Parking.ParkingMap" %>
	<% 
		if(session.getAttribute("loginstatus") == null){
			response.sendRedirect("index.jsp");
		}
	%>
	<%
		ParkingLot lot = new ParkingLot();
		MainProgram.InitParkingSpace(lot);
		if(session.getAttribute("statuslot") == "yes"){
			lot = (ParkingLot) session.getAttribute("parklot");
		}
	
	%>
	<div id = "top">
		<img src = "carlogo.png" alt = "csuiparkingsystemlogo">
		<h1> CSUI PARKING SYSTEM </h1>
	</div>
	
	<div id = "nav">
		
		<div class = "col-xs-15">
			<a href ="home.jsp" class = "home"><button class = "btn btn-default btn-circle btn-lg"><i class ="fa fa-home fa-lg"></i></button></a>
			<span id="hometext">Home</span>
		</div>
		<div class = "col-xs-15">
			<% if(request.getParameter("checkin") != null){
				int id = (int) Math.random() * 30 + 1;
				lot.checkin(new ParkingSpace(id));
				String ids = Integer.toString(id);
				session.setAttribute("checkstatus", "yes");
				session.setAttribute("checklot", ids);
			}
			
			%>
			<form name="form1" method="post"> 
			<a class = "checkin"><button class = "btn btn-default btn-circle btn-lg" onclick="CheckIn()"><i class ="fa fa-map-marker fa-lg"></i></button></a>
			<span id="checkintext">Check-in</span>
			<input type ="hidden" name="checkin">
<!-- 			<input type = "hidden" name ="checkout"> -->
 			</form> 
		</div>
		<!--  <div class = "col-xs-15"> -->
			<% //if(request.getParameter("checkout") != null){
				//if(session.getAttribute("checkstatus") == "yes"){
					//int idout = Integer.parseInt(((String) session.getAttribute("checklot")));
					//lot.checkout(new ParkingSpace(idout));
					//session.setAttribute("checkstatus", null);
					//session.setAttribute("checklot", null);
				//}
			//}
			
			%>
<!-- 			<form name="form2" method="post">  -->
<!-- 			<a class = "checkout"><button class = "btn btn-default btn-circle btn-lg" onclick="CheckOut()"><i class ="fa fa-map-marker fa-lg"></i></button></a> -->
<!-- 			<span id="checkouttext">Check-out</span> -->
<!-- 			<input type ="hidden" name="checkout"> -->
<!--  			</form>  -->
<!-- 		</div> -->
		<div class = "col-xs-15">
			<a class = "booking"><button class = "btn btn-default btn-circle btn-lg"><i class ="fa fa-car fa-lg"></i></button></a>
			<span id="booktext">Booking</span>
		</div>
		<div class = "col-xs-15">
			<a class = "directions"><button class = "btn btn-default btn-circle btn-lg"><i class ="fa fa-location-arrow fa-lg"></i></button></a>
			<span id="directtext">Show Directions</span>
		</div>
		<div class = "col-xs-15">
			<form name="logout" method="post" action="Logout.jsp">
			<a class = "signout" href ="index.jsp"><button class = "btn btn-default btn-circle btn-lg" type="submit" value="Submit"><i class ="fa fa-arrow-circle-left fa-lg"></i></button></a>
			<span id="signouttext">Log Out</span>
			</form>
		</div>
		
	</div>
	<br /><br /><br /><br /><br />
	
	<div id = "availability">
		<div class = "col-md-6 col-sm-height" id = "carsicons">
			<br />
			<h1 id ="carz"><i class = "fa fa-car"></i> <i class = "fa fa-cab"></i> <i class = "fa fa-bus"></i></h1>
		</div>
		<div class = "col-md-6 col-sm-height" id = "spots">
			<h2>Available Parking Spot</h2>
			<h1 id = "avanumber"><%=lot.getavailablespace() %></h1>
			<h4>Spots Available</h4>
		</div>
	</div>
	
	<div id = "checkinmenu" style="display:none;">
		<div class = "col-md-6 col-sm-height" id ="gridone">
			<h2><i class = "fa fa-map-marker"></i> Check-in to parking slot</h2>
		</div>
		<div class = "col-md-6 col-sm-height" id = "gridtwo">
			<button class = "btn btn-success"><h3><i class = "fa fa-check"></i> CHECK IN</h3></button>  
			<button class = "btn btn-danger"><h3><i class = "fa fa-remove"></i> CHECK OUT</h3></button>
		</div>
	</div>
	
	<div id = "map">
		<br />
<!-- 		<iframe src="https://www.google.com/maps/d/u/0/embed?mid=zhv4Hz3WXoN4.kfDnfZAiSom8" width="640" height="480"></iframe> -->
	</div>
	
	<br /><br />
	
	<script type="text/javascript">
		function CheckIn(){
			document.form1.checkin.value = "check in"
			form1.submit()
// 			document.getElementById("checkintext").innerHTML = "Check-out"
		}
		
		function CheckOut(){
			document.form2.checkout.value = "check out"
			form2.submit()
		}
	
	
	
	</script>
	<footer id = "below" class="col-md-12">
		<p>Copyright 2015. A project by Group 2 for Advanced Programming assignment.</p>
		<p>Created by Tsabita Vera Cyavrilla, Yanuar Wicaksana, Hakeem Radiansyah Daud, Abicantya Prasidya Sophie, Yohana Fransiska Kanisia Hadiati.</p>
	</footer>
</body>