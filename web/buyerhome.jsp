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

<html>
    <body>
        <h1>Hello <%=s%></h1>
        <h4>Items In Cart <%=size%></h4>
        <hr>
        <a href="ShowCat.jsp">Explore-Store</a><br>
        <a href="search.jsp">Search-Product</a><br>
        <a href="DispCart">View-Cart</a><br>
        <a href="KillSession">Logout</a><br>
        <hr>
    </body>
</html>
