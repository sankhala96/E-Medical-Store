<%@page import="java.util.ArrayList"%>
<%
    int val=session.getMaxInactiveInterval();
    long v=session.getCreationTime();
    java.util.Date dt=new java.util.Date(v);
    String s=(String) session.getAttribute("user");
    if(s==null){
        response.sendRedirect("index.jsp");
    }
    ArrayList list=(ArrayList)session.getAttribute("cart");
    int size=0;
    if(list!=null){
        size=list.size();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Online-Medical</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="C:\Users\Chirag Farkya\Desktop\New folder\jquery-3.2.1"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
</head>


<body>
    <style>    
    #jumbo{
		background-color: palegoldenrod;
		
}
#jumb{
        background-color: black;
}
    </style>
    <h1 align="center">Hello <%=s%></h1>
        <a href="DispCart.jsp"><h2>Items In Cart <%=size%></h2></a>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebDispensary</a>
    </div>
    <ul class="nav navbar-nav">
      
      <li><a href="ShowCat.jsp">Go drug Shopping</a>
        
      </li>
      <li><a href="wemsearch.html">Explore your Illness</a></li>
	<li><a href="doctorsercsh.html">Your Specialist</a></li>
    </ul>
    
  </div>
</nav>
  
        <style>
.mySlides {display:none;}
</style>
<div class="w3-content w3-section" style="max-width:1400px">
  <img class="mySlides" src="a8.jpg" style="width:100%">
  <img class="mySlides" src="a4.jpg" style="width:100%">
  <img class="mySlides" src="a2.jpeg" style="width:100%">
</div>

<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1;}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>
<br>

<div class="container">
  <div class="jumbotron" id="jumb">
    <p style="background-color:powderblue;"> Featured articles from around the world</p>      
<ul>
<div class="row">
         <div class="col-sm-6">
         <li><a href="#">
  	<img src="a4.jpg" class="img-responsive" alt="HTML tutorial" style="width:80px;height:80px;border:0"> <u> Gut Bacteria Linked to Chronic Fatigue Syndrome?"</a></li>
	</div>

        <div class="col-sm-6">
        <li><a href="#"><img src="virus.jpg" class="img-responsive" alt="HTML tutorial" style="width:80px;height:80px;border:3px"><u>More Cases of Tick-Borne Powassan Virus Expected"</a></li>
        </div>
</div>
<div class="row">
    <div class="col-sm-6">
      <li><a href="#"><img src="tattoo.jpg" class="img-responsive" alt="HTML tutorial" style="width:80px;height:80px;border:3px"><u>FDA Warns of Tattoo Dangers"</a></li>
    </div>
    <div class="col-sm-6">
      <li><a href="#"><img src="walking.jpg" class="img-responsive" alt="HTML tutorial" style="width:80px;height:80px;border:3px"><u>Walking vs. Running: Which Is Better?"</a></li>
    </div>
</div>
<div class="row">
    <div class="col-sm-8">
      
<li><a href="#"><img src="a8.jpg" class="img-responsive" alt="HTML tutorial" style="width:80px;height:80px;border:3px"><u>Red Wine Antioxidant May Be Good for Diabetes"</a></li>
 </div>
</div>
<div class="container text-center">    
  <h3 style="background-color:powderblue;">Suggestions Daily</h3><br>
  <div class="row">
    <div class="col-sm-4">
      <a href="#"><img src="hairloss.jpg" class="img-responsive" style="width:100%" alt="Image">
      <p><u>EAsy ways to treat hairfall</p>
    </a></div>
    <div class="col-sm-4"> 
      <a href="#"><img src="backpain.jpg" class="img-responsive" style="width:100%" alt="Image">
      <p><u>Back pain can be treated naturaally</p>    </a>
    </div>
    <div class="col-sm-4">
      <div class="well">
<a href="#" target="_blank">Doctors on strike!</a> 
       <p>trending in india</p>
      </div>
      <div class="well">
<a href="#" target="_blank">Doctors not qualified!</a> 
       <p>trending in world</p>
      </div>
    </div>
  </div>
</div><br>
<!-- Footer / About Section -->
<footer class="w3-green w3-padding-64 w3-center" id="about">
<div class="jumbotron" id="jumbo">
  <h2 stle="text-align=:center;">About</h2>
  
    <div class="row">
	<div class=col-sm-4>
            <h4>About us</h4>
            <p> Web Dispensary is a e commerce website for drugs <br>, web consultation , articles , specialists<br>, so that you dont have to go out</p>
      </div>
    <div class="col-sm-4">
      <h4> Why Us?</h4>
      <p>	 we give drugs at subsidised prices<br> the articles are taken from real sources<br> and are risk free</p>
    </div>
    <div class="col-sm-4">
      <h4> Useful links</h4>
<p>
<ul>
	<li> our shop </li>
	<li>gift cards</li>
	<li>parteners</li>
	<li>help</li>
</p>   
</ul>
 </div>

</div>
     <p>Powered By <a href="#" target="_blank" class="w3-hover-text-green">web dispensary</a></p>
</footer>

</body>
</html> 


