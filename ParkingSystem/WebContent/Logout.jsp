<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log out</title>
</head>
<body>
	<%@ page import="Parking.ParkingSpace" %>
	<%@ page import="Parking.ParkingLot" %>
	<%@ page import="Parking.MainProgram" %>
	<%
		if(session.getAttribute("loginstatus") == "yes"){
			session.setAttribute("loginstatus", null);
		} 
		else if(session.getAttribute("adminstatus") == "yes"){
			session.setAttribute("adminstatus", null);	
		} 
		else if(session.getAttribute("gueststatus") == "yes"){
			session.setAttribute("gueststatus", null);
		}
		session.setAttribute("username", null);
		response.sendRedirect("index.jsp");
	%>
</body>
</html>