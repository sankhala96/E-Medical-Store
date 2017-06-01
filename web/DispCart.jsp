<%@page import="java.util.ArrayList,java.sql.DriverManager,java.sql.Connection,java.sql.Statement,java.sql.ResultSet" %>


<% ArrayList list = (ArrayList) session.getAttribute("cart");%>

<html>
    <head>
        <title>Web Dispensary</title>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <body>
        <style>
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

        <form action=RemoveItems>
            <h3>Your Cart</h3>
            <table border=2>
                <tr>
                    <td>PCode</td><td>PName</td><td>PDesc</td><td>Catg</td><td>Price</td><td>Remove</td><td>RemChkd</td>
                <tr>
                    <%
                        String qr = "select * from proddata where pcode IN (";
                        for (int i = 0; i < list.size(); i++) {
                            String s = (String) list.get(i);
                            qr = qr + s + ",";
                        }
                        qr = qr.substring(0, qr.length() - 1);
                        qr = qr + ")";
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new", "root", "root");
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery(qr);
                            int sum = 0;
                            while (rs.next()) {
                                String s1 = rs.getString(1);
                                String s2 = rs.getString(2);
                                String s3 = rs.getString(3);
                                String s4 = rs.getString(4);
                                String s5 = rs.getString(5);
                                sum = sum + Integer.parseInt(s5);
                    %>
                <tr>
                    <td><%=s1%></td>
                    <td><%=s2%></td>
                    <td><%=s3%></td>
                    <td><%=s4%></td>
                    <td align=right><%=s5%></td>
                   <td align=center><a href=RemoveItem?id=<%=s1%>>[X]</a></td>
                   <td align=center><input type=checkbox name=c1 value=<%=s1%>></td>
                </tr>
                <%    }%>
                <tr>
                    <td></td><td></td><td></td>
                    <td>Total</td>
                    <td align=right><%=sum%></td>
                    <td></td>
                    <td><input type=submit value=Remove></td>
                </tr>
            </table>
        </form>
        <% session.setAttribute("price", sum);

                con.close();
            } catch (Exception e) {
            }
        %>
        <hr>
        <a href=ShowCat.jsp>Buy-More</a><br>
        <a href=buyerhome.jsp>Home</a><br>
        <hr>
        <a href=cod.jsp><h3>check-out</h3></a>
        <hr>
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




