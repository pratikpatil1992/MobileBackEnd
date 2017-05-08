<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up</title>
</head>
<body>
<%@include file="Shared/Header.jsp" %>

<form action="index.jsp" method="post"></form>
<input type="text" id="firstname" name="firstname" placeholder="First Name"/><p>
<input type="text" id="lastname" name="lastname" placeholder="Last Name"/><p>
<input type="text" id="city" name="city" placeholder="City"/><p>

<input type="text" id="username" name="username" placeholder="Username"/><p>
<input type="text" id="password" name="password" placeholder="Password"/><p>

<input type="Submit" value="Submit" />
      
<%@include file="Shared/Footer.jsp" %>
</body>
</html>