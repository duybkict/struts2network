<%-- 
    Document   : error
    Created on : Jul 16, 2013, 1:38:19 PM
    Author     : DELL
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Error</title>
		<jsp:include page="template/documents.jsp" />
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
			<div class="jumbotron">
				<center>
					<s:if test="exception == null" >
						<h1>404 Not Found</h1>
						<p class="lead">Cras justo odio, dapibus ac facilisis in, egestas eget quam. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
					</s:if>
					<s:else>
						<h1>An error has occured</h1>
						<p class="lead"><s:property value="exception" /></p>
					</s:else>
					<a href="<s:url action='register'/>" class="btn btn-large btn-primary">Sign Up Now</a>
					<a href="index.jsp" class="btn btn-large">Return to the home page</a>
				</center>
			</div>
		</div>
    </body>
</html>
