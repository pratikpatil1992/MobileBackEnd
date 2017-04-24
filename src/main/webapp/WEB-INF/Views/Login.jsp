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
<form action="index.jsp" method="post"><input type="text" id="username" name="username" />
<input type="text" id="password" name="password" />
      <input type="Submit" value="Go" />
    </form>
<%@include file="Shared/Footer.jsp" %>
</body>
</html>