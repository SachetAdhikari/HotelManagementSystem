<%@ include file="navbar.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Book Now</title>
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
    <section class="main-page booking">
      <section class="book-main">
        <label for="">Hotel</label>
        <select name="Hotel" id="">
          <option value="Hotel-1">Hotel-1</option>
          <option value="Hotel-2">Hotel-2</option>
          <option value="Hotel-3">Hotel-3</option>
        </select>
        <br />
        <label for="">Room Number</label>
        <select name="RoomNumber" id="">
          <option value="A1">A1</option>
          <option value="B2">B2</option>
          <option value="C3">C3</option>
        </select>
        <br />
        <label for="">Number of Guests</label>
        <select name="NoOfGuests" id="">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
        </select>
        <br />
        <label for="">Checkin Date: </label>
        <input type="date" id="" name="CinDate" /><br />
        <label for="">Checkout Date: </label>
        <input type="date" id="" name="CoutDate" /><br />
      </section>
      <h2>Quick Services</h2>
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
      <input type="submit" value="Book Now" />
    </section>
  </body>
</html>