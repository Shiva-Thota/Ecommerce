package Customer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import connectionpool.BasicDataSourceEx;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class setStatus
 */
public class setStatus extends HttpServlet {
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderId=request.getParameter("button");
		try(Connection con=BasicDataSourceEx.getConnection()){
			 PreparedStatement ps3=con.prepareStatement("update ordertable set orderStatus=? where orderId=?;");
			 ps3.setString(1, "leaved Wearhouse");
			 ps3.setString(2, orderId);
			 ps3.execute();
			RequestDispatcher rd = request.getRequestDispatcher("SellerOrderList.jsp");
			  rd.forward(request, response);
		}catch(Exception e){
			System.out.println(e);
		}
	}

}
