<%@page import="java.util.Random" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   int sum=(Integer)session.getAttribute("price"); 
   Random r = new Random();
   int z = r.nextInt(7);
%>
<html>
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
<style>
    #jumbo{
        background-color: black;
    }
    h1{
        text-align: center;
    }
</style>
    <body>
        <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="Explore.jsp">WebDispensary</a>
    </div>
    <ul class="nav navbar-nav">
      
      <li><a href="ShowCat.jsp">Go drug Shopping</a>
        
      </li>
      <li><a href="wemsearch.html">know your symptoms /Web consultation</a></li>
	<li><a href="doctorsercsh.html"> find a specialist</a></li>
    </ul>
    
  </div>
</nav>
        <img src="thank.png" width="100%">
        <div class="jumbotron">
            <center> <h1>Kudos your shipment is ready! </h1>
        <h2>Amount to be paid = <%=sum%> </h2>
        <h3>Shipment will be delivered to you by <%=z%> days from now</h3>
        <h3>Pay the amount to the delivery boy when shipment arrives to you</h3></center>
        </div>
    </body>
    <hr>
    <center><h3 style="text-align:center;"><a href="Explore.jsp">Buy more</a></h3>
    s<h3 style="text-align:center;"><a href="KillSession">Logout</a></h3></center>
<br>    
    <div class="jumbotron" id="jumbo">
<footer class="w3-green w3-padding-64 w3-center" id="about">

  <h1 style="color:white;">About</h1>

    <div class="row">
	<div class=col-sm-3>
	<h4 > About us</h4>
	<p> Web Dispensary is a e commerce website for drugs <br>, web consultation , articles , specialists<br>, so that you dont have to go out</p>
      </div>
    <div class="col-sm-3">
      <h4> Why Us?</h4>
      <p>	 we give drugs at subsidised prices<br> the articles are taken from real sources<br> and are risk free</p>
    </div>
    <div class="col-sm-3">
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
     <p>Powered By <a href="Explore.jsp" target="_blank" class="w3-hover-text-green">web dispensary</a></p>
</footer>
</html>
