import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
public class SaveProduct extends HttpServlet {
    Connection con; 
    PreparedStatement ps;
    
    @Override
    public void init(){
        String qr="insert into proddata values(?,?,?,?,?)";
        try{
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/new","root","root");
        ps=con.prepareStatement(qr);
        }catch(Exception e){}
    }
    @Override
    public void destroy(){
        try{
            con.close();
        }catch(Exception e){}
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //String s1=request.getParameter("t1");//pcode
        String s2=request.getParameter("t2");//pname
        String s3=request.getParameter("t3");//desc
        String s4=request.getParameter("t4");//catg
        String s5=request.getParameter("t5");//price
        try{
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery("select max(pcode) from proddata");
        rs.next();
        int n=rs.getInt(1);            
        if(n==0){
            n=111;
        }else{
            n=n+1;
        }
        ps.setInt(1, n);
        ps.setString(2, s2);
        ps.setString(3, s3);
        ps.setString(4, s4);
        ps.setInt(5, Integer.parseInt(s5));
        ps.executeUpdate();
        out.println("<h2>PRODUCT ADDED SUCCESSFULLY</h2>");
        out.println("<h3><a href=pentry.jsp>Add-More</a></h3>");
        out.println("<h3><a href=adminhome.jsp>Admin-Home</a></h3>");
        }catch(Exception e){
            out.println(e);
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
