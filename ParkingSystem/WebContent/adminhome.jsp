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
		ConnectDB db = new ConnectDB();
		ParkingLot lot = new ParkingLot();
		//MainProgram.InitParkingSpace(lot);
		String username = (String) session.getAttribute("username");
		for (int i = 0; i < 30; i++){
			ParkingSpace space = new ParkingSpace(i+1);
			int status = db.checkstatus(i+1);
			//System.out.println(status);
			if(status == 1){
				space.setAvailability(false);
				//System.out.println("test");
			}
			lot.addParkingSpace(space);
		}
		lot.checkavailable();
	
	%>
	<div id = "top">
		<img src = "carlogo.png" alt = "csuiparkingsystemlogo">
		<h1> CSUI PARKING SYSTEM </h1>
		<h3>- ADMIN VIEW -</h3><br />
	</div>
	
	<div id = "nav">
		
		<div class = "col-xs-15">
			<a class = "parkspot" href = "#"><button class = "btn btn-default btn-circle btn-lg"><i class ="fa fa-car fa-lg"></i></button></a>
			<span id="parkspottext">View Parking Spot</span>
		</div>
		<div class = "col-xs-15">
			<a class = "guestregist" href = "#" onclick="toggle_visibility('guestregistmenu')"><button class = "btn btn-default btn-circle btn-lg"><i class ="fa fa-user-plus fa-lg"></i></button></a>
			<span id="guestregisttext">Register Guest</span>
		</div>
		<div class = "col-xs-15">
			<a class = "viewguest" href = "#" onclick = "toggle_visibility('viewguestmenu')"><button class = "btn btn-default btn-circle btn-lg"><i class ="fa fa-man fa-lg"></i></button></a>
			<span id="viewguesttext">View Guests</span>
		</div>
		<div class = "col-xs-15">
			<a class = "viewmember" href = "#" onclick = "toggle_visibility('viewmembermenu'')"><button class = "btn btn-default btn-circle btn-lg"><i class ="fa fa-list-alt fa-lg"></i></button></a>
			<span id="viewmembertext">View Members</span>
		</div>
		<div class = "col-xs-15">
			<form name="logout" method="post" action="Logout.jsp">
			<a class = "signout" href ="index.jsp"><button class = "btn btn-default btn-circle btn-lg" type="submit" value="Submit"><i class ="fa fa-arrow-circle-left fa-lg"></i></button></a>
			<span id="signouttext">Log Out</span>
			</form>
		</div>
		
	</div>
	<br /><br /><br /><br /><br />

	<div id = "guestregistmenu">	
		<h2>Register Guest</h2>
		<form name = "guestregisterform" method = "post" action="GuestRegister.jsp">
			<p>Guest Name <input type = "text" name = "guestname"></p>
			<p>Phone Number <input type = "password" name = "phonenumber"></p>
			<button type="submit" value="Submit" class="btn btn-submit">Submit</button>
		</form>
	</div>
	<br/><br/>
	
	<div id = "viewguestmenu">	
		<h2>List of Guests</h2>
		<h4>some text.</h4>
		<table>
			<tr>
				<td>No</td>
				<td>Name</td>
				<td>Phone Number</td>
			</tr>
		</table>
	</div>
	<br/><br/>
	
	<div id = "viewmembermenu">	
		<h2>List of Members</h2>
		<h4>some text.</h4>
		<table>
			<tr>
				<td>No</td>
				<td>Name</td>
				<td>Identification Number</td>
				<td>Username</td>
			</tr>
		</table>
	</div>
	<br/><br/>
	
	<div id = "parkspotmenu">
	<div class = "text-center" id = "map">
		<h2>Parking Map</h2><br/>
		<div id = "tables">
		<table id = "mapmenu">
			<tr class = "text-center" id = "row1">
				<td id = "space1">Space1</td>
				<td id = "space2">Space2</td>
				<td id = "space3">Space3</td>
				<td id = "space4">Space4</td>
				<td id = "space5">Space5</td>
				<td id = "space6">Space6</td>
				<td id = "space7">Space7</td>
				<td id = "space8">Space8</td>
				<td id = "space9">Space9</td>
				<td id = "space10">Space10</td>
			</tr>
			<tr class = "text-center" id = "row2">
				<td id = "space11">Space11</td>
				<td id = "space12">Space12</td>
				<td id = "space13">Space13</td>
				<td id = "space14">Space14</td>
				<td id = "space15">Space15</td>
				<td id = "space16">Space16</td>
				<td id = "space17">Space17</td>
				<td id = "space18">Space18</td>
				<td id = "space19">Space19</td>
				<td id = "space20">Space20</td>
			</tr>
			<tr class = "text-center" id = "row3">
				<td id = "space21">Space21</td>
				<td id = "space22">Space22</td>
				<td id = "space23">Space23</td>
				<td id = "space24">Space24</td>
				<td id = "space25">Space25</td>
				<td id = "space26">Space26</td>
				<td id = "space27">Space27</td>
				<td id = "space28">Space28</td>
				<td id = "space29">Space29</td>
				<td id = "space30">Space30</td>
			</tr>
		</table>
		</div>
	</div>
	</div>
	
	<br /><br />
	
	<footer id = "below" class="col-md-12">
		<p>Copyright 2015. A project by Group 2 for Advanced Programming assignment.</p>
		<p>Created by Tsabita Vera Cyavrilla, Yanuar Wicaksana, Hakeem Radiansyah Daud, Abicantya Prasidya Sophie, Yohana Fransiska Kanisia Hadiati.</p>
	</footer>
</body>