<%@page import="java.sql.DriverManager,javax.servlet.http.HttpServlet,java.sql.*" %>
<%
    response.setContentType("text/html;charset=UTF-8");
    String s = request.getParameter("cat");
    Cookie ck = new Cookie("userchoice", s);
    ck.setMaxAge(60 * 60 * 24 * 7);
    response.addCookie(ck);
    String qr = "select pcode,pname,pcat from proddata where pcat=?";
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new", "root", "root");
        PreparedStatement ps = con.prepareStatement(qr);
        ps.setString(1, s);
        ResultSet rs = ps.executeQuery();
        rs.next();
        String s9 = rs.getString(3);
        rs.previous();
%>       

<!DOCTYPE html>
<head>
    <title>Web-Dispensary</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>


<body>
    
    <style>
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
   
    
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    footer {
      background-color: black;
      color: white;
      padding: 15px;
    }
    
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }

    .container-fluid{
      height: auto;

    }

    #heading{
      font-family:Arial;
      font-size: 35px;
    }

    .line-through{
      text-decoration: line-through;
    }

    .caption{
      font-size: 18px;
    }

    .checkout{
      background-color: black;
      padding: 5px 20px ;
    }
    
    .checkout-title{
      color:white;
    }
ul.products li {
    width: 200px;
    display: inline-block;
    vertical-align: top;
    *display: inline;
    *zoom: 1;
}

#jumbo{
	background-color:black;
}

    
    
  </style>
  <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebDispensary</a>
    </div>
    <ul class="nav navbar-nav">
      
      <li><a href="ShowCat.jsp">Go drug Shopping</a>
        
      </li>
      <li><a href="wemsearch.html">know your symptoms /Web consultation</a></li>
	<li><a href="doctorsercsh.html"> find a specialist</a></li>
    </ul>
    
  </div>
</nav>
  <hr>
    <div>
        <center><span id="heading"><%=s9%></span></center><br><br>
    </div>
    <hr>
    
  
    <ul class="products">
    <li>
       
        
        
        
                        <%
                          int i=0;
                                while(rs.next()){
                                    
                                  
                                    String s1 = rs.getString(1);//pcode
                                    String s2 = rs.getString(2);//pname
                            %>
                            
                              <% out.println("<a href=ShowDetails.jsp?code=" + s1 + ">");%><% out.println("\t\t\t\t"); %>
                               <%out.println(s2);%>
                                
                             <img src="tablet.jpg" alt="" width = "150" height="170">
                             
                          <%out.println("</a>");i++; %>
                       
                          <%
        if(i==4)
        {
            i=0; 
            %>  
            <br><br>
            <% }%>
                    
 
                          
    </li>
         
                                   
            
            
            
                               
                           
                   
           
    
            <%
                }
            %>
    </ul>
   
  
            <hr>
           
            <div> <center><span id="heading"> <a href=Explore.jsp>Buyer-Home</a></span></center><br>
                <center><span id="heading"><a href=ShowCat.jsp>Category-Page</a></span></center><br><br></div>
            
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
	
	</ul>
 	</div>

</div>
     <p style="text-align:center;">Powered By <a href="#" target="_blank" class="w3-hover-text-green">web dispensary</a></p>
</div>
</footer>
            </body>
            
            </html>

            <%
                } catch (Exception e) {
                    out.println(e);
                }
            %>