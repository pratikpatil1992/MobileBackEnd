<%@ page isELIgnored="false" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Suppliers</title>
</head>
<body>
<jsp:include page="..\Shared\Header.jsp" />
<h2>  Manage Suppliers  </h2>    

<div id="CreateSupplier">

	<form action="manage_supplier_add" method="get">

		<input type="text" name="id" placeholder="ID"> 
		<input type="text" name="name" placeholder="Name">
		<input type="text" name="address" placeholder="Address">
		 <input type="submit" value="Create Supplier">
	</form>	
</div>	
<c:url var="saveUrl" value="/admin/Supplier" />
<div>
${msg}

	<form:form modelAttribute="supplier" method="POST" action="${saveUrl}">
 <table>
  <tr>
   <td><form:label path="id">Id:</form:label></td>
   <td><form:input path="id" /></td>
   <td></td>
  </tr>
  
  <tr>
   <td><form:label path="name">Name:</form:label></td>
   <td><form:input path="name"/></td>
   <td> 
   			<form:errors path="name" >
				<p class="errStyle">
						* should have atleast 3 characters
				</p>
 			</form:errors>
   </td>
  </tr>
 
  <tr>
   <td><form:label path="address">Address:</form:label></td>
   <td><form:input path="address"/></td>
   <td></td>
  </tr>
   
 </table> 
 <input type="submit" value="Edit" />

</form:form>
	
</div>	

	<h2> Delete / Update the Suppliers  </h2>
	<div id="ShowSuppliers">
	
		<table border="2">
		<thead>
		<tr>
		<td> Supplier ID</td>
		<td> Supplier Name</td>
		<td> Supplier Address </td>
		
		</tr>
		</thead>
		
	<c:forEach var="supplier" items="${supplierList}">
	
	<tr>  
	 <td> ${supplier.id} </td>
	  <td> ${supplier.name} </td>
	   <td> ${supplier.address} </td>
	   
	 <%--   <td> <a href="manage_supplier_delete/${supplier.id}"> Delete | </a>   
	   <a href="manage_supplier_edit/${supplier.id}"> Edit  </a>    </td> --%>
	   
	   <td>
	   
	  <td><a href="<c:url value='/manage_supplier_edit/${supplier.id}' />">Edit</a></td>
					
	  <td><a href="<c:url value='/manage_supplier_delete/${supplier.id}' />">Delete</a></td>
	
	</tr>
	</c:forEach>
	
	</table>
	
	</div>
<jsp:include page="..\Shared\Footer.jsp" />
</body>
</html>

