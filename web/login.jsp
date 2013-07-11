<%-- 
    Document   : register
    Created on : Jul 2, 2013, 2:58:27 PM
    Author     : DELL
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
		<jsp:include page="template/documents.jsp" />

		<style type="text/css">
			body {
				background-color: #f5f5f5;
			}
			.form-signin {
				max-width:  300px;				
			}
		</style>
    </head>
    <body>
        <div class="container">
			<form class="form-signin" action="login" method="post">
				<h2 class="form-signin-heading">Sign In</h2>
				<div class="controls">
					<s:textfield name="email" placeholder="Email" cssClass="input-block-level" />
				</div>
				<div class="controls">
					<s:password name="password" placeholder="Password" cssClass="input-block-level" />
				</div>

				<input type="submit" class="btn btn-large btn-primary" value="Sign In" />
				<a href="<s:url action='register' />" style="margin-left:57px;vertical-align:bottom" >Create a new Account.</a>
			</form>

		</div> <!-- /container -->
    </body>
</html>
