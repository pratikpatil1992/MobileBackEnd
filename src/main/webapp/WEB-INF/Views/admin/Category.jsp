<%@ page isELIgnored="false" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Categories</title>
</head>
<body>
<jsp:include page="..\Shared\Header.jsp" />
<h2>  Manage Categories  </h2>    
<c:if test="${empty isEdit}">
<div id="CreateCategory">

	<form action="manage_category_add" method="get">

		<input type="text" name="id" placeholder="ID"> 
		<input type="text" name="name" placeholder="Name">
		<input type="text" name="description" placeholder="Description">
		 <input type="submit" value="Create Category">
	</form>	
</div>	
</c:if>
<c:url var="saveUrl" value="/admin/Category" />

<div class="table-responsive">
${msg}

	<form:form modelAttribute="category" method="POST" action="${saveUrl}">
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
				</p>
 			</form:errors>
   </td>
  </tr>
 
  <tr>
   <td><form:label path="description">Description:</form:label></td>
   <td><form:input path="description"/></td>
   <td></td>
  </tr>
   
 </table> 
 <input type="submit" value="Edit" />

</form:form>
	
</div>	
<
	<h2> Delete / Update the Categories  </h2>
	<div id="ShowCategories" class="table-responsive">
	
		<table class="table">
		<thead>
		<tr>
		<td align="center"> Category ID</td>
		<td align="center"> Category Name</td>
		<td align="center"> Category Description </td>
		
		</tr>
		</thead>
		
	<c:forEach var="category" items="${categoryList}">
	
	<tr>  
	 <td align="center"> ${category.id} </td>
	  <td align="center"> ${category.name} </td>
	   <td align="center"> ${category.description} </td>
	   
	 <%--   <td> <a href="manage_category_delete/${category.id}"> Delete | </a>   
	   <a href="manage_category_edit/${category.id}"> Edit  </a>    </td> --%>
	   
	   <td>
	   
	  <td align="center"><a href="<c:url value='/manage_category_edit/${category.id}' />">Edit</a></td>
					
	  <td align="center"><a href="<c:url value='/manage_category_delete/${category.id}' />">Delete</a></td>
	
	</tr>
	</c:forEach>
	
	</table>
	
	</div>
	
<jsp:include page="..\Shared\Footer.jsp" />
</body>
</html>

