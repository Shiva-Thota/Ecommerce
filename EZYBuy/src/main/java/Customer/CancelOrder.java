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
 * Servlet implementation class CancelOrder
 */
public class CancelOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productId=request.getParameter("cardId");
		String qty1=request.getParameter("qty");
	 

		HttpSession session=request.getSession(false);
		String phoneNumber=(String) session.getAttribute("phoneNumber");
		
		try(Connection con=BasicDataSourceEx.getConnection()){
			int qty=Integer.parseInt(qty1);
			 
			 PreparedStatement ps=con.prepareStatement("delete from ordertable where phoneNumber=? and productId=?;");
			 ps.setString(1, phoneNumber);
			 ps.setString(2, productId);
			 ps.execute();
			 PreparedStatement ps1=con.prepareStatement("update productDetails set noOfProducts=noOfProducts+?;");
			 ps1.setInt(1, qty);
			 ps1.execute();
			 
				request.setAttribute("Cancel_Order", productId);
				 RequestDispatcher rd = request.getRequestDispatcher("output.jsp");
				  rd.forward(request, response);
			 
		}catch( Exception e) {
			System.out.println(e);
		}
		
	}

}
