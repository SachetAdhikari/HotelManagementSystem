<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <link rel="stylesheet" href="./static/style.css" />
    <link rel="icon" type="image/icon" href="./static/images/icon.ico" />
  </head>
  <body>
  <%
  response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");//HTTP 1.1
  response.setHeader("Pragma","no-cache");// HTTP 1.0
  response.setHeader("Expires","0");//Proxies
  
  if(session.getAttribute("email")!=null){
	  response.sendRedirect("index.jsp");
  }
  %>
    <header>
      <nav>
        <div class="navlink">
          <ul>
            <li><a href="./index.html">Home</a></li>
            <li><a href="#">Hotels</a></li>
            <li><a href="#">Features</a></li>
            <li><a href="#">Packages</a></li>
          </ul>
        </div>
        <div class="signuplink">
          <ul>
            <li><a href="./signup.html">Signup</a></li>
            <li><a href="./login.html">Login</a></li>
          </ul>
        </div>
      </nav>
    </header>
    <div class="login">
      <div class="decorator loginBox">
        <h1>Login</h1>
        <img src="./static/images/avatar.png" alt="avatar" />
        <!-- <div class="avatar"></div> -->
        <form action="" method="">
          <label for="id1Email">Email</label><br />
          <input
            type="text"
            name="email"
            id="id1Email"
            placeholder="Email"
          />
          <br />
          <label for="id2Password">Password</label> <br />
          <input type="password" placeholder="Password" id="id2Password" />
          <br />
          <input type="submit" value="Login" />
        </form>
        <span>Don't have an account? <a href="./signup.html">Signup</a></span>
      </div>
    </div>
  </body>
</html>
