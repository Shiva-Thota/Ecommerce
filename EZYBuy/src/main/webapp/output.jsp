<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
   width: 350px;
   height: 280px;
   padding: 30px 20px;
   background: #f5f5f5;
   border-radius: 10px;
   box-sizing: border-box;
   text-align: center;
   box-shadow: 0px 5px 8px 0px rgba(0,0,0,0.63);
}


.popup .icon{
   margin: 5px 0px;
   width: 50px;
   height: 50px;
   
   text-align: center;
   display: inline-block;
   border-radius: 50%;
   line-height: 60px;
}
.popup .icon i.fa{
   font-size: 30px;
   
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
	String SellerAlreadyPresent=(String) request.getAttribute("SellerAlreadyPresent");
	String CustomerAlreadyPresent=(String) request.getAttribute("CustomerAlreadyPresent");
	String Product_Added=(String) request.getAttribute("Product_Added");
	String Cancel_Order =(String) request.getAttribute("Cancel_Order");
	String Out_Of_Stock =(String) request.getAttribute("Out_Of_Stock");
	String Remove_Product =(String) request.getAttribute("Remove_Product"); 
	String Address_Full =(String) request.getAttribute("Address_Full"); 
	String Pswrd_Updated =(String) request.getAttribute("Pswrd_Updated"); 
	String Pswrd_Not_Matched=(String) request.getAttribute("Pswrd_Not_Matched");
%>
<%if(Address_Full!=null) {
	%>
	<div class="popup center">
	         <div class="icon" style=" border: 2px solid #f26034;">
	            <i class="fa fa-x" style="color:#f26034;"></i>
	         </div>
	           <div class="title">
	           Error
	           </div>
	           <div class="description"><h6>
	          	max 6 Addresses are only allowed </h6>
	           </div>
	           <div class="dismiss-btn">
	           <div class="dismiss-btn">
	            <form action="SellerSign.html"><button id="dismiss-popup-btn">Sign in</button>
	          
	            </form>
	           </div>
	      </div>
	      </div>
	<%}if(Pswrd_Updated!=null) {
		
		%>
		<div class="popup center" style=" height: 380px;">
        <div class="icon" style="   border: 2px solid #34f234;">
            <i class="fa fa-check" style=" color:#34f234;"></i>
         </div>
           <div class="title"> 
            success!!
           </div>
           <div class="description"><h6>
           Password Updated</h6>
           </div>
           <div class="dismiss-btn">
            <form action="AllProducts.jsp"><button id="dismiss-popup-btn">Home Page</button></form>
            
           </div>
      </div>
          </div>
		<%}if(Pswrd_Not_Matched!=null) {
			%>
			<div class="popup center">
	         <div class="icon" style=" border: 2px solid #f26034;">
	            <i class="fa fa-x" style="color:#f26034;"></i>
	         </div>
	           <div class="title">
	           Error
	           </div>
	           <div class="description"><h6>
	          	Password Not Matched </h6>
	           </div>
	           <div class="dismiss-btn">
	           <div class="dismiss-btn">
	            <form action="AllProducts.jsp"><button id="dismiss-popup-btn">Home Page</button>
	          
	            </form>
	           </div>
	      </div>
	      </div>
			<%}if(SellerAlreadyPresent!=null) {
				
%>
<div class="popup center">
         <div class="icon" style=" border: 2px solid #f26034;">
            <i class="fa fa-x" style="color:#f26034;"></i>
         </div>
           <div class="title">
           Error
           </div>
           <div class="description"><h6>
          	Already Account present for this number <%= SellerAlreadyPresent%></h6>
           </div>
           <div class="dismiss-btn">
           <div class="dismiss-btn">
            <form action="SellerSign.html"><button id="dismiss-popup-btn">Sign in</button>
          
            </form>
           </div>
      </div>
      </div>
<%} if(CustomerAlreadyPresent!=null){%>
	<div class="popup center">
         <div class="icon" style=" border: 2px solid #f26034;">
            <i class="fa fa-x" style="color:#f26034;"></i>
         </div>
           <div class="title">
           Error
           </div>
           <div class="description"><h6>
          	Already Account present for this number <%= CustomerAlreadyPresent%></h6>
           </div>
           <div class="dismiss-btn">
           <div class="dismiss-btn">
            <form action="CustomerSign.html"><button id="dismiss-popup-btn">Sign in</button>
             
            </form>
           </div>
      </div>
      </div>
<%} if(Product_Added!=null){%>
	 <div class="popup center" style=" height: 380px;">
        <div class="icon" style="   border: 2px solid #34f234;">
            <i class="fa fa-check" style=" color:#34f234;"></i>
         </div>
           <div class="title"> 
            success!!
           </div>
           <div class="description"><h6>
           Product Added</h6>
           </div>
           <div class="dismiss-btn">
            <form action="sellerProducts.jsp"><button id="dismiss-popup-btn">View Sold Products</button></form>
             <form action="productEntry.html"><button id="dismiss-popup-btn">Add more Products</button></form>
           </div>
      </div>
          </div>
<%} if(Cancel_Order!=null){%>
     <div class="popup center">
         <div class="icon" style=" border: 2px solid #f26034;">
            <i class="fa fa-check" style="color:#f26034;"></i>
         </div>
           <div class="title">
            Cancelled!!
           </div>
           <div class="description"><h6>
            Order Cancelled Successfully</h6>
           </div>
           <div class="dismiss-btn">
           <div class="dismiss-btn">
            <form action="viewCartOrder.jsp?order=order"><button id="dismiss-popup-btn">View Order</button>
           <input type="hidden" name="order" value="order">
                       </form>
           </div>
      </div>
      </div>
<%} if(Remove_Product !=null){%>
      	<div class="popup center">
         <div class="icon" style=" border: 2px solid #f26034;">
            <i class="fa fa-check" style="color:#f26034;"></i>
         </div>
           <div class="title">
            Removed!!
           </div>
           <div class="description"><h6>
            Product Deleted from Database</h6>
           </div>
           <div class="dismiss-btn">
           <div class="dismiss-btn">
            <form action="sellerProducts.jsp"><button id="dismiss-popup-btn">View Sold Products</button></form>
           </div>
      </div>
       </div>
      
      <%} if(Out_Of_Stock!=null){%>
      <div class="popup center">
         <div class="icon" style=" border: 2px solid #f26034;">
            <i class="fa fa-check" style="color:#f26034;"></i>
         </div>
           <div class="title">
           OUT OF STOCK
           </div>
           <div class="description"><h6>
            Product is Out of Stock</h6>
           </div>
           <div class="dismiss-btn">
           <div class="dismiss-btn">
            <form action="AllProducts.jsp"><button id="dismiss-popup-btn">Home Page</button></form>
           </div>
      </div>
       </div>
      
      <%} %>
<br><br><br><br><br><br><br><br><br><br><br><br><br>
<div id="includeFooter"></div>
</body>
</html>