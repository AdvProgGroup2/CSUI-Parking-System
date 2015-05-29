<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>CSUI Parking System</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name = "description" content="Web-based parking system for fasilkom UI">
	<meta name = "author" content="Tsabita Vera Cyavrilla, Yanuar Wicaksana, Hakeem Radiansyah Daud, Abicantya Prasidya Sophie, Yohana Fransiska Kanisia Hadiati">
	<link href = "bootstrap.min.css" rel = "stylesheet">
	<link href = "stylesheet.css" rel="stylesheet">
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
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
	
	<div id = "top">
		<img src = "carlogo.png" alt = "csuiparkingsystemlogo">
		<h1> CSUI PARKING SYSTEM </h1>
	</div>
	<% if(session.getAttribute("loginstatus") == "yes"){
			response.sendRedirect("home.jsp");
	} else if(session.getAttribute("adminstatus") == "yes"){
			response.sendRedirect("adminhome.jsp");
	} else if(session.getAttribute("gueststatus") == "yes"){
		response.sendRedirect("homeGuest.jsp");
	}
	%>
	<div id = "welcomemenu">
		<div class = "col-md-6">
			<div id = "login">
				<h1><i class = "fa fa-car fa-lg"></i></h1>
				<h2 id ="logtitle">Login</h2>
				<form class = "form-inline" name = "login" class = "col-md-12" method = "post" action="CheckLogIn.jsp">
					<p>Username <input type = "text" name = "username" class="form-control username" 
					data-placement="bottom" data-trigger="manual" data-content="Must be at least 4 characters long."></p>
					<p>Password <input type = "password" name = "password" maxlength="8" class="form-control password" 
					data-placement="bottom" data-trigger="manual" data-content="Maximum 8 characters long."></p>
					<button type="submit" value="Submit" class="btn btn-submit">Submit</button>
				</form>
			<br />
			<button class = "btn btn-primary" onclick = "toggle_visibility('guestlogin')">Log in as guest</button>
			</div>
		</div>
		
		<div class = "col-md-6">
			<div id = "register">
				<h1><i class = "fa fa-male fa-lg"></i> <i class = "fa fa-car fa-lg"></i></h1>
				<h2 id ="registertitle">Register</h2>
				<form class = "form-inline" name = "register" method = "post" action="CheckSignUp.jsp">
					<p>Name <input type = "text" name = "name" class="form-control name" 
					data-placement="bottom" data-trigger="manual" data-content="Must be at least 3 characters long."></p>
					<p>ID number <input type = "text" name = "id" class="form-control userid" 
					data-placement="bottom" data-trigger="manual" data-content="Must be 4-10 characters long."></p>
					<p>Role <input type = "text" name = "role"></p>
					<p>Username <input type = "text" name = "uname" class="form-control username" 
					data-placement="bottom" data-trigger="manual" data-content="Must be at least 4 characters long."></p>
					<p>Password <input type = "password" name = "pword" maxlength="8" class="form-control password" 
					data-placement="bottom" data-trigger="manual" data-content="Maximum 8 characters long."></p>
					<button type="submit" class="btn btn-submit">Submit</button>
				</form>
			</div>
		</div>
	</div>
	<br/><br/><br/>
	
	<div id = "guestlogin">	
		<h2>Guest Log-in</h2>
		<form name = "guestloginform" class = "form-inline" method = "post" action="GuestLogIn.jsp">
			<p>Guest Name <input type = "text" name = "guestname" class="form-control name" 
					data-placement="bottom" data-trigger="manual" data-content="Must be at least 3 characters long."></p>
			<p>Phone Number <input type = "text" name = "phonenumber" class="form-control phone" 
					data-placement="bottom" data-trigger="manual" data-content="Must contain numbers."></p>
			<button type="submit" value="Submit" class="btn btn-submit">Submit</button>
		</form>
	</div>
	<br/><br/>
	
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src = "bootstrap.min.js"></script>
	<script type = "text/javascript">
	$.fn.goValidate = function() {
    	    var $form = this,
    	        $inputs = $form.find('input:text, input:password'),
    	        $selects = $form.find('select'),
    	        $textAreas = $form.find('textarea');
    	  
    	    var validators = {
    	        name: {
    	            regex: /^[A-Za-z]{3,}$/
    	        },
    	        username: {
    	            regex: /^[A-Za-z\.]{4,}$/
    	        },
    	        userid: {
    	            regex: /^[0-9]{4,10}$/
    	        },
    	        password: {
    	            regex: /^[a-zA-z0-9]{3,8}$/
    	        },
    	        phone: {
    	            regex: /^[0-9]{5,}$/,
    	        }
    	    };
    	    var validate = function(klass, value) {
    	        var isValid = true,
    	            error = '';
    	            
    	        if (!value && /required/.test(klass)) {
    	            error = 'This field is required';
    	            isValid = false;
    	        } else {
    	            klass = klass.split(/\s/);
    	            $.each(klass, function(i, k){
    	                if (validators[k]) {
    	                    if (value && !validators[k].regex.test(value)) {
    	                        isValid = false;
    	                        error = validators[k].error;
    	                    }
    	                }
    	            });
    	        }
    	        return {
    	            isValid: isValid,
    	            error: error
    	        }
    	    };
    	    var showError = function($e) {
    	        var klass = $e.attr('class'),
    	            value = $e.val(),
    	            test = validate(klass, value);
    	      
    	        $e.removeClass('invalid');
    	        $('#form-error').addClass('hide');
    	        
    	        if (!test.isValid) {
    	            $e.addClass('invalid');
    	            
    	            if(typeof $e.data("shown") == "undefined" || $e.data("shown") == false){
    	               $e.popover('show');
    	            }
    	            
    	        }
    	      else {
    	        $e.popover('hide');
    	      }
    	    };
    	   
    	    $inputs.keyup(function() {
    	        showError($(this));
    	    });
    	    $selects.change(function() {
    	        showError($(this));
    	    });
    	    $textAreas.keyup(function() {
    	        showError($(this));
    	    });
    	  
    	    $inputs.on('shown.bs.popover', function () {
    	  		$(this).data("shown",true);
    		});
    	  
    	    $inputs.on('hidden.bs.popover', function () {
    	  		$(this).data("shown",false);
    		});
    	  
    	    $form.submit(function(e) {
    	      
    	        $inputs.each(function() { /* test each input */
    	        	if ($(this).is('.required') || $(this).hasClass('invalid')) {
    	            	showError($(this));
    	        	}
    	    	});
    	    	$selects.each(function() { /* test each input */
    	        	if ($(this).is('.required') || $(this).hasClass('invalid')) {
    	            	showError($(this));
    	        	}
    	    	});
    	    	$textAreas.each(function() { /* test each input */
    	        	if ($(this).is('.required') || $(this).hasClass('invalid')) {
    	            	showError($(this));
    	        	}
    	    	});
    	        if ($form.find('input.invalid').length) { /* form is not valid */
    	        	e.preventDefault();
    	            $('#form-error').toggleClass('hide');
    	        }
    	    });
    	    return this;
    	};

    	$('form').goValidate();
    	</script>
	<footer class = "below">
		<p>Copyright 2015. A project by Group 2 for Advanced Programming assignment.</p>
		<p>Created by Tsabita Vera Cyavrilla, Yanuar Wicaksana, Hakeem Radiansyah Daud, Abicantya Prasidya Sophie, Yohana Fransiska Kanisia Hadiati.</p>
	</footer>
</body>

</html>