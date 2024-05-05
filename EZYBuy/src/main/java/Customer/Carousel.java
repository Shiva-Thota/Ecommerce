package Customer;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import connectionpool.BasicDataSourceEx;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class Carousel
 */
@MultipartConfig
public class Carousel extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part file1=request.getPart("img1");
		Part file2=request.getPart("img2");
		Part file3=request.getPart("img3");
		
	 
		try(Connection con=BasicDataSourceEx.getConnection()){
			 
			 InputStream inputStream1 = file1.getInputStream();
			 InputStream inputStream2 = file2.getInputStream();
			 InputStream inputStream3 = file3.getInputStream();
			 PreparedStatement ps=con.prepareStatement(" insert into carousel(image1,image2,image3 ) values(?,?,?);");
							 ps.setBinaryStream(1, inputStream1, inputStream1.available());
							 ps.setBinaryStream(2, inputStream2, inputStream2.available());
							 ps.setBinaryStream(3, inputStream3, inputStream3.available());
							 
							 ps.execute();
			 
			 
		}catch( Exception e) {
			System.out.println(e); 
		}
	}

}
