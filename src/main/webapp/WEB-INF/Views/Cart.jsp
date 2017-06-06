<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
</head>
<body>
<%@include file="Shared/Header.jsp" %>
<div id="ShowCart">
	
		<table border="2">
		<thead>
		<tr>
		<td>Name</td>
		<td>Price</td>
		</tr>
		</thead>
		
	 <c:forEach var="cart" items="${cartList}">
	
	 <tr> 
	 <td> ${cart.product_Name} </td>
	 <td> ${cart.price} </td>
	 <td><a href="<c:url value='/cart_delete/${cart.id}' />">Delete</a></td>
	</tr>
	</c:forEach>
	<tr>
	<td></td>
	<td>Total</td>
	<td>${total}</td>
	</tr>
	</table>
	</div>
	<h3><a href="<c:url value='/Checkout/' />">Checkout</a></h3>

<%@include file="Shared/Footer.jsp" %>
</body>
</html>