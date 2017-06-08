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
<c:if test="${not empty cartList}"> 
<div id="ShowCart" class="table-responsive">
	
		<table class="table">
		<thead>
		<tr>
		<td align="center">Name</td>
		<td align="center">Price</td>
		</tr>
		</thead>
		
	 <c:forEach var="cart" items="${cartList}">
	
	 <tr> 
	 <td align="center"> ${cart.product_Name} </td>
	 <td align="center"> ${cart.price} </td>
	 <td align="center"><a href="<c:url value='/cart_delete/${cart.id}' />">Delete</a></td>
	</tr>
	</c:forEach>
	<tr>
	<td></td>
	<td align="center"><b>Total<b></b></td>
	<td align="center"><b>${total}</b></td>
	</tr>
	</table>
	</div>
	<h3 align="center"><a href="<c:url value='/Checkout/' />">Checkout</a></h3>
</c:if>
<c:if test="${empty cartList}">
<h2>No items in cart</h2>
</c:if>
<%@include file="Shared/Footer.jsp" %>
</body>
</html>