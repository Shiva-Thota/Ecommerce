<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   import="java.sql.*" import="connectionpool.BasicDataSourceEx" import="java.util.Base64"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>HOME</title>
        <!--  BOOTSTRAP5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <!-- LINK TO STYLESHEET  --> 
        <link rel="stylesheet" href="HOME-STYLE.CSS">
        <!--  FONTAWESOME LINK  -->
        <script src="https://kit.fontawesome.com/7d2e05e490.js" crossorigin="anonymous"></script>
        <!--  JQUERY LINK  -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <!--  SCALING   -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
 <body>
  <%
 
byte[] imageData123=null; 
  try(Connection con=BasicDataSourceEx.getConnection()){
	 String imagename=null;

	
	 PreparedStatement ps=con.prepareStatement("Select * from carousel ORDER BY carouselId DESC LIMIT 1;");//where carouselId='11'
	 ResultSet rs=ps.executeQuery();  
//SELECT * FROM Table ORDER BY ID DESC LIMIT 1
	 while(rs.next()) {
		 imageData123 = rs.getBytes("image1");
		    String image11 = Base64.getEncoder().encodeToString(imageData123);
		    imageData123 = rs.getBytes("image2");
		    String image12 = Base64.getEncoder().encodeToString(imageData123);
		    imageData123 = rs.getBytes("image3");
		    String image13 = Base64.getEncoder().encodeToString(imageData123);
		
		 %>
   <div class="container">
          <div class="row">
            <div class="col-12"style="width:100%;">
              
              <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel"style="box-shadow: 0px 5px 8px 0px rgba(0,0,0,0.63);">
                <div class="carousel-indicators">
                  <button type="button" style="height:4px;width:40px;"data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                  <button type="button"style="height:4px;width:40px;" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                  <button type="button"style="height:4px;width:40px;" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                  <form action="searcher.jsp">
                    <button style="height:400px;width:100%;border-style: none;">
                      <img src="data:image/jpeg;base64,<%=image11%>" class="d-block w-100" alt="..."style="height:400px;width:100%;padding:3px;">
                    </button>
                    <input type="hidden" name='search' value='men'>
                    </form>
                    <div class="carousel-caption d-none d-md-block">
                      <h5>MEN FASHION</h5>
                      <p> </p>
                    </div></div>
                  <div class="carousel-item">
                    <form action="searcher.jsp">
                    <button style="height:400px;width:100%;border-style: none;">
                      <img src="data:image/jpeg;base64,<%=image12%>" class="d-block w-100" alt="..."style="height:400px;width:100%;padding:3px;">
                    </button>
                     <input type="hidden" name='search' value='women'>
                    </form>
                    <div class="carousel-caption d-none d-md-block">
                      <h5>Women FASHION</h5>
                      <p> </p>
                    </div></div>
                  <div class="carousel-item">
                    <button style="height:400px;width:100%;border-style: none;">
                      <img src="data:image/jpeg;base64,<%=image13%>" class="d-block w-100" alt="..."style="height:400px;width:100%;padding:3px;">
                    </button>
                    <div class="carousel-caption d-none d-md-block">
                      <h5>Kids FASHION</h5>
                      <p> </p>
                    </div></div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
              </div>
            </div>
          </div>  
          <%  }
	}catch(Exception e) {
		System.out.println(e);
	}
 
%>
    </body>
</html>

