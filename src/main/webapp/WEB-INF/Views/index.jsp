
<html>
<head>
<title>Pratik Patil</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 
</head>
<body>
<%@include file="Shared/Header.jsp"%>

<div class="container">
  <br>
  <div id="myCarousel"  class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="resources/Images/Home/moto g2.bmp" alt="Moto G2" width="400" height="300"/>
      </div>

      <div class="item">
        <img src="resources/Images/Home/moto g3.bmp" alt="Moto G3" width="400" height="300"/>
      </div>
    
      <div class="item">
        <img src="resources/Images/Home/moto g5.bmp" alt="Moto G5" width="400" height="300"/>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<div>
</div>
<div>
<%@include file="Shared/Footer.jsp" %>
</div>
</body>
</html>
