package Customer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connectionpool.BasicDataSourceEx;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class CustomerLogin
 */
public class CustomerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phoneNumber=request.getParameter("phoneNumber");
		String pasword=request.getParameter("pasword");
		
		HttpSession session;
		if(phoneNumber.equalsIgnoreCase("Admin")) {
			if(pasword.equalsIgnoreCase("Admin123")) {
				session=request.getSession(true);
				session.setAttribute("phoneNumber", phoneNumber);
				
					RequestDispatcher rd1=request.getRequestDispatcher("AllProducts.jsp");
					rd1.forward(request, response);
			}else {RequestDispatcher rd1;
				request.setAttribute("passswordWrong", pasword);
				  rd1 = request.getRequestDispatcher("Login.jsp");
				  rd1.forward(request, response);
			}
		}else {
			
			try(Connection con=BasicDataSourceEx.getConnection()){

				 String pswrdDb="p";
				 PreparedStatement ps=con.prepareStatement("SELECT passsword FROM Customerdetails WHERE phoneNumber = ?");
				 ps.setString(1, phoneNumber);
				 ResultSet rs=ps.executeQuery();
				 
				 while(rs.next()){
					 pswrdDb=rs.getString("passsword");
				 }
				 int flag=0;
				 RequestDispatcher rd;
				 if(pswrdDb.equals("p")) {
					  request.setAttribute("LoginNotExist", phoneNumber);
					  rd = request.getRequestDispatcher("Login.jsp");
					  rd.forward(request, response);
					  flag=1;
				 }
				 if(pasword.equals(pswrdDb)){
					 session=request.getSession(true);
						session.setAttribute("phoneNumber", phoneNumber);
						
						rd = request.getRequestDispatcher("AllProducts.jsp");
						  rd.forward(request, response);
			
			  }else if(flag==0){
				  request.setAttribute("passswordWrong", pasword);
				  rd = request.getRequestDispatcher("Login.jsp");
				  rd.forward(request, response);
				 }
				
				
				
			}catch(Exception e) {
				
			}
			
			
			
			
		}
		
		
		
	}

}
