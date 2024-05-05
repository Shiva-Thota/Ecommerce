<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit profile</title>
</head>
<body>
<%

String edit=request.getParameter("edit");
if(edit.equalsIgnoreCase("password")){%>

<form action="editProfile" method="Post">
 <div class="card"style="width:500px;height:180px;text-align:center;margin-left:400px;box-shadow: 0px 5px 8px 0px rgba(0,0,0,0.63);">
  <div class="card-header"><h4>Change Password</h4></div>
  	<br>
  <div class="card-text">
      Enter Old Password: <input type="text" name="oldPassword">
      Enter new Password:  <input type="text" name="newPassword">
       </div>
      <br>
        <input type="hidden" name="edit" value="password">
        <span><button class="btn btn-success viewcart"style="width:200px;box-shadow: 0px 5px 8px 0px rgba(0,0,0,0.63);" type="submit" name="Add" value="Add">Change Password</button></span>
      </div></div>
</form>


<%} if(edit.equalsIgnoreCase("alternate")){%>


<form action="editProfile" method="Post">
 <div class="card"style="width:500px;height:180px;text-align:center;margin-left:400px;box-shadow: 0px 5px 8px 0px rgba(0,0,0,0.63);">
  <div class="card-header"><h4>Enter the Number</h4></div>
  	<br>
  <div class="card-text">
       <input type="text" name="alternate">
       </div>
      <br>
        <input type="hidden" name="edit" value="alternate">
        <span><button class="btn btn-success viewcart"style="width:200px;box-shadow: 0px 5px 8px 0px rgba(0,0,0,0.63);" type="submit" name="Add" value="Add">Add Number</button></span>
      </div></div>
</form>


<%} if(edit.equalsIgnoreCase("address")){%>
<form action="editProfile" method="Post">
 <div class="card"style="width:500px;height:180px;text-align:center;margin-left:400px;box-shadow: 0px 5px 8px 0px rgba(0,0,0,0.63);">
  <div class="card-header"><h4>Enter the Address</h4></div>
  	<br>
  <div class="card-text">
       <input type="text" name="address">
       </div>
      <br>* max 6 addresses can be added
      
       <input type="hidden" name="edit" value="address">
        <span><button class="btn btn-success viewcart"style="width:200px;box-shadow: 0px 5px 8px 0px rgba(0,0,0,0.63);" type="submit" name="Add" value="Add">Add Address</button></span>
      </div></div>
</form>


<%} %>
</body>
</html>