<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
import="java.sql.*"  import="java.util.Base64"  
import="java.util.StringTokenizer"  import="connectionpool.BasicDataSourceEx"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="ISO-8859-1">
<title>Search</title>
</head>
       <meta charset="UTF-8">
        <title>ALLPRODUCTS</title>
                <!--  BOOTSTRAP5 --> 
<link href="css/bootstrap.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

   <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
   <script>
      $(function() {
         $("#includeHeader").load("Header.html");
      });
   </script>
   <script>
      $(function() {
         $("#includeFooter").load("Footer.html");
      });
   </script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
              <!-- LINK TO STYLESHEET  --> 
 <link rel="stylesheet" href="MEN-STYLE.CSS">
            <link rel="stylesheet" href="HOME-STYLE.CSS">
               <!--  FONTAWESOME LINK  -->

           <script src="https://kit.fontawesome.com/7d2e05e490.js" crossorigin="anonymous"></script>
            <!--  JQUERY LINK  -->    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
           <!--  SCALING   -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
        
<style>
    .card-img-top{                  
        width: 100%;
    height:330px ;
}
.card{margin:50px}
.card-body{background-color: rgb(119, 115, 115);}
.card-header{background-color:rgb(221, 218, 218);text-transform: capitalize;}
/*#navbuttonsseller{
position:absolute;
margin-right:50px;*/
}
</style>
<body> <div id="includeHeader"></div>
<%

String search=request.getParameter("search");
String ss=null;
String type=null;
String category=null;
String SoldProducts=null;
 
int noOfProducts=0;
String sellersid=null;
int sellerId=0;
String SellerphoneNumber=null; 



String phoneNumber=(String) session.getAttribute("phoneNumber");

try {
StringTokenizer st1=new StringTokenizer(search);
 	type=st1.nextToken();
	ss=st1.nextToken();
	category=st1.nextToken();
}catch(Exception e) {
}


try(Connection con=BasicDataSourceEx.getConnection()){
	 String imagename=null;
	 String imagefile=null;
	 String cost=null;
	 String offer=null;
	 String productId=null;
	String sellerId123=null;
	String brand;
	 
	 ResultSet rs;
	  
	 if(ss==null) {
		 	category=type;
		 	if(category.equalsIgnoreCase("kids")){
		 		PreparedStatement ps=con.prepareStatement("Select * from productDetails where category=?;");
				 ps.setString(1 , category);
				  rs=ps.executeQuery();
		 	}else{
		 	PreparedStatement ps=con.prepareStatement("Select * from productDetails where category=? or category='unisex';");
			 ps.setString(1 , category);
			  rs=ps.executeQuery();
			  }
		}else{
	 	//PreparedStatement ps=con.prepareStatement("Select * from image where imageId="+imageId1+";");
	 	PreparedStatement ps=con.prepareStatement("Select * from productDetails where typee=? And (category=? or  category='unisex') ;");
	 	ps.setString(1 , type);
		 ps.setString(2, category);
	  	rs=ps.executeQuery();
	  	}
	 
	 int cardCount = 0;
	 while(rs.next()) {
		 byte[] imageData = rs.getBytes("image1");
		 imagename=rs.getString("namee");
		 imagefile = Base64.getEncoder().encodeToString(imageData);
		 cost=rs.getString("cost");
		 offer=rs.getString("offer");
		 sellerId123=rs.getString("sellerId");
		 brand=rs.getString("brand");
		 productId=rs.getString("productId");
		 noOfProducts=rs.getInt("noOfProducts"); 
		 if (cardCount % 3 == 0) {
		      out.println("<div class='row'>");
		    }
	%>   
	<div class='col-md-4'>    
	<form action="DetailedProductPage.jsp"> 
	<div class="card" id="<%=productId %>"  style="width:300px;box-shadow: 0px 5px 5px 0px rgba(0,0,0,0.63);" >
           <button><img class="card-img-top women" src="data:image/jpeg;base64,<%=imagefile%>"style="width:100%;"></button>
              <div class="card-body">
                   <h4 class="card-header"> <%= imagename%> </h4>
                    <div class="card-text">
                         <ul class="list-group list-group-flush">
                           <li class="list-group-item"><%=brand %></li>
                            <li class="list-group-item"> PRICE:<%=cost %></li>
                           
                             <li class="list-group-item">Offer:<%=offer %></li>
                            <input type="hidden" name="cardId" value="<%=productId %>">
                            </form> 
                           
                            <% if(search==null){ %>
                               <li class="list-group-item">Left Products<%=noOfProducts %></li>
                             <form action="changeProductDetails.jsp">
                             <input type="hidden" name="productId" value="<%=productId%>">
                          
                             <li class="list-group-item">
		<button class="btn btn-success"  type="submit" name="remove" value="remove">remove Products</button>
							</li> 
                             <li class="list-group-item">
		<button class="btn btn-success"  type="submit" name="Add" value="Add">Add Product</button>
							</li>
                             <li class="list-group-item">
		<button class="btn btn-success" type="submit" name="Price" value="Price">change Price</button>					
							</li>
						
                             </form>
                            <%}else  if(phoneNumber!=null) { if(phoneNumber.equalsIgnoreCase("Admin")) { %>
               <form action="changeProductDetails.jsp">
			   <li class="list-group-item">Product ID :<%=productId %></li>
				<li class="list-group-item">Seller ID :<%=sellerId123 %></li>
				<li class="list-group-item">No Of Products Left:<%=noOfProducts %></li>
          	   <input type="hidden" name="productId" value="<%=productId %>">
           <button class="btn btn-danger" type="submit" name="remove" value="remove">Remove Product</button>
           </form>    <%}}%>
                        </ul>
                    </div>
                
                  
                </div> 
          </div>
           </div>
	<%				
	cardCount++;
	if (cardCount % 3 == 0) {
	      out.println("</div>");
	    }
	 }

}catch(Exception e) {
	System.out.println(e);
}


%> <div id="includeFooter"></div>
</body>
</html>
