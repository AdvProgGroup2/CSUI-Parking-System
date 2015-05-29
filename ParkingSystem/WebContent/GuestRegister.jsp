<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<%@ page import="Parking.ConnectDB" %>
<%
	ConnectDB db = new ConnectDB();
	String guest = request.getParameter("guestname");
	String phone = request.getParameter("phonenumber");
	
	if(!(guest.equals("") || phone.equals(""))){
		boolean bool = db.insertguest(guest, phone);
		if(bool){
			System.out.println("The guest has been entered!");
		} else{
			System.out.println("Error, Please Try again!");
		}
	}
	response.sendRedirect("adminhome.jsp");

%>
</body>
</html>