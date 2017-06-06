<%@ page isELIgnored="false" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${product.name}</title>
</head>
<body>
<img height="500" width="300" src="<c:url value='/resources/Images/ProductImages/${product.imagepath}' /> "/>

<c:if test="${isUser}">

	  <a href="<c:url value='/add_to_cart/${product.id}' />">Add To Cart</a>
</c:if>
</body>
</html>