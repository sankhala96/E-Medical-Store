<%@page import="java.sql.DriverManager,javax.servlet.http.HttpServlet,java.sql.*" %>
<%     
    response.setContentType("text/html;charset=UTF-8");
        //fetching userid from session
        session=request.getSession();
        String user=(String)session.getAttribute("user");
        
        if(user==null){
            response.sendRedirect("index.jsp");
        }
        
        String qr="select distinct pcat from proddata pcode";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/new","root","root");
            PreparedStatement ps=con.prepareStatement(qr);
            ResultSet rs=ps.executeQuery();
            String choice=" All ";
            
            Cookie ck[]=request.getCookies();
            for(int i=0; i<ck.length; i++){
                String name=ck[i].getName();
                if(name.equals("userchoice")){
                    choice=ck[i].getValue();
                    break;
                }
            }
            %>
            
          <html>
              <head><title>Product Categories</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="C:\Users\Chirag Farkya\Desktop\New folder\jquery-3.2.1"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script></head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $("img").click(function(){
        alert("click on the navbar to explore the store!");
    });
});
</script>

              <body>
          <marquee>Attractive Offers On <%=choice%> product</marquee>
          <h2>Welcome <%=user%>
          <hr>
          <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebDispensary</a>
    </div>
    <ul class="nav navbar-nav">  
        <li class="active"><a href="Explore.jsp">home</a></li>
          <%
            while(rs.next()){
                String s=rs.getString(1);
          %>
          
        <li><a href=ShowItems.jsp?cat=<%=s%>><%=s%><span class="caret"></span></a>
      </li>
             
            <%   
            }
            %>
                  
	</ul>
  </div>
</nav>
<style>
   
#jumbo{
	background-color:black;
}

.mySlides {display:none;}
</style>

<body>

  <!-- Photo Grid -->
  <div class="w3-row">
    <div class="w3-half">
      <img src="b1.jpg" style="width:50%">
      <img src="b2.jpg" style="width:50%">
      <img src="b4.jpg" style="width:50%">
    </div>

    <div class="w3-half">
      <img src="b5.jpg" style="width:50%">
      <img src="b3.jpg" style="width:100%">
	      <img src="b11.jpg" style="width:50%">

    </div>
  </div><br><br><br>

<style>
h4{
	color:yellow;
}
	.jumbo{
			background-color:navy-blue;
}
	.jumbotron{
		background-color:black;
		
}
p{
	color:white;
}
</style>	


<h3 style="color:blue;"> ------------------------------------------------<strong><u>FEATURED CATEGORIES</strong>------------------------------------------------------</h3>
<div class="jumbotron" id="jumbotron">

	<div class="row">
		<div class=col-sm-2>
		</div>
		<div class=col-sm-2>
			<a href="#"><img src="b6.jpg" style="width:100%" class="img-circle">
				<p style="text-align:center;"> Medicines  </p></a>
		</div>
		<div class=col-sm-2>
			<a href="#"><img src="b7.png" style="width:100%" class="img-circle">
				<p style="text-align:center;"> Grooming </p></a>
		</div>
		<div class=col-sm-2>
			<a href="#"><img src="b8.jpeg" style="width:100%" class="img-circle">
				<p style="text-align:center;">   Proteins  </p></a>
		</div>
		<div class=col-sm-2>
			<a href="#"><img src="b10.jpg" style="width:100%" class="img-circle">
				<p style="text-align:center;"> Healthcare  </p></a>
		</div>
		<div class=col-sm-2>
		</div>
	</div>		
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
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>


            <hr>
            <a href=Explore.jsp>Buyer-Home</a><br>
            
            <footer class="w3-green w3-padding-64 w3-center" id="about">
<div class="jumbotron" id="jumbo">
  <h2 style="text-align:center;">About</h2>
  
    <div class="row">
  	<div class=col-sm-3>
  	<h4 > About us</h4>
  	<p> Web Dispensary is a e-commerce website for drugs <br>, web consultation , articles , specialists<br>, so that you dont have to go out</p>
        </div>
        <div class="col-sm-3">
        <h4> Why Us?</h4>
        <p>  we give drugs at subsidised prices<br> the articles are taken from real sources<br> and are risk free</p>
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
     <p style="text-align:center;">Powered By <a href="#" target="_blank" class="w3-hover-text-green">web dispensary</a></p>
</div>
</footer>

           </body>
           </html>
           <%   
            
        }catch(Exception e){
            out.println(e);
        }
     
%>
   