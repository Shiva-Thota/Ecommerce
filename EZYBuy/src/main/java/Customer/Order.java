package Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import connectionpool.BasicDataSourceEx;

/**
 * Servlet implementation class Order
 */
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productId=request.getParameter("productId");
		String SelectedColour=request.getParameter("color");
		String SelectSize=request.getParameter("size");
		byte[] image1=null;
		String buyNow=request.getParameter("buyNow");
		String Namee=null;
		String address=request.getParameter("address");
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
			int NoOfProducts = 0;
			try(Connection con=BasicDataSourceEx.getConnection()){
				
				 PreparedStatement ps2=con.prepareStatement("select NoOfProducts,image1,Namee,cost,sellerId from productDetails where productId=?;");
				 ps2.setString(1, productId);
				 ResultSet rs2=ps2.executeQuery();
				 while(rs2.next()) {
					 NoOfProducts=rs2.getInt("noOfProducts");
					 image1 = rs2.getBytes("image1");
					 image = Base64.getEncoder().encodeToString(image1);
					 cost=rs2.getInt("cost");
					 Namee=rs2.getString("namee");
					 sellerId=rs2.getString("sellerId");
				 } 
				
				 int qty1=Integer.parseInt(qty);
					if(NoOfProducts>qty1) {
						
						 int leftproducts=NoOfProducts-qty1;
						 String NoOfProduct=String.valueOf(leftproducts);
						 PreparedStatement ps3=con.prepareStatement("update productDetails set noOfProducts=? where productId=?;");
						 ps3.setString(1, NoOfProduct);
						 ps3.setString(2, productId);
						 ps3.execute();
						
						 
						 
						 int totalcost=qty1*cost;
						 totalcost= totalcost+200;
						 PreparedStatement ps6=con.prepareStatement(" insert into ordertable(phoneNumber,address,productId,Sizee,colourr,image,namee,cost,NoOfProducts,TotalCost,sellerId,orderStatus) values(?,?,?,?,?,?,?,?,?,?,?,?);");
						 ps6.setString(1, phoneNumber);
						 ps6.setString(2, address);
						 ps6.setString(3, productId);
						 ps6.setString(4, SelectSize);
						 ps6.setString(5, SelectedColour);
						 ps6.setString(6, image);
						 ps6.setString(7, Namee);
						 ps6.setInt(8, cost);
						 ps6.setString(9, qty);
						 ps6.setInt(10, totalcost);
						 ps6.setString(11, sellerId);
						 ps6.setString(12, "ordered Just Now");
						 ps6.execute();
						 
						 RequestDispatcher rd = request.getRequestDispatcher("viewCartOrder.jsp?order=order");
						  rd.forward(request, response);
						 
					 }else {
						
						 request.setAttribute("Out_Of_Stock", phoneNumber);
							RequestDispatcher rd = request.getRequestDispatcher("output.jsp");
							  rd.forward(request, response);
					 }
				 
				 
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
