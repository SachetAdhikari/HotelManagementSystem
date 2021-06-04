<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   
    <link rel="stylesheet" href="./static/style.css" />
    <link rel="icon" type="image/icon" href="./static/images/icon.ico" />
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Patrick+Hand&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="sha384-wESLQ85D6gbsF459vf1CiZ2+rr+CsxRY0RpiF1tLlQpDnAgg6rwdsUF1+Ics2bni" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/df785adab4.js" crossorigin="anonymous"></script>
  </head>
  <body>
    <header>
      <nav>
        <div class="navlink">
          <ul>
            <li><a href="./index.jsp">Home</a></li>
            <li><a href="./index.jsp#hotels">Hotels</a></li>
            <li><a href="./index.jsp#services">Services</a></li>
            <%
            	if (session.getAttribute("loggedInUserId") != null) { %>
            		<li><a href="./booking.jsp">Book Now</a></li>
            	<%}
            	else{ %>
            		<li><a href="./login.jsp">Book Now</a></li>
            	<%}
            %>
          </ul>
        </div>
        
        <%
			if (session.getAttribute("loggedInUserId") != null){ %>
				<div class="signuplink">
		        <ul>
		          <li><a href="./dashboard.jsp"><i class="fa fa-user"></i></a></li>
		          <li><a href="logout"><i class="fa fa-sign-out"></i></a></li>
		        </ul>
		      	</div>	
			<% }
			else{ %>
				<div class="signuplink">
          		<ul>
            		<li><a href="./signup.jsp">Signup</a></li>
            		<li><a href="./login.jsp">Login</a></li>
          		</ul>
        		</div>
			<% }
        %>
      </nav>
    </header>
   </body>
</html>
    