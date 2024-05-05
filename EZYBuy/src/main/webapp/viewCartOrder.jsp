<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   import="java.sql.*" import="java.util.Base64"
    import="connectionpool.BasicDataSourceEx"
    pageEncoding="ISO-8859-1"%>
     
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
        <title>view</title>
                <!--  BOOTSTRAP5 --> 
<link href="css/bootstrap.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

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
</style>
</head>
<body> <div id="includeHeader"></div>
<%


String phoneNumber=(String)session.getAttribute("phoneNumber");
String order=request.getParameter("order");

if(phoneNumber==null) {
	RequestDispatcher rd;
	rd=request.getRequestDispatcher("Login.jsp");
	rd.forward(request, response);
	
}else {	
String productId=null;
try(Connection con=BasicDataSourceEx.getConnection()){

	 String imagename=null;
	 String imagefile=null;
	 String namee=null;
	 String offer=null;
	 int cost=0;
	 String Address=null;
	 String sts=null;
	 String qty=null;
	 String size=null;
	 String colour=null;
	 ResultSet rs=null;
	 if(order!=null){
	 //PreparedStatement ps=con.prepareStatement("Select * from image where imageId="+imageId1+";");
	 PreparedStatement ps=con.prepareStatement("Select * from ordertable where phoneNumber=?;");
	 ps.setString(1, phoneNumber);
	  rs=ps.executeQuery();
	 }else{
		 PreparedStatement ps=con.prepareStatement("Select * from AddCart where phoneNumber=?;");
		 ps.setString(1, phoneNumber);
		  rs=ps.executeQuery();
	 }
	 
	 
	 int TOTALCOST=0;
	 int cardCount=0;
	 while(rs.next()) {
		 if(order!=null){
			 qty=rs.getString("NoOfProducts");
			 Address=rs.getString("address");
			 sts=rs.getString("orderStatus");
			 TOTALCOST=rs.getInt("TotalCost");
			 }
		 cost=rs.getInt("cost"); 
		 namee=rs.getString("namee");
		 productId=rs.getString("productId");
		 imagefile=rs.getString("image");
		 size=rs.getString("Sizee");
		 colour=rs.getString("colourr");
		 if (cardCount % 3 == 0) {
		      out.println("<div class='row'>");
		    }
	%>   
	
	<div class='col-md-4'> 
	<form action="DetailedProductPage.jsp">   
	<div class="card" id="<%=productId %>"  style="width:300px;box-shadow: 0px 5px 5px 0px rgba(0,0,0,0.63);" >
           
           <button><img class="card-img-top women" src="data:image/jpeg;base64,<%=imagefile%>"style="width:100%;"></button>
             <div class="card-body">
                  <h4 class="card-header"> <%= namee%> </h4>
                   <div class="card-text">
                        <ul class="list-group list-group-flush"> 
                         <%if(order==null){%>
                            <li class="list-group-item"> PRICE :<%=cost %></li>
                            <%}else{ %>
                             	 <li class="list-group-item"> Total Cost :<%=TOTALCOST %></li>
                            <%} %>
                            <li class="list-group-item"> SIZE :<%=size %></li>
                             <li class="list-group-item">Color:<%=colour %></li>
                             <input type="hidden" name="cardId" value="<%=productId %>">
                             </form>
                            <%if(order==null){%>
                         <form action="orderPage.jsp">
  						<input type="hidden" name="productId" value="<%=productId %>">
           				<input type="hidden" name="Namee" value="<%=namee %>">  
           				<input type="hidden" name="color" value="<%=colour %>">
           				<input type="hidden" name="size" value="<%=size %>"> 
           				<input type="hidden" name="cost" value="<%=cost %>">  
           				<button  class="btn btn-success" style="float:right">Buy Now</button></a>
           				</form> 
           				<form action="RemoveFromCart" method="post">
     				<input type="hidden" name="cardId" value="<%=productId %>">
     				<button class="btn btn-warning" type="submit">Remove</button>
   				</form>
                                 <%}else{%> 
                                  <li class="list-group-item">Order Status:<%=sts %></li>
                                   <li class="list-group-item">Quantity:<%=qty %></li>
                                    <li class="list-group-item">Address:<%=Address %></li>
                                 <form action="CancelOrder" method="post">
                                 <input type="hidden" name="qty" value="<%=qty %>">	
     				<input type="hidden" name="cardId" value="<%=productId %>">
     				<button class="btn btn-danger" type="submit">Cancel Order</button>
   				</form>
                                 <%}%>  
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
	 
}}catch(Exception e) {
	System.out.println(e);
}}
%><div id="includeFooter"></div>
</body>
 
</html>
