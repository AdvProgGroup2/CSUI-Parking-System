<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Login</title>
</head>
<body>
	<%@ page import="Parking.ConnectDB" %>
	<%@ page import="Parking.ParkingSpace" %>
	<%@ page import="Parking.ParkingLot" %>
	<%@ page import="Parking.MainProgram" %>
	<% ConnectDB dbconnect = new ConnectDB();
		//System.out.println(dbconnect);
		boolean valid = dbconnect.checklogin(request.getParameter("username"), request.getParameter("password")); 
		if(valid){ 
			session.setAttribute("loginstatus", "yes");
			session.setAttribute("username", request.getParameter("username"));
			/*
			ParkingLot lot = new ParkingLot();
			MainProgram.InitParkingSpace(lot);
			session.setAttribute("parklot", lot);
			session.setAttribute("statuslot", "yes");
			*/
			response.sendRedirect("home.jsp");
			} else if(!valid) {
			session.setAttribute("loginstatus", "fail");
			response.sendRedirect("index.jsp");
			}%>
	
</body>
</html>