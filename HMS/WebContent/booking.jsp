<%@ include file="navbar.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./static/style.css" />
    <title>Book Now</title>
  </head>
  <body class="booking-body">
  <form action="selectroom.jsp" method="post">
      <section class="booking">
      <section class="book-main">
      <div class="book-main-div">
        <label for="">Hotel</label>
        <select name="Hotel" id="">
          <% 
        	try{
        		//int num;
        		//String hotel=request.getParameter("Hotel");
        		//int ac=1;
        		//int no = Integer.parseInt(request.getParameter("Hotel"));
        		
        		//System.out.println(hotel);
        		String dbUrl = "jdbc:mysql://remotemysql.com:3306/jBsMU8OOWb";
        		String dbUsername = "jBsMU8OOWb";
        		String dbPassword = "GPkoS7miTH";
        		String dbDriver = "com.mysql.cj.jdbc.Driver";
        		Class.forName(dbDriver);
				Connection con = DriverManager.getConnection(dbUrl, dbUsername,dbPassword);
        			//PreparedStatement st = con.prepareStatement("select * from room join roomtype on room.roomtypeid=roomtype.id where hotelid='"+1+"' and status='"+0+"' and ac='"+0+"'");
        			PreparedStatement st = con.prepareStatement("select * from hotels");
        			System.out.println("connected on booking");
        	        ResultSet rs = st.executeQuery();
        	        while(rs.next()){
        	        	%>
        	        	<option  value="<%=rs.getInt("id") %>"><%=rs.getString("name")%></option>
        	        	<%
        	        }
        	        con.close();
        	        st.close();
        	}
        		catch(Exception e){
        			System.out.println(e);
        		}
        	%>
        </select>
      </div>
      <div class="book-main-div room-type-div">
        <label for="room-type">Room Type</label>
          <div>
            <input type="radio" id="AC" name="room-type" checked value="1">
            <label for="AC">AC</label>
          </div>
          <div>
            <input type="radio" id="Non-AC" name="room-type" value="0">
            <label for="Non-AC">Non-AC</label>
          </div>
      </div>
      <div class="book-main-div">
        <label for="">No. of Guests</label>
        <select name="NoOfGuests" id="">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="5">5</option>
        </select>
      </div>
      <div class="book-main-div">
        <label for="">Checkin Date </label>
        <input type="date" id="" name="CinDate" /><br />
      </div>
      <div class="book-main-div">
        <label for="">Checkout Date </label>
        <input type="date" id="" name="CoutDate" /><br />
      </div>
      <div class="book-main-div">
        <label for="">Room Number</label>
        <select name="RoomNumber" id="">
          <option value="1">1</option>
          <option value="2">2</option>
        </select>
      </div>
      </section>
      <section class="box-section">
        <h2>Quick Services</h2>
        <div class="general-SBH">
          <div class="general-SBHbox addS">
            <input type="checkbox" name="service1" value="1"><label>Add Service</label>
          </div>
          <div class="general-SBHbox addS">
            <input type="checkbox" name="service2" value="2"><label>Add Service</label>
          </div>
          <div class="general-SBHbox addS">
            <input type="checkbox" name="service3" value="3"><label>Add Service</label>
          </div>
        </div>
      </section>
        <input type="submit" class="button" value="Book Now" />
    </section>
    </form>
    <div style="color: rgb(245, 223, 184);">
    	<%@ include file="footer.jsp" %>
    </div>
  </body>
</html>


