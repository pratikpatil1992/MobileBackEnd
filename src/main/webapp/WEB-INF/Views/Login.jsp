<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%@include file="Shared/Header.jsp" %>
<h2>Welcome to the Login page</h2>
<form action="validate" method="post"><input type="text" id="userName" name="userName" />
<input type="password" id="password" name="password" />     <!-- type="password" so that input text cannot be seen -->
      <input type="Submit" value="Go" />
    </form>
<%@include file="Shared/Footer.jsp" %>
</body>
</html>