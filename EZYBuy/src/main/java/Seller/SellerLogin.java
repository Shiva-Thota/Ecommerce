package Seller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connectionpool.BasicDataSourceEx;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class SellerLogin
 */
public class SellerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phoneNumber=request.getParameter("phoneNumber");
		String pasword=request.getParameter("pasword");
		
		try(Connection con=BasicDataSourceEx.getConnection()){
			HttpSession Sellersession;
			 String pswrdDb="p";
			 PreparedStatement ps=con.prepareStatement("SELECT passsword FROM sellerDetails WHERE phoneNumber = ?");
			 ps.setString(1, phoneNumber);
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()){
				 pswrdDb=rs.getString("passsword");
			 }
			 int flag=0;
			 RequestDispatcher rd;
			 if(pswrdDb.equals("p")) {
				  request.setAttribute("LoginNotExist", phoneNumber);
				  rd = request.getRequestDispatcher("SellerLogin.jsp");
				  rd.forward(request, response);
				  flag=1;
			 }
			 if(pasword.equals(pswrdDb)){
				 Sellersession=request.getSession(true);
				 Sellersession.setAttribute("SellerphoneNumber", phoneNumber);
				 
				 rd = request.getRequestDispatcher("productEntry.html");
				 rd.forward(request, response);
		  }else if(flag==0){
			  request.setAttribute("passswordWrong", pasword);
			  rd = request.getRequestDispatcher("SellerLogin.jsp");
			  rd.forward(request, response);
			 }
		}catch(SQLException e){
			System.out.println(e);
		}
	}

}
