package Customer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import connectionpool.BasicDataSourceEx;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class AddToCart
 */
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productId=request.getParameter("productId");
		String SelectedColour=request.getParameter("color");
		String SelectSize=request.getParameter("size");
		byte[] image1=null;
		String buyNow=request.getParameter("buyNow");
		String Namee=null;
		String qty=request.getParameter("quantity");
		int cost=0;
		
		HttpSession session=request.getSession(false);
		String phoneNumber=(String) session.getAttribute("phoneNumber");
		
		if(phoneNumber==null) {
			RequestDispatcher rd1=request.getRequestDispatcher("Login.jsp");
			rd1.forward(request, response);
		}else {
			String sellerId=null;
			String image=null;
			try(Connection con=BasicDataSourceEx.getConnection()){
				
				 
				 PreparedStatement ps2=con.prepareStatement("select image1,Namee,cost,sellerId from productDetails where productId=?;");
				 ps2.setString(1, productId);
				 ResultSet rs2=ps2.executeQuery();
				 while(rs2.next()) {
					 image1 = rs2.getBytes("image1");
					 image = Base64.getEncoder().encodeToString(image1);
					 cost=rs2.getInt("cost");
					 Namee=rs2.getString("namee");
					 sellerId=rs2.getString("sellerId");
				 } 
				
				 PreparedStatement ps8=con.prepareStatement(" insert into AddCart(phoneNumber,productId,Sizee,colourr,image,namee,cost,NoOfProducts) values(?,?,?,?,?,?,?,?);");
				 ps8.setString(1, phoneNumber);
				 ps8.setString(2, productId);
				 ps8.setString(3, SelectSize);
				 ps8.setString(4, SelectedColour);
				 ps8.setString(5, image);
				 ps8.setString(6, Namee);
				 ps8.setInt(7, cost);
				 ps8.setString(8, qty);
				 ps8.execute();
				 ps8.close();
				 RequestDispatcher rd = request.getRequestDispatcher("viewCartOrder.jsp");
				  rd.forward(request, response);
				 
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	}

}
