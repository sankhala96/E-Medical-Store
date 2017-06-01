<%@page import="java.util.ArrayList,java.sql.DriverManager,java.sql.Connection,java.sql.Statement,java.sql.ResultSet,java.sql.*" %>
<%        String s = request.getParameter("code");

    String qr = "select * from proddata where pcode=?";
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new", "root", "root");
        PreparedStatement ps = con.prepareStatement(qr);
        ps.setInt(1, Integer.parseInt(s));
        ResultSet rs = ps.executeQuery();
        rs.next();
        String s1 = rs.getString(1);
        String s2 = rs.getString(2);
        String s3 = rs.getString(3);
        String s4 = rs.getString(4);
        String s5 = rs.getString(5);
%>
<html>
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
        <h2>Product Details</h2>
        <table border=2>
            <tr>
                <td>PCode</td>
                <td><%=s1%></td>
            <tr>
            <tr>
                <td>Title</td>
                <td><%=s2%></td>
            <tr>
            <tr>
                <td>Desc</td>
                <td><%=s3%></td>
            <tr>
            <tr>
                <td>Catg</td>
                <td><%=s4%></td>
            <tr>
            <tr>
                <td>Price</td>
                <td><%=s5%></td>
            <tr>
        </table>
        <hr>
        <%out.println("<a href=CartManager?id=" + s1 + ">Add-To-Cart</a><br>");%>
        <a href=Explore.jsp>Buyer-Home</a><br>
        <a href=ShowCat.jsp>Category-Page</a><br>
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

