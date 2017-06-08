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
	
<div class="container" >
<center>
${msg}
<form action="${login}" method="post">
<input class="form-control" style="width:200px"  type="text" name="username" placeholder="Username"/>
<br/>
<input class="form-control" style="width:200px"  type="password" name="password" placeholder="Password"/>

									<br/>
<button  type="submit" value="submit" class="btn btn-default">Submit</button>


</form>
</center>
 </div>
<%@include file="Shared/Footer.jsp" %>
</body>
</html>