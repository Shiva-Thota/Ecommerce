<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="java.sql.*" import="java.util.StringTokenizer" import="java.util.Base64"
   import="connectionpool.BasicDataSourceEx"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<html>
    <head>
        <title>PRODUCT DETAILS</title>
         <!--  BOOTSTRAP5 --> 
  <link href="css/bootstrap.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            /* Basic Styling */
html, body {
  height: 100%;
  width: 100%;
  margin: 0;
  font-family: 'Roboto', sans-serif;
}
 
.container {
  max-width: 1100px;
  margin: 0 auto;
  padding: 15px;
  display: flex;
}

/* Columns */
.left-column {
  width: 65%;
  position: relative;
}
 
.right-column {
  width: 35%;
  margin-top: 30px;
}

/* Left Column */
.left-column img {
  width: 650px;
  height: 600px;
  position: absolute;
  left: 0;
  top: 0;
  opacity: 1;
  transition: all 0.3s ease;
}
 
.left-column img.active {
  opacity: 1;}

/* Product Description */
.product-description {
  border-bottom: 2px solid #E1E8EE;
  margin-bottom: 20px;
}
.product-description span {
  font-size: 12px;
  color: #358ED7;
  letter-spacing: 1px;
  text-transform: uppercase;
  text-decoration: none;
}
.product-description h1 {
  font-weight: 450;
  font-size: 52px;
  color: #43484D;
  letter-spacing: -2px;
}
.product-description p {
  font-size: 24px;
  font-weight: 300;
  color: #86939E;
  line-height: 24px;
}

/*  PRODUCT COLOR  */

.colorradio
{
    display: none;
}
.colorlabel
{
    padding: 5px 10px;
    background-color: #888;
    color: #fff;
    cursor: pointer;
    font-size: 24px;
    border-radius: 50%;
    height: 45px;
    width:45px;
    margin-left: 5px;
    border: 3px solid;
    box-shadow: 0px 1px 3px 0px rgba(0,0,0,0.63);
  transition: all 0.5s;
}
.colorlabel-1{
  background-color: red;   
}
.colorlabel-2{
  background-color: blue;   
}
.colorlabel-3{
  background-color: yellow;   
}
.colorlabel-4{
  background-color: rgb(70, 230, 70);   
}
.colorlabel-5{
  background-color: orange;   
}
.colorlabel-6{
  background-color: white;   
}
.colorlabel-7{
  background-color: black;   
}
#color-1:checked ~ .colorlabel-1
{
  border-color: grey;/*  theme color??????????????????????   */
}
#color-2:checked ~ .colorlabel-2
{
  border-color: grey;/*  theme color??????????????????????   */

}
#color-3:checked ~ .colorlabel-3
{
  border-color: grey;/*  theme color??????????????????????   */
}
#color-4:checked ~ .colorlabel-4
{
  border-color: grey;/*  theme color??????????????????????   */
}
#color-5:checked ~ .colorlabel-5
{
  border-color: grey;/*  theme color??????????????????????   */
}
#color-6:checked ~ .colorlabel-6
{
  border-color: grey;/*  theme color??????????????????????   */
}
#color-7:checked ~ .colorlabel-7
{
  border-color: grey;/*  theme color??????????????????????   */
}

.color-config {
  margin-bottom: 15px;
}

/* SIZE  */
.radio
{
    display: none;
}
.sizelabel
{
    padding: 5px 10px;
    background-color: #888;
    color: #fff;
    cursor: pointer;
    font-size: 24px;
    border-radius: 10%;
    height: 45px;
    width:45px;
    margin-left: 5px;
    box-shadow: 0px 1px 3px 0px rgba(0,0,0,0.63);
  transition: all 0.5s;
}

#size-1:checked ~ .sizelabel-1,
#size-2:checked ~ .sizelabel-2,
#size-3:checked ~ .sizelabel-3,
#size-4:checked ~ .sizelabel-4,
#size-5:checked ~ .sizelabel-5
{
background-color:rgb(41, 41, 41);/*      theme color??????????????????????  */   
}
.size-config {
  
  margin-bottom: 15px;
  margin-top:15px;	
}


/* Product Price */
.product-price {
  display: flex;
  align-items: center;
  margin-top:12px;
} 
 
