package Customer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import connectionpool.BasicDataSourceEx;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class RemoveFromCart
 */
public class RemoveFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productId=request.getParameter("cardId");
		HttpSession session=request.getSession(false);
		String phoneNumber=(String) session.getAttribute("phoneNumber");
		
		try(Connection con=BasicDataSourceEx.getConnection()){
			 PreparedStatement ps=con.prepareStatement("delete from AddCart where phoneNumber=? and productId=?;");
			 ps.setString(1, phoneNumber);
			 ps.setString(2, productId);
			 ps.execute();
			 
			
				 RequestDispatcher rd = request.getRequestDispatcher("viewCartOrder.jsp");
				  rd.forward(request, response);
			 
		}catch( Exception e) {
			System.out.println(e);
		}
	}

}
