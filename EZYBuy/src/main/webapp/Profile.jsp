<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
import="jakarta.servlet.RequestDispatcher"  import="java.sql.*"
   import="connectionpool.BasicDataSourceEx"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
 <head>
        <meta charset="UTF-8">
        <title>output</title>
             <!--  BOOTSTRAP5 --> 
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
             <link href="css/bootstrap.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
            
            <!--  JQUERY LINK  -->    
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
            <!--  FONTAWESOME LINK  -->
            <script src="https://kit.fontawesome.com/7d2e05e490.js" crossorigin="anonymous"></script>
            <!--  SCALING   -->
            <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
           

            <!--  STYLING  -->
<style>
.center{
   position: absolute;
   top:50%;
   left: 50%;
   transform:translate(-50%,-50%);
}
.popup{ 
   width: 550px;
   height: 580px;
   padding: 30px 20px;
   background: #f5f5f5;
   border-radius: 10px;
   box-sizing: border-box;
   text-align: left;
   box-shadow: 0px 5px 8px 0px rgba(0,0,0,0.63);
}


 
.popup .title{
   margin:5px 0px;
   font-size: 30px;
   font-weight: 600;
}
.popup .description{
   color: #222;
   font-size: 15px;
   padding: 5px;
}
.popup .dismiss-btn{
   margin-top: 15px;
}
.popup .dismiss-btn button{
   padding: 10px 20px;
   background: #414040;
   color:#f5f5f5;
   border: 2px solid #111;
   font-size: 16px;
   font-weight: 600;
   cursor: pointer;
   outline: none;
   border-radius: 10px;
   transition: all 300ms ease-in-out;
}
.popup .dismiss-btn button:hover{
background-color: rgb(78, 235, 78);
color: #474646;
border-radius: 0%;
border-color: #34f234;
}


</style>

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
</head>
<body>
<div id="includeHeader"></div>
<%
String phoneNumber=(String) session.getAttribute("phoneNumber");


if(phoneNumber==null) {
	RequestDispatcher rd;
	rd=request.getRequestDispatcher("Login.jsp");
	rd.forward(request, response);
	
}else {	
String address=null;
String address2=null;
String address3=null;
String address4=null;
String address5=null;
String address6=null;
String name=null;
String alternatePh=null;

try(Connection con=BasicDataSourceEx.getConnection()){
	 PreparedStatement ps=con.prepareStatement("select * from Customerdetails where phoneNumber=?;");
	 ps.setString(1, phoneNumber);
	 ResultSet rs=ps.executeQuery();
	 while(rs.next()) {
		 name=rs.getString("namee");
		 alternatePh=rs.getString("alternatePhone");
		 address=rs.getString("address");
		 address2=rs.getString("address2");
		 address3=rs.getString("address3");
		 address4=rs.getString("address4");
		 address5=rs.getString("address5");
		 address6=rs.getString("address6");
	 }

%>

          <div class="popup center">
           <div class="title" style="text-align:center;">
          <%=name %>
           </div>
           <br> 
             <h6  >Phone Number :<%= phoneNumber%>      </h6>
           <br>
            <h6 >Alternate Number :<%=alternatePh %></h6>
            <br>
           <h5 style="align:left;">Address :</h5>
           
           
           <%if(address!=null) {%> 
		   <div class="description"><h6>1.<%= address%></h6> </div>                 
		 <%}if(address2!=null) {%> 
					   <div class="description"><h6>2.<%= address2%></h6> </div>                 
					 <%}if(address3!=null) {%> 
					 <div class="description"><h6>3.<%= address3%></h6> </div>            
					 <%}if(address4!=null) {%> 
					 <div class="description"><h6>4.<%= address4%></h6> </div>         
					 <%}if(address5!=null) {%> 
					 <div class="description"><h6>5.<%= address5%></h6> </div>          
					 <%}if(address6!=null) {%> 
					 <div class="description"><h6>6.<%= address6%></h6> </div>                 
			<%}}catch( Exception e) {
	System.out.println(e); }}%> 
	<form action="editProfile.jsp">
	 
		 <li class="list-group-item">
		<button class="btn btn-success"  type="submit" name="edit" value="password">Password Change</button>
						<input type="hidden" name="edit" value="password">
							</li> 
							
        	 </form>
        	 <br>
           <form action="editProfile.jsp">                  <li class="list-group-item">
		<button class="btn btn-success"  type="submit" name="edit" value="alternate">Number Change</button>
						<input type="hidden" name="edit" value="password">
							</li>
								 <br>
				 </form>
			<form action="editProfile.jsp">				
                             <li class="list-group-item">
		<button class="btn btn-success" type="submit" name="edit" value="address">address change</button>					
							<input type="hidden" name="edit" value="password">
							</li>
	 </form>
	
	
           </div>
         
      
</body>
</html>