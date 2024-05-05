<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
import="jakarta.servlet.RequestDispatcher"  import="java.util.Base64" import="java.sql.*"
   import="connectionpool.BasicDataSourceEx"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
        <title>order</title>
                <!--  BOOTSTRAP5 --> 
<link href="css/bootstrap.css">
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
<script>
    //     CARTING TOTAL CODE   //
function Function(){
	data = document.querySelector('#quantity');
              function myFunction(){
                let a = document.getElementById("price").value;
                let b = document.getElementById("quantity").value;
           
                document.getElementById("cost").value=parseFloat(a) * parseFloat(b);
                            function myfunction(){
                                        var c =200;
                                        let d = document.getElementById("cost").value;
                                        document.getElementById("grandtotal").value=parseFloat(c) + parseFloat(d);

                            }return myfunction()
            }return myFunction()
}

    
function showInput() {
	  var inputField = document.getElementById("input-field");
	  inputField.style.display = "block";
	}
 </script>      
<style>
        body{
            background-color: rgb(173, 171, 171);
      
        }
        .row2{
           height: 325px;
           border:3px solid black;
           border-radius: 2%;
            margin-bottom: 60px;
            margin-top: 60px;
            width:790px;
        }
        img{
            height:298px;
            width:240px;
            margin-top: 10px;
            border-radius: 5%;
       }
       
        .list-group-item{
            width: 450px;
            height: 35px;
            margin:2px;
            background-color: rgb(120, 120, 120);
            border-style: none;
        }
        .list-group{
            margin-left: 16px;
        }
.quantitycol{position: relative;
    margin-top: 10px;
}

/*  CART PAGE CSS*/

#plus{
    
color:rgb(13, 12, 12);
background-color:  whitesmoke;
border-radius: px;
padding: 0px;
}
#minus{
    color: rgb(13, 12, 12);
    background-color: whitesmoke  ;
    border-radius: px;
}

.btnminus{   
 
    font-size: 27px;
    margin-top: 15px;
    margin-left: 25px;
    background-color:none;
    border-style:none;
    cursor: pointer;
    padding: 0px;

}

.btnplus{  
    position: absolute;
 
    font-size: 27px;
    margin-top: 8px;
    background-color:none;
    border-style: none;
    cursor: pointer;
    margin-left: 75px;
}
.btnminuscol{
    width: 0px;
}
input#quantity{
    width: 87px;
    z-index: -1;
    margin-left: 0px;
    margin-top: 20px;
    position: absolute;

}
.quantitycol{
    margin-top: 30px;
}

        
            
           .btnremoveitem{
            margin-left: 25px;
            width: 150px;
            margin-top: 42px;
           }
           /* div button.btnpluscol{
                margin-right: 180px;
            }*/
            input.totalcost{
                width: 80px;
            }
            #tab{
                margin: 15px;
            }
            #tr1{
    padding-right: 16px;
    padding-top: 16px;
    padding-bottom: 16px;
    opacity: 60%;
}
#tr2{
    border-top-width: 3px;
    border-color: rgb(122, 118, 118);
}

#check{
    margin: 20px;
    background-color:rgb(245, 236, 119);
    font-size: large;
    font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
    border-radius: 5px;
}
            
  /* SIZE  */
.radio
{
    display: none;
}
.paymentlabel
{
    padding: 5px 10px;
    background-color: #888;
    color: #fff;
    cursor: pointer;
    font-size: 24px;
    border-radius: 5%;
    height: 45px;
    margin-left: 5px;
    box-shadow: 0px 1px 3px 0px rgba(0,0,0,0.63);
  transition: all 0.5s;
}

#payment-1:checked ~ .paymentlabel-1,
#payment-2:checked ~ .paymentlabel-2,
#payment-3:checked ~ .paymentlabel-3,
#payment-4:checked ~ .paymentlabel-4
  {
  background-color:rgb(41, 41, 41);/*      theme color??????????????????????  */   
  }
  .payment-config {
    margin-bottom: 15px;
  }      
        
    </style>
</head>
<body>
      

<%
String phoneNumber=(String) session.getAttribute("phoneNumber");

