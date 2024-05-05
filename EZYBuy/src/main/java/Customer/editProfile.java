package Customer;

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
 * Servlet implementation class editProfile
 */
public class editProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session =request.getSession(false);
		String phoneNumber=(String) session.getAttribute("phoneNumber");
		
		String edit=request.getParameter("edit");
		if(edit.equalsIgnoreCase("password")){
		
			
			try(Connection con=BasicDataSourceEx.getConnection()){

				 String pswrdDb="p";
				 String oldPswrd=request.getParameter("oldPassword");
				 String newPswrd=request.getParameter("newPassword");
				 PreparedStatement ps=con.prepareStatement("SELECT passsword FROM Customerdetails WHERE phoneNumber = ?");
				 ps.setString(1, phoneNumber);
				 ResultSet rs=ps.executeQuery();
				 
				 while(rs.next()){
					 pswrdDb=rs.getString("passsword");
				 }
				 if(oldPswrd.equals(pswrdDb)) {
					 PreparedStatement ps1=con.prepareStatement("update Customerdetails set passsword=? where phoneNumber=?;");
					 ps1.setString(1, newPswrd);
					 ps1.setString(2, phoneNumber);
					 ps1.executeUpdate();
					 request.setAttribute("Pswrd_Updated", newPswrd);
					 RequestDispatcher rd = request.getRequestDispatcher("output.jsp");
					  rd.forward(request, response);
				 }else {
					 request.setAttribute("Pswrd_Not_Matched", "failed");
					 RequestDispatcher rd = request.getRequestDispatcher("output.jsp");
					  rd.forward(request, response);
				 }
				 
				 
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		
		}
		if(edit.equalsIgnoreCase("alternate")){
		
			String AlternateMobile=request.getParameter("alternate");
			
			try(Connection con=BasicDataSourceEx.getConnection()){
				
				 PreparedStatement ps=con.prepareStatement("update Customerdetails set alternatePhone=? where phoneNumber=?;");
				 ps.setString(1, AlternateMobile);
				 ps.setString(2, phoneNumber);
				 ps.executeUpdate();
				
				 RequestDispatcher rd;
				  rd = request.getRequestDispatcher("Profile.jsp");
				  rd.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
			
		}
		if(edit.equalsIgnoreCase("address")){
		
			String Mainaddress=request.getParameter("address");
		
		String address2=null;
		String address3=null;
		String address4=null;
		String address5=null;
		String address6=null;
		try(Connection con=BasicDataSourceEx.getConnection()){
			 
			 PreparedStatement ps=con.prepareStatement("select *from Customerdetails where phoneNumber=?;");
			 ps.setString(1, phoneNumber);
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()) {
				 address2=rs.getString("address2");
				 address3=rs.getString("address3");
				 address4=rs.getString("address4");
				 address5=rs.getString("address5");
				 address6=rs.getString("address6");
			 }
			 
			 String flag=null;
			 if(address2==null) {
				 flag="Address2";
			 }else if(address3==null) {
				 flag="Address3";
			 }else if(address4==null) {
				 flag="Address4";
			 }else if(address5==null) {
				 flag="Address5";
			 }else if(address6==null) {
				 flag="Address6";
			 }
			 
			 if(flag!=null) {
			 PreparedStatement ps3=con.prepareStatement("update Customerdetails set "+flag+"=? where phoneNumber=?;");
			 ps3.setString(1, Mainaddress);
			 ps3.setString(2, phoneNumber);
			 ps3.execute();
			 
			  RequestDispatcher rd;
			  rd = request.getRequestDispatcher("Profile.jsp");
			  rd.forward(request, response);
			 }else {
				 request.setAttribute("Address_Full", "full");
				 RequestDispatcher rd = request.getRequestDispatcher("output.jsp");
				  rd.forward(request, response);
			 }
			 
		}
		catch( Exception e) {
			System.out.println(e);
		}}
	}

}
