<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
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
</head>
<body>

<%
String productId=request.getParameter("productId");
String removeProduct=request.getParameter("remove");
String Add=request.getParameter("Add");
String Price=request.getParameter("Price");
if(removeProduct!=null){%>
<form action="changeProductDetails" method="Post">
 <div class="card"style="width:500px;height:180px;text-align:center;margin-left:400px;box-shadow: 0px 5px 8px 0px rgba(0,0,0,0.63);">
  <div class="card-header"><h4>REMOVE PRODUCT</h4></div>
  	<br>
     <input type="hidden" name="remove" value="<%=productId%>">
     <input type="hidden" name="productId" value="<%=productId%>">
        <span><button class="btn btn-danger viewcart"style="width:200px;box-shadow: 0px 5px 8px 0px rgba(0,0,0,0.63); " type="submit" name="remove" value="remove">Remove Product</button></span>
      </div></div>
  </form>
<%}
if(Add!=null){%>
<form action="changeProductDetails" method="Post">
 <div class="card"style="width:500px;height:180px;text-align:center;margin-left:400px;box-shadow: 0px 5px 8px 0px rgba(0,0,0,0.63);">
  <div class="card-header"><h4>Enter the Product Quantity</h4></div>
  	<br>
  <div class="card-text">
       <input type="text" name="productqty">
       </div>
      <br>
      <input type="hidden" name="Add" value="<%=productId%>">
       <input type="hidden" name="productId" value="<%=productId%>">
        <span><button class="btn btn-success viewcart"style="width:200px;box-shadow: 0px 5px 8px 0px rgba(0,0,0,0.63);" type="submit" name="Add" value="Add">Add Quantity</button></span>
      </div></div>
</form>
<%}
if(Price!=null){%>
<form action="changeProductDetails" method="Post">
<div class="card"style="width:500px;height:180px;text-align:center;margin-left:400px;box-shadow: 0px 5px 8px 0px rgba(0,0,0,0.63);">
  <div class="card-header"><h4>Enter the Product Price</h4></div>
  	<br>
  <div class="card-text">
       <input type="productPrice" name="productPrice">
       </div>
      <br>
      <input type="hidden" name="Price" value="<%=productId%>">
       <input type="hidden" name="productId" value="<%=productId%>">
        <span><button class="btn btn-success viewcart"style="width:200px;box-shadow: 0px 5px 8px 0px rgba(0,0,0,0.63);" type="submit" name="Price" value="Price">Change Price</button></span>
      </div></div>				
</form>
<%}%>
</body>
</html>