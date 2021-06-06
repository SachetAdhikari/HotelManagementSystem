<%@ include file="navbar.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard</title>
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
    <section class="main-page current-status">
      <div class="user-profile">
        <div class="profilepic">
          <img src="../static/images/avatar.png" alt="profilepic">
          <a href="#" class="button">Update Profile</a> <br />
        </div>
        <div class="user-details">
            <h1 style="text-decoration: underline;">Ed Shreeran</h1>
            <h2>Email: ed_sheerean@gmail.com</h2>
            <h2>Phone: +977 9800012012</h2>
            <a href="#" class="button">Your History</a>
        </div>
      </div>  
      <div class="hotel-detail-profile">
          <ul>
            <li><h2>Hotel: abc</h2></li>
            <li><h2>Room Number: abc</h2></li>
            <li><h2>Number of Guests: abc</h2></li>
            <li>
              <h2>Room Assistant: abc <a href="#" class="button">Call Now</a></h2>
              
            </li>
            <li><h2>Checkin Date: abc</h2></li>
            <li>
              <h2>Checkout Date: abc <a href="#" class="button">Update</a></h2>
              
            </li>
          </ul>
        </div>
    </section>
    <h2>Your Services</h2>
        <section class="general-SBH">
            
            <div class="general-SBHbox myS1">
                <button>Remove Service</button>
            </div>
            <div class="general-SBHbox myS2">
                <button>Remove Service</button>
            </div>
            <div class="general-SBHbox myS3">
                <button>Remove Service</button>
            </div>
        </section>

          <h2>Add Services (Dropdown)</h2>
          <section class="general-SBH">
            
            <div class="general-SBHbox addS1">
                <button>Add Service</button>
            </div>
            <div class="general-SBHbox assS2">
                <button>Add Service</button>
            </div>
            <div class="general-SBHbox addS3">
                <button>Add Service</button>
            </div>
        </section>
  </body>
</html>
