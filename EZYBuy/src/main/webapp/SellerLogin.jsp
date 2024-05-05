<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>LOG IN</title>
             <!--  BOOTSTRAP5 --> 
 <link href="css/bootstrap.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
   
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
         <!--  JQUERY LINK  -->    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
   
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
    <body> <div id="includeHeader"></div>
         <%
  String LoginNotExist=(String) request.getAttribute("LoginNotExist");
  String Password=(String) request.getAttribute("passswordWrong");
   %>
         <div class="card" style="width:300px;text-align: center;margin-left: 600px;" >
            <div class="card-body logincard">
                <h4 class="card-header header2">Seller LOGIN</h4>
                    <div class="card-text"> 
                        <form action="SellerLogin" method="post">
                        <ul class="list-group list-group-flush" >
                         <li class="list-group-item"><b style="float: left;">Seller Phone Number :</b><input id="input1" type="text" name="phoneNumber" placeholder="phoneNumber"  required onkeyup='check();' style="width:100%;border:none;"></li>
                            <li class="list-group-item"><b style="float: left;">Password :</b><input id="input2" type="password" name="pasword" placeholder="PASSWORD"  onkeyup='check();' style="width:100%;border:none;"></li>
                         <%
                          if(LoginNotExist!=null){%>
  	<h6 style=" color:blue">LOGIN DOESNT EXIST :<%=LoginNotExist %> </h6>
  <%}
  if(Password!=null){
  %>
  	<h6 style=" color:red">Wrong Password</h6>
  <%}%>
                         </ul>
                         <div><a  href="#"><button  class="btn btn-success" style="width:100%;">LOGIN</button></a></div>
                </div>
                        </form>
                    </div>

                   
                <form action="SellerSign.html">                  
                                      <button class="btn btn-warning" >Register</button>
               </form>
            </div>
                <br>
                <br>  
                <br> 
                <br>
                <br>
                <br>                    
 <div id="includeFooter"></div>
      </body>
  </html>
