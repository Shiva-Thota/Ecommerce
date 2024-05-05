package Customer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import connectionpool.BasicDataSourceEx;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CustomerSignIn
 */
public class CustomerSignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String namee=request.getParameter("name");
		String phoneNumber=request.getParameter("phoneNumber");
		String pasword=request.getParameter("pasword");
		String address=request.getParameter("address");
		String gender=request.getParameter("gender");
		
		try(Connection con=BasicDataSourceEx.getConnection()){


			PreparedStatement ps=con.prepareStatement(" insert into Customerdetails(phoneNumber,namee,gender,Address,passsword) values(?,?,?,?,?);");
			 ps.setString(1, phoneNumber);
			 ps.setString(2, namee);
			 ps.setString(3, gender);
			 ps.setString(4, address);
			 ps.setString(5, pasword);
			 ps.execute();
			 
			 	RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
				rd.forward(request, response);
				
				
		}catch(java.sql.SQLIntegrityConstraintViolationException ee) {
			request.setAttribute("CustomerAlreadyPresent", phoneNumber);
			RequestDispatcher rd = request.getRequestDispatcher("output.jsp");
			  rd.forward(request, response);
		}catch(Exception e) {
			System.out.println(e);
		}
	}

}
