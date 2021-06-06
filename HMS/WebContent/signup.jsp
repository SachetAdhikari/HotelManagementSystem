<%@ include file="navbar.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Signup</title>
  </head>
  <body>
  <%
  response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");//HTTP 1.1
  response.setHeader("Pragma","no-cache");// HTTP 1.0
  response.setHeader("Expires","0");//Proxies
  %>
    <div class="signup">
      <div class="decorator signupBox">
        <h1>Signup</h1>
        <form action="signupp" autocomplete="off" method="post">
          <label for="id1FullName">Full Name</label><br />
          <input
            type="text"
            name="fullname"
            id="id1FullName"
            placeholder="Full Name"
          />
          <br />
          <label for="id2Email">Email</label><br />
          <input type="email" name="email" id="id2Email" placeholder="Email" />
          <br />
          <label for="id3Password">Password</label> <br />
          <input type="password" placeholder="Password" id="id3Password" name="password" />
          <br />
          <label for="id4CPassword">Confirm Password</label> <br />
          <input
            type="password"
            placeholder="Confirm Password"
            id="id4CPassword"
            name="cpassword"
          />
          <br />
          <input type="submit" value="Signup" />
        </form>
        <span>Already have an account? <a href="./login.jsp">Login</a></span>
      </div>
    </div>
  </body>
</html>
