<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   import="java.sql.*"  import="java.util.Base64"
    import="connectionpool.BasicDataSourceEx"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
    <head><title>ABOUT US</title>
        <!--  BOOTSTRAP5 --> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    
    <!--  JQUERY LINK  -->    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <!--  FONTAWESOME LINK  -->
    <script src="https://kit.fontawesome.com/7d2e05e490.js" crossorigin="anonymous"></script>
    <!--  SCALING   -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    </head>
    
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
    
    <style>
        .ourteam{
            background-color: rgb(208, 122, 122);
            width: 20%;
            text-align: center;
            padding: 10px;
            margin-bottom: 10px;
            margin-top:  0px;
        }
        img{
            border-radius: 50%;
            height:180px;
            width: 180px;
            padding: 10px;
        }
        .description{
            border-left: 2px solid rgb(187, 182, 182);
            border-left-width: 3px;
            margin-top: 6px;
            margin-bottom: 6px;
        }
        h5{
            padding: 10px;
        }
        .aboutteam {
            margin: 10px;
            font-size: large;
        }
        .p1 {
            font-weight: 600;
        }
        .col-md-12{
            background-color: rgb(214, 235, 239);
            box-shadow: 0px 3px 3px 0px rgba(0,0,0,0.63);

        }
    </style>
<body> <div id="includeHeader"></div>
<%byte[] imageData123=null; 
try(Connection con=BasicDataSourceEx.getConnection()){
	 String imagename=null;

	
	 PreparedStatement ps=con.prepareStatement("Select * from carousel where carouselId=2;");//where carouselId='11'
	 ResultSet rs=ps.executeQuery();  
//SELECT * FROM Table ORDER BY ID DESC LIMIT 1
	 while(rs.next()) {
		 imageData123 = rs.getBytes("image1");
		    String image11 = Base64.getEncoder().encodeToString(imageData123);
		    imageData123 = rs.getBytes("image2");
		    String image12 = Base64.getEncoder().encodeToString(imageData123);
		 %>
    <div class="ourteam"><h4>Our Team!</h4></div>
    <div class="container">
        <div class="row" style="margin-top: 30px;">
            <div class="col-md-12 ">
                <div class="row">
                    <div class="col-lg-2">
                        <img src="data:image/jpeg;base64,<%=image11%>"alt="img">
                    </div>
                    <div class="col-lg-10 description">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="row">                                
                                <div class="col-lg-9"><h5>SHIVA THOTA</h5>  </div>
                                <div class="col-lg-3"style="text-align:center;padding-top:14px;padding-left:30px;border-bottom:1px solid  rgb(187, 182, 182);height:38px;"><h6>Back End Developer</h6></div>
                            </div>
                        </div>
                        </div>
                        <p class="aboutteam">The one who started it all. It takes a lot of guts to create a start up and he's the one with all of it. Meet the CEO. Yes, he's got loads of patience and humility. But on that once-in-a-blue-moon day when he breathes fire, no one dares to tread his territory. He's a master manager and rightfully at the helm of affairs at Ezybuy.</p>
                    </div>
                </div>
             </div>
        </div>
        <br>
        <br>
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-lg-2">
                        <img src="data:image/jpeg;base64,<%=image12%>"alt="img">
                    </div>
                    <div class="col-lg-10 description">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="row">                                
                                 <div class="col-lg-9"><h5>PRANAY ARURI</h5>  </div>
                                <div class="col-lg-3"style="text-align:center;padding-top:14px;padding-left:30px;border-bottom:1px solid  rgb(187, 182, 182);height:38px;"><h6>Front End Developer</h6></div>
                            </div>
                        </div>
                        </div>
                        <p class="aboutteam">The one with the patience. Prima facie, Pranay's slender frame gives an impression of a freshman sitting in a class of final year students. But his mighty brain handles all the complex technical aspects of Ezybuy. Mostly soft-spoken, this lad gets brutal only when he is playing Counter-Strike.</p>
                    </div>
                </div>
             </div>
        </div>
    </div>
    <br>
    <br>
     <br>
    <br>
     <br>
    <br><br>
    <br>
     <br>
    <br>
   
    <%  }
	}catch(Exception e) {
		System.out.println(e);
	}
 
%>
</body>
</html>
  
<div id="includeFooter"></div>
