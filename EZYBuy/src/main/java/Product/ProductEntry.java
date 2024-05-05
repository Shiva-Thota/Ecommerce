package Product;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connectionpool.BasicDataSourceEx;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class ProductEntry
 */
@MultipartConfig
public class ProductEntry extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part file1=request.getPart("img1");
		Part file2=request.getPart("img2");
		Part file3=request.getPart("img3");
		
		String namee=request.getParameter("name");
		String cost=request.getParameter("cost");
		String type=request.getParameter("featured");
		String noOfproducts=request.getParameter("quantity");
		String brand=request.getParameter("brand");
		String additionalInformation=request.getParameter("additional_info");
		String offer=request.getParameter("offer");
		
		HttpSession session=request.getSession(false);
		String phoneNumber=(String) session.getAttribute("SellerphoneNumber");
	 
		String category=request.getParameter("category");
		
		
		String red=request.getParameter("red");
		String blue=request.getParameter("blue");
		String white=request.getParameter("white");
		String black=request.getParameter("black");
		String green=request.getParameter("green");
		String orange=request.getParameter("orange");
		String pink=request.getParameter("pink");
		String yellow=request.getParameter("yellow");
		String color=red+"--"+blue+"--"+white+"--"+black+"--"+green+"--"+orange+"--"+pink+"--"+yellow;
		
		try(Connection con=BasicDataSourceEx.getConnection()){
			 
			InputStream inputStream1 = file1.getInputStream();
			 InputStream inputStream2 = file2.getInputStream();
			 InputStream inputStream3 = file3.getInputStream();
			PreparedStatement ps=con.prepareStatement(" insert into productDetails(Namee,"
		+"colours,cost,typee,noOfProducts,category,brand,additionalInformation,offer,sellerId,image1,image2,image3) values(?,?,?,?,?,?,?,?,?,?,?,?,?);");
			 ps.setString(1, namee);
			 ps.setString(2, color);
			 ps.setString(3, cost);
			 ps.setString(4, type);
			 ps.setString(5, noOfproducts);
			 ps.setString(6, category);
			 ps.setString(7, brand);
			 ps.setString(8, additionalInformation);
			 ps.setString(9, offer);
			 ps.setString(10, phoneNumber);
			 ps.setBinaryStream(11, inputStream1, inputStream1.available());
			 ps.setBinaryStream(12, inputStream2, inputStream2.available());
			 ps.setBinaryStream(13, inputStream3, inputStream3.available());
			 ps.execute();
 
			 request.setAttribute("Product_Added", phoneNumber);
				RequestDispatcher rd = request.getRequestDispatcher("output.jsp");
				  rd.forward(request, response);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

}
