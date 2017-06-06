<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
</head>
<body>
<%@include file="Shared/Header.jsp" %>
<h2>Register</h2>
	
<c:url var="saveUrl" value="/register" />
<div>
${msg}
<form:form action="Register" method="post" modelAttribute="user">
<form:label path="name">Name</form:label><form:input path="name" />
<form:label path="username">UserName</form:label><form:input path="username" />
<form:label path="password">Password</form:label><form:input path="password" />
<form:label path="mail">Mail</form:label><form:input path="mail" />
<form:label path="phone">Phone</form:label><form:input path="phone" />
<input type="submit" value="Submit" />
</form:form>
  
<%@include file="Shared/Footer.jsp" %>
</body>
</html>