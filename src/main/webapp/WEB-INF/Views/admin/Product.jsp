<%@ page isELIgnored="false" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Products</title>
</head>
<body">
<jsp:include page="..\Shared\Header.jsp" />
<c:if test="${isAdmin}"><h2>  Manage Products  </h2>   </c:if>
<c:if test="${empty isEditing}">	
		<c:url var="saveUrl" value="/admin/Product" />
</c:if>

<c:if test="${not empty isEditing}">	
		<c:url var="saveUrl" value="/admin/editProduct" />
</c:if>
<div id="UpdateProduct" class="table-responsive">
${msg}
<c:if test="${isAdmin}">
<form:form  modelAttribute="product" enctype="multipart/form-data" method="POST" action="${saveUrl}">
 <table class="table">
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
				</p>s
 			</form:errors>
   </td>
  </tr>
 
  <tr>
   <td><form:label path="description">Description:</form:label></td>
   <td><form:input path="description"/></td>
   <td></td>
  </tr>
  
  <tr>
   <td><form:label path="price">Price:</form:label></td>
   <td><form:input path="price"/></td>
   <td></td>
  </tr>
  
  <tr>
   <td><form:label path="category_id">Category Id:</form:label></td>
   <td>   
   <form:select path="category_id">
   
   
   <c:forEach var="category" items="${categoryList}">
   <form:option value="${category.id}"> ${category.name} </form:option>
   </c:forEach>
   </form:select>
   
   <tr>
   <td><form:label path="supplier_id">Supplier Id:</form:label></td>
   <td>   
   <form:select path="supplier_id">
       <c:forEach var="supplier" items="${supplierList}">
   <form:option value="${supplier.id}"> ${supplier.name} </form:option>
   </c:forEach>
   </form:select>
   </td>
   <td></td>
  </tr>
  
   <tr>
   <td><form:label path="file">Image File:</form:label></td>
   <td><form:input type="file" path="file"/></td>
   <td></td>
  </tr>
  
   <tr>
   <td colspan="5">

 <c:if test="${not empty isEditing}">
 <input type="submit" value="Update" />
 </c:if>
 <c:if test="${empty isEditing}">
 <input type="submit" value="Add" />
 </c:if>
 </td>
 </table> 
</form:form>
</c:if>
</div>	

	<c:if test="${isAdmin}"><h2> Delete / Update the Products  </h2></c:if>
	<div id="ShowProducts" class="table-responsive">
	
		<table class="table">
		<thead>
		<tr>
		<td></td>
		<c:if test="${isAdmin}">
		<td> Product ID</td>
		</c:if>
		<td align="center"> Product Name</td>
		<td align="center"> Product Description</td>
		<td align="center"> Price</td>
		<c:if test="${isAdmin}">
		<td align="center"> Category ID </td>
		<td align="center"> Supplier ID </td>
		</c:if>
		</tr>
		</thead>
		
	 <c:forEach var="product" items="${productList}">
	
	 <tr> 
	 <td>  <img height="100" width="100" src="<c:url value='/resources/Images/ProductImages/${product.imagepath}' /> "/></td> 
	 <c:if test="${isAdmin}">
	 <td align="center"> ${product.id} </td>
	 </c:if>
	 <td align="center"> ${product.name} </td>
	 <td align="center"> ${product.description} </td>
	 <td align="center"> ${product.price} </td>
	 <c:if test="${isAdmin}">
	 <td align="center"> ${product.category_id} </td>
	 <td align="center"> ${product.supplier_id} </td>
	  </c:if> 
	 <%--   <td> <a href="manage_product_delete/${product.id}"> Delete | </a>   
	   <a href="manage_product_edit/${product.id}"> Edit  </a>    </td> --%>
	   
	   <td>
<c:if test="${isAdmin}">	
   
	  <td align="center"><a href="<c:url value='/manage_product_edit/${product.id}' />">Edit</a></td>
					
	  <td align="center"><a href="<c:url value='/manage_product_delete/${product.id}' />">Delete</a></td>
</c:if>

	  <td align="center"><a href="<c:url value='/product_view/${product.id}' />">View</a></td>
<c:if test="${isUser}">
	  <td align="center"><a href="<c:url value='/add_to_cart/${product.id}' />">Add To Cart</a></td>
</c:if>
	</tr>

	</c:forEach>
	
	</table>
	
	</div>
<jsp:include page="..\Shared\Footer.jsp" />
</body>
</html>