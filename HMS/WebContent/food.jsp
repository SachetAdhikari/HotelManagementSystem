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
    <title>Order Now</title>
  </head>
  <body>    
  <form action="dashboard" method="post">      
            <% 
            int hotelid =(int) session.getAttribute("hotelid");
            int customerid = (int) session.getAttribute("cusid");
        	try{
				con = DriverManager.getConnection(dbUrl, dbUsername,dbPassword);
				 %>
				 <section class="box-section">
          <h2 style="color: #000; font-family:cursive">Your Orders</h2>
          <div class="general-SBH">
          <%
          	 PreparedStatement st6=con.prepareStatement("SELECT * FROM customerfood join hotelfood on customerfood.foodid=hotelfood.foodid where customerfood.cusid='"+customerid+"' and hotelfood.hotelid='"+hotelid+"'");
        	 ResultSet rs6=st6.executeQuery();
        	 while(rs6.next()){
        	        %>
            	<div class="general-SBHbox myF" style="background-image: url(./static/images/hotel1.jpg); background-size:cover;">
        			<div class="myF-hidden">
        	        	<div class="myFdescription"><%=rs6.getString("description")%></div>
        	        	<button name="RemoveFood" value="<%=rs6.getInt("foodid")%>">Remove Order</button>
					</div>
           		</div>
            <% }%>
          </div>
        </section>
	<section class="box-section">
          <h2 style="color: #000; font-family:cursive">Available Food</h2>
          <div class="general-SBH">
          <%
          	 PreparedStatement st8=con.prepareStatement("SELECT * FROM hotelfood join food on hotelfood.foodid = food.id where hotelfood.hotelid='"+hotelid+"'");
        	 ResultSet rs8=st8.executeQuery();
        	 while(rs8.next()){
        	        %>
            `<div class="general-SBHbox addF" style="background-image: url(./static/images/hotel1.jpg); background-size:cover;">
        	   <div class="addF-hidden">
        	  	 <div class="addFdescription"><%=rs8.getString("description")%></div>
        	  	 <div class="addFrate"><%=rs8.getString("rate")%></div>
               	 <button name="food" value="<%=rs8.getInt("foodid")%>">Order this</button>
               </div>
            </div>
            <%} %>
          </div>
     </section>
          <%      
        	   
        	        con.close();
        	        st8.close();
        	        rs8.close();
        	        //rs1.close();
        	}
        		catch(Exception e){
        			System.out.println(e);
        		}
       %> 
        
		<a href="./dashboard.jsp" class="button">Go Back</a> <br />
</form>
    	<%@ include file="footer.jsp" %>
  </body>
</html>

