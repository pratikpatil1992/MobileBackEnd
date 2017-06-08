 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
  
<nav class="navbar navbar-inverse bg-inverse">
<button class="navbar-toggler navbar-toggler-right" type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
 <span class="navbar-toggler-icon"></span>
</button>
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">The Mobile Store</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="<c:url value='/' />">Home</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Brands
        <span class="caret"></span></a>
        
        <ul class="dropdown-menu">
        
          <li>
          <c:forEach var="category" items="${categoryList}">
          
          <a href="<c:url value='/brands_view/${category.id}' />">${category.name}</a>
          </c:forEach>
          </li>
        </ul>
      </li>
      <li><a href="<c:url value='/Product'/>">Products</a></li>
      <li><a href="<c:url value='/Contact'/>">Contact</a></li>
      <li><a href="<c:url value='/AboutUs'/>">About Us</a></li>
      <c:if test="${empty LoggedInUser}">
      <li><a href="<c:url value='/Login'/>">Login</a></li>
      <li><a href="<c:url value='/Register'/>">Register</a></li>
      
      </c:if>
       <c:if test="${not empty LoggedInUser}">
       <c:if test="${isUser}">
       <li><a href="<c:url value='/Cart'/>">View Cart</a></li>
       </c:if>
      <li><a href="<c:url value='/j_spring_security_logout'/>">Logout</a></li>
    
      <c:if test="${isAdmin}">
      <li><a href="Admin">Admin</a></li>
      
      </c:if>
  
      <li><font size="3" color="white">Welcome ${LoggedInUser}</font></li>
   
        </c:if>
       
    </ul>
    <form class="navbar-form navbar-left" action="<c:url value='/search'/>">
      <div class="input-group">
        <input type="text" name="name" class="form-control" placeholder="Search">
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
        </div>
      </div>
    </form>
    </div>
  
</nav>
