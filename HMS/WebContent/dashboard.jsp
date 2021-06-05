<%@ include file="navbar.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@page import="java.sql.*" %>
<%
String dbUrl = "jdbc:mysql://remotemysql.com:3306/jBsMU8OOWb";
String dbUsername = "jBsMU8OOWb";
String dbPassword = "GPkoS7miTH";
String dbDriver = "com.mysql.cj.jdbc.Driver";
try{
Class.forName(dbDriver); 
}
catch(Exception e){
	System.out.println(e);
}
Connection con=null;
PreparedStatement st=null;
ResultSet rs=null;
%>
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
  	session = request.getSession();
   	if (session.getAttribute("userStatus").equals("CurrentlyVacant")){%>
   		<div>
   		<h1>You've not booked a hotel currently!</h1>
   		<a href="./history.jsp" class="button">Your History</a>
   		<a href="./index.jsp#hotels" class="button">BookNow</a>
   		</div>
   	<%}
   	else {
   %>
  <form action="dashboard" method="post">
  <%
  response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");//HTTP 1.1
  response.setHeader("Pragma","no-cache");// HTTP 1.0
  response.setHeader("Expires","0");//Proxies
  
  //if(session.getAttribute("email")!=null){
//	  response.sendRedirect("index.jsp");
  //}
  %>
	<section class="current-status">
      <div class="user-profile">
        <div class="profilepic">
          <img src="./static/images/avatar.png" alt="profilepic">
          <a href="billController" class="button">Check Out</a> <br />
          <a href="./food.jsp" class="button">Order Food</a> <br />
        </div>            
            <% 
        	try{
        	    int customerid=0;
        	    int roomid=0;
        	    int hotelid=0;
        	    //int rs3=0;
        		//String hotel=request.getParameter("Hotel");
        		//int ac=1;
        		//int no = Integer.parseInt(request.getParameter("Hotel"));
        		
        		//System.out.println(hotel);
        		
        		//Class.forName(dbDriver);
				con = DriverManager.getConnection(dbUrl, dbUsername,dbPassword);
				session=request.getSession();
				String email = (String) session.getAttribute("email");
				System.out.println(email);
        		//PreparedStatement st = con.prepareStatement("select * from room join roomtype on room.roomtypeid=roomtype.id where hotelid='"+1+"' and status='"+0+"' and ac='"+0+"'");
        			//PreparedStatement st1=con.prepareStatement("SELECT * FROM booking WHERE booking.id=(SELECT max(id) FROM booking)");
        			//System.out.println("on dashboard");
        	        //ResultSet rs = st.executeQuery();
        	        PreparedStatement st1=con.prepareStatement("SELECT * FROM customer_credentials WHERE customer_credentials.email='"+email+"'");
        	        ResultSet rs1=st1.executeQuery();
        	        while(rs1.next()){
        	        	customerid=rs1.getInt("id");
        	        	//roomid=rs1.getInt("roomid");
        	        }
        	        PreparedStatement st11=con.prepareStatement("SELECT * FROM booking WHERE booking.cusid='"+customerid+"' and booking.bookingstatus='"+0+"'");
        	        ResultSet rs11=st11.executeQuery();
        	        while(rs11.next()){
        	        	//customerid=rs1.getInt("id");
        	        	roomid=rs11.getInt("roomid");
        	        }
        	        st = con.prepareStatement("select * from customer_credentials join booking where customer_credentials.id =?");
        	        PreparedStatement st3=con.prepareStatement("select * from room where id= ?");
        	        st3.setInt(1,roomid);
        	        //ResultSet rs3=st3.executeQuery(); 
        	        st.setInt(1,customerid);
        	        ResultSet rs3=st3.executeQuery(); 
        	        rs = st.executeQuery();
        	        PreparedStatement st4=con.prepareStatement("select * from hotels join room where room.hotelid = hotels.id and room.id='"+roomid+"'");
        	        ResultSet rs4=st4.executeQuery();
        	        PreparedStatement st5=con.prepareStatement("SELECT * FROM booking WHERE booking.cusid='"+customerid+"'and booking.bookingstatus='"+0+"'");
        	        ResultSet rs5=st5.executeQuery();
        	        
        	        while(rs.next()){
        	        	
        	        	%>
        	        	<div class="user-details">
        	        	<h1 style="text-decoration: underline;">Name:<%=rs.getString("name")%></h1>
        	        	<h2>Email:<%=rs.getString("email") %></h2>
        	        	 <a href="./history.jsp" class="button">Your History</a>
        	    
        	        	 <%
        	        	 break;
        	        	 	} %>
        	       
        </div>
      </div>  
      <div class="hotel-detail-profile">
          <ul>
          <% while(rs4.next()){  
        	  hotelid=rs4.getInt("id");
           %>
            <li><h1>Hotel:<%=rs4.getString("name")%></h1></li>
            <% 
            break;
            }
          %>
            <%
            while(rs3.next()){
            	%>
            <li><h2>Room Number: <%=rs3.getInt("roomno")%></h2></li><% 
            }
            %>
            <li>
              <h2>Guests</h2>
              <ul>
                <li><h3>guest1</h3></li>
                <li><h3>guest2</h3></li>
                <li><h3>guest3</h3></li>
              </ul>
            </li>
            <li>
            <%
            while(rs5.next()){
            	
            %>
            
            <li><h2>Checkin Date:<%=rs5.getString("checkindate")%></h2></li>
            <li>
              <h2>Checkout Date: <%=rs5.getString("checkoutdate") %> 
			<%
			}
            %>
            </li>
          </ul>
          <% session.setAttribute("hotelid", hotelid);
          session.setAttribute("cusid", customerid);
          
          %>
        </div>
 		
    </section>
        <section class="box-section">
          <h2 style="color: #000; font-family:cursive">Your Services</h2>
          <div class="general-SBH">
          <% PreparedStatement st6=con.prepareStatement("SELECT * FROM customerservices join hotelservices on customerservices.serviceid=hotelservices.idservice where customerservices.cusid='"+customerid+"' and hotelservices.idhotel='"+hotelid+"'");
        	 ResultSet rs6=st6.executeQuery();
        	 while(rs6.next()){
        		 //System.out.println(rs6.getString("description"));
        	        %>
            <div class="general-SBHbox myS">
            <div class="imgg">
        	        	<img src="./static/images/hotel1.jpg" alt="hotel">
        	        	</div>
        	        	<div class="description"><%=rs6.getString("description")%></div>
              <button name="RemoveService" value="<%=rs6.getInt("serviceid")%>">Remove Service</button>
            </div>
            <% }%>
          </div>
        </section>
        <section class="box-section">
          <h2 style="color: #000; font-family:cursive">Other Services</h2>
          <div class="general-SBH">
          <% PreparedStatement st7=con.prepareStatement("SELECT * FROM hotelservices where hotelservices.idservice not in (select customerservices.serviceid from customerservices where customerservices.cusid='"+customerid+"') and hotelservices.idhotel='"+hotelid+"'");
        	 ResultSet rs7=st7.executeQuery();
        	 while(rs7.next()){
        		 //System.out.println(rs7.getString("description"));
        	        %>
            <div class="general-SBHbox addS">
            <div class="imgg">
        	        	<img src="./static/images/hotel1.jpg" alt="hotel">
        	        	</div>
        	        	<div class="description"><%=rs7.getString("description")%></div>
              <button name="AddService" value="<%=rs7.getInt("idservice")%>">Add Service</button>
    
            </div>
            <%} %>
          </div>
        </section>
          <%      
        	   
        	        con.close();
        	        st.close();
        	        rs.close();
        	        //rs1.close();
        	}
        		catch(Exception e){
        			System.out.println(e);
        		}
       %> 
        </form>
    	<%@ include file="footer.jsp" %>
    	<%
   	}
    	%>
  </body>
</html>