.product-price span {
  font-size: 36px;
  font-weight: 450;
  color: #43474D;
  margin-right: 20px;
}
.buynow {
margin: 10px;
}
.addtocart{
  margin: 10px;

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
    <body>	<div id="includeHeader"></div>
     <%

byte[] imageData=null; 
     byte[] imageData1=null;
String ProductId=request.getParameter("cardId");
try(Connection con=BasicDataSourceEx.getConnection()){
	 String imagename=null;

	 String cost=null;
	 String Namee=null;
	 String additionalInformation=null;
	 String colours=null;
	 String offer=null;
	 String brand=null;
	 int NoOfProducts=0;
	 String productId=ProductId;
	 PreparedStatement ps=con.prepareStatement("Select * from productDetails where productId=?;");
	 ps.setString(1, ProductId);
	 ResultSet rs=ps.executeQuery();  

	 while(rs.next()) {
		 imageData1 = rs.getBytes("image1");
		    String image1 = Base64.getEncoder().encodeToString(imageData1);
		    imageData = rs.getBytes("image2");
		    String image2 = Base64.getEncoder().encodeToString(imageData);
		    imageData = rs.getBytes("image3");
		    String image3 = Base64.getEncoder().encodeToString(imageData);
		 cost=rs.getString("cost");
		 offer=rs.getString("offer");
		 Namee=rs.getString("Namee");
		 colours=rs.getString("colours");
		 brand=rs.getString("brand");
		 additionalInformation=rs.getString("additionalInformation");
		 NoOfProducts=rs.getInt("noOfProducts");
		 %>
		 <br><br><br><br>
      
      <div class="container"style="z-index:0;">
          <div class="row">
              <div class="col-6">
                 <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel"style="box-shadow: 0px 3px 3px 0px rgba(0,0,0,0.63);">
                  <div class="carousel-indicators">
                    <button type="button" style="height:4px;width:40px;"data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button"style="height:4px;width:40px;" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button"style="height:4px;width:40px;" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                  </div>
                  <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="data:image/jpeg;base64,<%=image1%>" class="d-block w-100" alt="..."style="height:550px;width: 100%;">
                      <div class="carousel-caption d-none d-md-block">
                                            
                      </div></div>
                    <div class="carousel-item">
                       <img src="data:image/jpeg;base64,<%=image2%>" class="d-block w-100" alt="..."style="height:550px;width: 100%;">
                      <div class="carousel-caption d-none d-md-block">
                        </div></div>
                    <div class="carousel-item">
                       <img src="data:image/jpeg;base64,<%=image3%>" class="d-block w-100" alt="..."style="height:550px;width: 100%;">
                      <div class="carousel-caption d-none d-md-block">
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
              <div class="col-6">
                  
       <!-- Right Column -->
       
          <!-- Product Description --> 
          <div class="product-description">
              <span><%=brand%></span>
              <h1><%=Namee%></h1>
              <p>The preferred choice of a vast range of acclaimed DJs. Punchy, bass-focused sound and high isolation. Sturdy headband and on-ear cushions suitable for live performance</p>
            </div>
         
            <!-- Product Configuration -->
            <form id="myForm" method="post" >
            <div class="product-configuration">
         
             <div class="product-color">
                <span><h4 style="font-size:20px;">Available Colours:</h4></span>
                <div class="color-choose">
         <%			  String red=null; 
            		  String blue=null;
            		  String white=null;
            		  String black=null;
            		  String green=null;
            		  String orange=null;
            		  String pink=null;
            		  String yellow=null;
         			  String SelectedColour=null;
         StringTokenizer st=new StringTokenizer(colours);
			  red=st.nextToken("--");
			  blue=st.nextToken("--");
			  white=st.nextToken("--");
			  black=st.nextToken("--");
			  green=st.nextToken("--");
			  orange=st.nextToken("--");
			  pink=st.nextToken("--");
			  yellow=st.nextToken("--");
			
			if(!red.equals("null")){
				 
			%>
				<input type="radio" id="color-1" name="color" value="red" class="colorradio" required >
                  <label class="colorlabel colorlabel-1" for="color-1"></label>
			<%}if(!blue.equals("null")) {

			%> 
				<input type="radio" id="color-2" name="color" value="blue" class="colorradio">
                  <label class="colorlabel colorlabel-2" for="color-2"></label>
				
			<%} if(!white.equals("null")) {
			%>
				<input type="radio" id="color-6" name="color" value="white" class="colorradio">
                  <label class="colorlabel colorlabel-6" for="color-6"></label>
			<%}
			if(!black.equals("null")) { 
			%>
                <input type="radio" id="color-7" name="color" value="black" class="colorradio" >
                  <label class="colorlabel colorlabel-7" for="color-7"></label>
			<%}
			 if(!green.equals("null")) { 
			%>
				 <input type="radio" id="color-4" name="color" value="green" class="colorradio">
                  <label class="colorlabel colorlabel-4" for="color-4"></label>
			<%}
			 if(!orange.equals("null")) { 
			%>
				<input type="radio" id="color-5" name="color" value="orange" class="colorradio">
                  <label class="colorlabel colorlabel-5" for="color-5"></label>
			<%}
		 	if(!pink.equals("null")) {;  
			%>
				<input type="radio" id="color-5" name="color" value="pink" class="colorradio">
                  <label class="colorlabel colorlabel-5" for="color-5"></label>
			<%}
		if(!yellow.equals("null")) {		 
			%>
				<input type="radio" id="color-3" name="color" value="yellow" class="colorradio">
                  <label class="colorlabel colorlabel-3" for="color-3"></label>
			<%}%>
			 </div>
              </div>
         
              <!-- size Configuration -->
              <div class="size-config">
                <span><h4 style="font-size:20px;">Size configuration:</h4></span>

                <div class="size-choose">
                  <input type="radio" id="size-1" name="size" value="XS" class="radio"  required>
                  <label class="sizelabel sizelabel-1" for="size-1">xs</label>
                      
                  <input type="radio" id="size-2" name="size" value="S" class="radio">
                  <label class="sizelabel sizelabel-2" for="size-2">S</label>
                      
                  <input type="radio" id="size-3" name="size" value="M" class="radio">
                  <label class="sizelabel sizelabel-3" for="size-3">M</label>

                  <input type="radio" id="size-4" name="size" value="L" class="radio">
                  <label class="sizelabel sizelabel-4" for="size-4">L</label>
                      
                  <input type="radio" id="size-5" name="size" value="XL" class="radio">
                  <label class="sizelabel sizelabel-5" for="size-5">XL</label>
                </div>
                </div>
                <div style="border: 1px solid #E1E8EE;"></div>
                <!-- Product Pricing -->
             <div class="product-price"> 
              <span>Cost :<%=cost %></span>
              <span style="margin-left: 10px;margin-top: 10px; color:blue;"><h4><%=offer %>% Off </h4></span>
            </div>
                <div> 
                		<input type="hidden" name="productId" value="<%=productId %>">
           				<input type="hidden" name="Namee" value="<%=Namee %>">   
           				<input type="hidden" name="cost" value="<%=cost %>">   
           				<%if(NoOfProducts>1){%>
                      <button class="btn btn-success " style="  font-size:20px;width:150px;margin-top:38px;" type="submit" value="save" value="save">BUY NOW</button>
                      <%}else{%>
                      <span style=" color:red;"><h3>Out Of Stock</h3></span>
                      <%} %>
 			      <button class="btn btn-success " style="  font-size:20px; margin-left:50px;width:180px;margin-top:38px;" type="submit" name="updateBtn" value="update">ADD TO CART</button>
              
                </div>
                 <script>
const form = document.getElementById('myForm');  // get the form element
const saveBtn = document.querySelector('button[value="save"]');  // get the "Save" button element
const updateBtn = document.querySelector('button[value="update"]');  // get the "Update" button element
  
  // add a click event listener to the "Save" button
  saveBtn.addEventListener('click', function(event) {
    form.action = 'orderPage.jsp';  // set the form action to "save.jsp"
  });
  
  // add a click event listener to the "Update" button
  updateBtn.addEventListener('click', function(event) {
    form.action = 'AddToCart' ;
    form.method='post';// set the form action to "update.jsp"
  });
</script> 
            </div>
          </div> 
          	</div>
            </form> 
            
           
            
              </div>       
         </div>
      </div>
   
      <br>
      <br>

<%  }
	}catch(Exception e) {
		System.out.println(e);
	}
 
%>
	<div id="includeFooter"></div>
    </body>
</html>
 