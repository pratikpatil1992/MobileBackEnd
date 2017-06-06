<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%@include file="Shared/Header.jsp" %>
<h2>Login</h2>
<c:url var="login" value='j_spring_security_check'/>
	
<div>
${msg}
<form action="${login}" method="post">
<input type="text" name="username"/>
<input type="password" name="password"/>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									
<input type="submit" value="Submit" />


</form>
 </div>
<%@include file="Shared/Footer.jsp" %>
</body>
</html>