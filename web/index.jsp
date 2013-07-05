<%-- 
    Document   : index
    Created on : Jul 1, 2013, 9:06:44 AM
    Author     : DELL
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Struts2 Network - Welcome</title>

		<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-responsive.min.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">

		<script type="text/javascript" src="js/jquery.min.js" ></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js" ></script>		
	</head>
	<body>

		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<a class="brand" href="#">Struts2 Network</a>
					<div class="nav-collapse collapse">
						<form class="navbar-form pull-right" action="login" method="post">
							<s:textfield name="email" placeholder="Email" cssClass="span2" />
							<s:password name="password" placeholder="Password" cssClass="span2" />
							<input type="submit" class="btn" value="Sign In" />
						</form>
					</div><!--/.nav-collapse -->
				</div>
			</div>
		</div>

		<div class="container">

			<!-- Main hero unit for a primary marketing message or call to action -->
			<div class="hero-unit">
				<h1>Hello, world!</h1>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>			
				<p>					
					<a href="<s:url action='register'/>" class="btn btn-primary btn-large">Sign Up</a>
					<a href="<s:url action='home'/>" class="btn btn-large">Get Started &raquo;</a>
				</p>
			</div>

			<hr>

			<footer>
				<p>&copy; Company 2013</p>
			</footer>

		</div>		
	</body>
</html>
