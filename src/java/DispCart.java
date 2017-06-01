import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DispCart extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();
        ArrayList list=(ArrayList) session.getAttribute("cart");
        out.println("<html>");
        out.println("<body>");
        out.println("<form action=RemoveItems>");
        out.println("<h3>Your Cart</h3>");
        out.println("<table border=2>");
        out.println("<tr>");
        out.println("<td>PCode</td><td>PName</td><td>PDesc</td><td>Catg</td><td>Price</td><td>Remove</td><td>RemChkd</td>");
        out.println("<tr>");
        String qr="select * from proddata where pcode IN (";
        for(int i=0; i<list.size(); i++){
            String s=(String)list.get(i);
            qr=qr+s+",";
        }
        qr=qr.substring(0,qr.length()-1);
        qr=qr+")";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/new","root","root");
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery(qr);
            int sum=0;
            while(rs.next()){
                String s1=rs.getString(1);
                String s2=rs.getString(2);
                String s3=rs.getString(3);
                String s4=rs.getString(4);
                String s5=rs.getString(5);
                sum=sum+Integer.parseInt(s5);
                out.println("<tr>");
                out.println("<td>"+s1+"</td>");
                out.println("<td>"+s2+"</td>");
                out.println("<td>"+s3+"</td>");
                out.println("<td>"+s4+"</td>");
                out.println("<td align=right>"+s5+"</td>");
                out.println("<td align=center><a href=RemoveItem?id="+s1+">[X]</a></td>");
                out.println("<td align=center><input type=checkbox name=c1 value="+s1+"></td>");
                out.println("</tr>");
            }
            out.println("<tr>");
            out.println("<td></td><td></td><td></td>");
            out.println("<td>Total</td>");
            out.println("<td align=right>"+sum+"</td>");
            out.println("<td></td>");
            out.println("<td><input type=submit value=Remove></td>");
            out.println("</tr>");
            out.println("</table>");
            out.println("</form>");
            session.setAttribute("price",sum);
            
            
            con.close();
        }catch(Exception e){}
        
        out.println("<hr>");
        out.println("<a href=ShowCat.jsp>Buy-More</a><br>");
        out.println("<a href=buyerhome.jsp>Home</a><br>");
        out.println("<hr>");
        out.println("<a href=cod.jsp><h3>check-out</h3></a>");
        out.println("<hr>");
        out.println("</body>");
        out.println("</html>");
        
        
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
