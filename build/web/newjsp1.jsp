<%@page import="java.sql.DriverManager,javax.servlet.http.HttpServlet,java.sql.*" %>
<%String s1=request.getParameter("t1");
        String s2=request.getParameter("t2");
        String s3=request.getParameter("t3");
        if(s3.equals("buyer")){
            String qr="select uname from userdata where userid=? and password=?";
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/new","root","root");
                PreparedStatement ps=con.prepareStatement(qr);
                ps.setString(1,s1);
                ps.setString(2,s2);
                ResultSet rs=ps.executeQuery();
                boolean b=rs.next();
                if(b){
                    //storing userid to session object
                    session=request.getSession();
                    session.setAttribute("user", s1);
                    
                    
                    
                    String op=request.getParameter("c1");
                    if(op!=null){
                        Cookie ck1=new Cookie("uid",s1);
                        Cookie ck2=new Cookie("pw", s2);
                        ck1.setMaxAge(60*60*24*7);
                        ck2.setMaxAge(60*60*24*7);
                        response.addCookie(ck1);
                        response.addCookie(ck2);
                    }
                    
                    
                    response.sendRedirect("Explore.jsp");
                }else{
                    out.println("INVALID BUYER ACCOUNT");
                }
                con.close();
            }catch(Exception e){
                out.println(e);
            }
            
            
            
        }else{
            if(s1.equals("admin") && s2.equals("admin")){
               response.sendRedirect("adminhome.jsp");
            }else{
                out.println("INVALID ADMIN ACCOUNT");
            }
        }
        %>