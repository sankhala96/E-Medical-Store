import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SSI_2
 */
public class VerifyUser extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //t1=aaa&t2=bbb&t3=buyer
        String s1=request.getParameter("t1");
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
                    HttpSession session=request.getSession();
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
        
        
        
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
