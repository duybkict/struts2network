<%-- 
    Document   : error
    Created on : Jul 16, 2013, 1:38:19 PM
    Author     : DELL
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h4>The application has malfunctioned.</h4>
		<p>  Please contact technical support with the following information:</p>

		<!-- the exception and exceptionStack bean properties
		were created by Struts2's Exception Intercepter  -->
		<h4>Exception Name: <s:property value="exception.message" /> </h4>


	    <p><a href="index.jsp">Return to the home page.</a></p>
    </body>
</html>
