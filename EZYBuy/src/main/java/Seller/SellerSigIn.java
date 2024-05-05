package Seller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connectionpool.BasicDataSourceEx;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SellerSigIn
 */
public class SellerSigIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String phoneNumber=request.getParameter("phoneNumber");
		String pasword=request.getParameter("pasword");
		String address=request.getParameter("address");
		String companyName=request.getParameter("companyName");
		String additionalDetails=request.getParameter("additionalDetails");
		String GSTNo=request.getParameter("GSTNo");
		
		try(Connection con=BasicDataSourceEx.getConnection()){
			
			PreparedStatement ps=con.prepareStatement("insert into sellerDetails(phoneNumber,GSTNo,companyName,Address,passsword,additionalDetails) values(?,?,?,?,?,?);");
			 ps.setString(1, phoneNumber);
			 ps.setString(2, GSTNo);
			 ps.setString(3, companyName);
			 ps.setString(4, address);
			 ps.setString(5, pasword);
			 ps.setString(6, additionalDetails);
			 ps.execute();
			 ps.close();
		 	RequestDispatcher rd=request.getRequestDispatcher("SellerLogin.jsp");
			rd.forward(request, response);
			 
			
		} catch(java.sql.SQLIntegrityConstraintViolationException ee) {
			request.setAttribute("SellerAlreadyPresent", phoneNumber);
			RequestDispatcher rd = request.getRequestDispatcher("output.jsp");
			  rd.forward(request, response);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
