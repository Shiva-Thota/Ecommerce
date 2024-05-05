package Product;

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
 * Servlet implementation class changeProductDetails
 */
public class changeProductDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		
		String productId=request.getParameter("productId");

		HttpSession session=request.getSession(false);
		String phoneNumber=(String) session.getAttribute("phoneNumber");
		String SellerphoneNumber=(String) session.getAttribute("SellerphoneNumber");


				String removeProduct=request.getParameter("remove");
				String Add=request.getParameter("Add");
				String Price=request.getParameter("Price");
				
				
				try(Connection con=BasicDataSourceEx.getConnection()){
					if(removeProduct!=null) {
					 
					 if(phoneNumber!=null && phoneNumber.equalsIgnoreCase("Admin")) {
						 
						 PreparedStatement ps3=con.prepareStatement("delete from productDetails where productId=?;");
						 ps3.setString(1, productId);
						 ps3.executeUpdate();
						 RequestDispatcher rd1=request.getRequestDispatcher("AllProducts.jsp");
						rd1.forward(request, response);
					 }else {
						 RequestDispatcher rd = request.getRequestDispatcher("AllProducts.jsp");
						  rd.forward(request, response);
					 }
					 
					 if(SellerphoneNumber!=null){
						 PreparedStatement ps2=con.prepareStatement("delete from productDetails where productId=? And sellerId=?;");
						 ps2.setString(1, productId);
						 ps2.setString(2, SellerphoneNumber);
						 ps2.executeUpdate();
						 
						 RequestDispatcher rd = request.getRequestDispatcher("Output.jsp");
						 request.setAttribute("Remove_Product",productId);
						  rd.forward(request, response);
					 }
					}
					if(Add!=null){
						String productqty=request.getParameter("productqty");
						
						 PreparedStatement ps3=con.prepareStatement("update productDetails set noOfProducts=noOfProducts+? where productId=? And sellerId=?;");
						 ps3.setString(1, productqty);
						 ps3.setString(2, productId);
						 ps3.setString(3, SellerphoneNumber);
						 ps3.executeUpdate();
						 
						 RequestDispatcher rd = request.getRequestDispatcher("sellerProducts.jsp");
						  rd.forward(request, response);
					} 
					if(Price!=null){
						String productPrice=request.getParameter("productPrice");
						 PreparedStatement ps3=con.prepareStatement("update productDetails set cost=? where productId=?  And sellerId=?;");
						 ps3.setString(1, productPrice);
						 ps3.setString(2, productId);
						 ps3.setString(3, SellerphoneNumber);
						 ps3.executeUpdate();
						 RequestDispatcher rd = request.getRequestDispatcher("sellerProducts.jsp");
						  rd.forward(request, response);
					}
					
				
				}catch( Exception e) {
					System.out.println(e);
		}
				
	}
		
}