String Namee=null;
int cost=0;
if(phoneNumber==null) {
	RequestDispatcher rd;
	rd=request.getRequestDispatcher("Login.jsp");
	rd.forward(request, response);
	
}else {	
int totalCost=0;
String productId=request.getParameter("productId");
String SelectedColour=request.getParameter("color");
String SelectSize=request.getParameter("size");


String quantity;;
String address=null;


String offer=null;
String image1=null;
byte[] imageData1=null;
String address2=null;
String address3=null;
String address4=null;
String address5=null;
String address6=null;

int NoOfProducts = 0;
String sellerId=null;

try(Connection con=BasicDataSourceEx.getConnection()){
	 PreparedStatement ps1=con.prepareStatement("Select image1,offer,namee,cost from productDetails where productId=?;");
	 ps1.setString(1, productId);
	 ResultSet rs1=ps1.executeQuery();
	 while(rs1.next()) {
		 
			imageData1 = rs1.getBytes("image1");
		     image1 = Base64.getEncoder().encodeToString(imageData1);
		     offer=rs1.getString("offer");
		      
		     cost=rs1.getInt("cost");
			 Namee=rs1.getString("namee");
	 }

	 PreparedStatement ps=con.prepareStatement("select address,address2,address3,address4,address5,address6 from Customerdetails where phoneNumber=?;");
	 ps.setString(1, phoneNumber);
	 ResultSet rs=ps.executeQuery();
	 while(rs.next()) {
		 address=rs.getString("address");
		 address2=rs.getString("address2");
		 address3=rs.getString("address3");
		 address4=rs.getString("address4");
		 address5=rs.getString("address5");
		 address6=rs.getString("address6");
	 }
	 String flag=null;
	 if(address3==null) {
		 flag="address3";
	 }
	 if(address4==null) {
		 flag="address4";
	 }
	 if(address5==null) {
		 flag="address5";
	 }
	 if(address6==null) {
		 flag="address6";
	 }
	  
%>
	<div class="container"style=" ;width:1900px;margin-left:10px;">
            <div class="row row1"style="width:1200px;margin-top:50px;z-index:0;">
                <div class="col-8" style="width:760px;position: relative;margin-left: 40px;">
                    <div class="container">
                        <div class="row row2">
                            <div class="col-4">
                                <img src="data:image/jpeg;base64,<%=image1%>" alt="image1">
            
                            </div>
                            <div class="col-8">
                                <div class="row row3">
                                    <h4 style="margin: 20px;"><%=Namee %></h4>
                                <ul  class="list-group">
                                    <li class="list-group-item">PRICE:<input type="hidden" id="price" value="<%=cost %>" style="width:100%;"><%=cost %></li>
                                    <li class="list-group-item">Offer<%=offer %></li>
                                    <li class="list-group-item">Size:<%=SelectSize %></li>
                                    <li class="list-group-item"> color:<%=SelectedColour %></li>
                                  </ul>
                                </div>
                                 <form action="Order"  enctype="multipart/form-data">
                                <div class="row row4">
                                    <div class="col-6">  
                                        <div class="row row5">
                                            <div class="col quantitycol">
                                                      <span class=" btnminuscol">
                                                       <label ><h6 style="margin-top: 20px;margin-left: 11px;">Add Quantity:</h6></label>
   								 <select name="quantity" id="quantity" onclick="Function()">
    								<option value="1">1</option>
  									<option value="2" >2</option> 
  									<option value="3" >3</option>
  									<option value="4" >4</option>
  									<option value="5" >5</option>
  									<option value="6" >6</option>
  								  </select>
                                                    </span>
                                            </div>
                                          
                                        </div>
                                        
                                    </div>
                                 
                                   
                                </div>
                                <div class="row row44">
                                        <div class="col">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-4"style="width:350px;margin-left:50px;">
            
                    
                        <div class="card"style="width:290px;height:300px;margin-top:10px;margin-left:20px;">
                           
                               <div class="card-header"style="text-align:center;color:rgb(245, 236, 119);background-color:rgb(31, 30, 30);font-size:24px;
                                                              font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
                                                              letter-spacing: 3px;">  SUMMARY 
                               </div>
                               
                                       <table id="tab" >
                                               <tr>
                                                   <tr>
                                                       <th id="tr1" style="font-size: 19px">cost</th>
                                                       <th ><b style="font-size: large;float: right;"><input id="cost" type="number"placeholder="cost"readonly style="width:60px;float: right;border-style:hidden;">  Rupees</b></th>
                                                   </tr>
                                                   <tr>
                                                       <th id="tr1" style="font-size: 19px">shipping</th>
                                                       <th><b style="font-size: large;float: right;">200 </b></th>
                                                   </tr>
                                               </tr>
                                               <tr id="tr2">
                                                       <th>TOTAL COST</th>
                                                       <th id="grand_total"><b style="font-size: large;float: right;"><input id="grandtotal" type="number"placeholder="Total Cost"readonly style="width:100px;float: right;border-style: hidden;"></b></th>
                                               </tr>
                                       </table>
                        </div>
               


                </div>
            </div>
        </div>
        <br>
        <div class="container">
            <div class="row row21">
                <div class="col-6" style="width:100%;">
      <div class="card">
        <div class="card-header"><h3>Order Summary</h3></div>
           
                <ul >
                <li style="border-bottom: 2px solid grey;padding: 10px;margin:10px;"><label><h5>Shipping Address</h5></label>
					<h6>Select Address</h6>
					<input type="radio" id="ad1" name="address" value="<%=address %>" required>
 					<label for="ad1"><%=address %></label><br>
					 <%if(address2!=null) {%> 
					<input type="radio" id="ad2" name="address" value="<%=address2 %>">
  					<label for="ad2"><%=address2 %></label><br>                    
					 <%}if(address3!=null) {%> 
					<input type="radio" id="ad3" name="address" value="<%=address3 %>">
  					<label for="ad3"><%=address3 %></label><br>                    
					 <%}if(address4!=null) {%> 
					<input type="radio" id="ad4" name="address" value="<%=address4 %>">
  					<label for="ad4"><%=address4 %></label><br>                    
					 <%}if(address5!=null) {%> 
					<input type="radio" id="ad5" name="address" value="<%=address5 %>">
  					<label for="ad2"><%=address2 %></label><br>                    
					 <%}if(address6!=null) {%> 
					<input type="radio" id="ad6" name="address" value="<%=address6 %>">
  					<label for="ad6"><%=address6 %></label><br>                    
					<%}%> 
					
					<label></label>
    </li>
                <li style="border-bottom: 2px solid grey;padding: 10px;margin:10px;"><label><h5>Payment Method</h5></label>
                    <div class="payment-config">
                        <span></span>
        
                        <div class="payment-choose">
                          <input type="radio" id="payment-1" name="payment" value="xs" class="radio" >
                          <label class="paymentlabel paymentlabel-1" for="payment-1">PhonePe</label>
                              
                          <input type="radio" id="payment-2" name="payment" value="S" class="radio">
                          <label class="paymentlabel paymentlabel-2" for="payment-2">Paytm</label>
                              
                          <input type="radio" id="payment-3" name="payment" value="M" class="radio">
                          <label class="paymentlabel paymentlabel-3" for="payment-3">COD</label>
        
                          <input type="radio" id="payment-4" name="payment" value="L" class="radio">
                          <label class="paymentlabel paymentlabel-4" for="payment-4">Card</label>
                              
                        </div>
                        </div>

                </li><div>
               			 <input type="hidden" name="productId" value="<%=productId %>">
               			 
           				<input type="hidden" name="color" value="<%=SelectedColour %>">   
           				<input type="hidden" name="size" value="<%=SelectSize %>">  
                    <button class="btn btn-warning confirmbtn"  name="buyNow" value="buyNow" >CONFIRM ORDER</button>

                </div>
                </ul>
            
      </div>
     
                </div>
                <div class="col-6" style="width:20%;">
                </div>
            </div>
        </div>
        <br>
        
        <br>
        <br>
        <br>
        <br>
              
<%
}
catch( Exception e) {
	System.out.println(e); 
}}
%>
 

</body>
</html>
