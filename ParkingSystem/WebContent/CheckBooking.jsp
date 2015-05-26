<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check Booking</title>
</head>
<body>
<%@ page import="Parking.ConnectDB" %>
<%@ page import="Parking.ParkingSpace" %>
<%@ page import="Parking.ParkingLot" %>
<%@ page import="Parking.MainProgram" %>

<% ConnectDB db = new ConnectDB();
	String bookingnumber = request.getParameter("spotnumber");
		if(!(bookingnumber.equals(""))) {
			int booking = Integer.parseInt(bookingnumber);
			
			int stat = db.checkstatus(booking);
			
			if (stat==0){
				System.out.println("Congratulations, you have successfully booked your spot!");
			} else if (stat==1){
				System.out.println("Sorry, that spot is already taken. Please try another spot.");
			} else {
				System.out.println("Sorry that spot is already booked. Please try another spot.");
				}
			} else {
			System.out.println("You must not leave this empty! Please enter your desired spot.");
			}
			
/* 			if (stat==0){
				System.out.println("Congratulations! You have successfully booked the parking spot!");
					if (stat==1){
						System.out.println("Sorry, that parking spot is already taken. Please try another one."); 
	}
	}
	} */
	 %>
</body>
</html>