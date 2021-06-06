<%@ include file="navbar.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SelectRoom</title>
</head>
<body class="selectroom-body">
<%
String hotel=request.getParameter("Hotel");
System.out.println(hotel);
String ac_nac=request.getParameter("room-type");
String cin=request.getParameter("CinDate");
System.out.println(cin);
String cout=request.getParameter("CoutDate");
String nog=request.getParameter("NoOfGuests");
String service1=request.getParameter("service1");
String service2=request.getParameter("service2");
String service3=request.getParameter("service3");
session.setAttribute("Hotel",hotel);
session.setAttribute("room-type",ac_nac);
session.setAttribute("CinDate",cin);
session.setAttribute("CoutDate",cout);
session.setAttribute("NoOfGuests",nog);
session.setAttribute("service1",service1);
session.setAttribute("service2",service2);
session.setAttribute("service3",service3);
%>
	<h1>Available Rooms</h1>
	<form class="select-room-buttons" action="booking" method="post">
		<ul>
		<%
		try{
    		//int num;
    		//String hotel=request.getParameter("Hotel");
    		//int ac=1;
    		//int no = Integer.parseInt(request.getParameter("Hotel"));
    		//int hotelid=0;
    		//System.out.println(hotel);
    		String dbUrl = "jdbc:mysql://remotemysql.com:3306/jBsMU8OOWb";
    		String dbUsername = "jBsMU8OOWb";
    		String dbPassword = "GPkoS7miTH";
    		String dbDriver = "com.mysql.cj.jdbc.Driver";
    		Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbUrl, dbUsername,dbPassword);
    			//PreparedStatement st = con.prepareStatement("select * from room join roomtype on room.roomtypeid=roomtype.id where hotelid='"+1+"' and status='"+0+"' and ac='"+0+"'");
    			//PreparedStatement st = con.prepareStatement("select * from hotels where hotels.name='"+hotel+"'");
    			//System.out.println("connected on selectroomjsp");
    	        //ResultSet rs = st.executeQuery();
    	       // while(rs.next()){
    	        	//hotelid=rs.getInt("id"); 
    	        //}
    	        PreparedStatement st1 = con.prepareStatement("select * from room join roomtype on room.roomtypeid=roomtype.id where room.hotelid='"+hotel+"' and room.status='"+0+"' and roomtype.ac='"+ac_nac+"' and roomtype.capacity='"+nog+"'" );
    			System.out.println("connected on selectroomjsp");
    	        ResultSet rs1 = st1.executeQuery();
    	        while(rs1.next()){
    	        	//hotelid=rs.getInt("id"); 
    	        	System.out.println(rs1.getInt("room.id"));
    	        	%><li><input type="radio" name="roomno" value="<%=rs1.getInt("room.id") %>"><label><%=rs1.getInt("roomno")%></label></li><% 
    	        }
    	        con.close();
    	        //st.close();
    	}
    		catch(Exception e){
    			System.out.println(e);
    		}
		 %>
		</ul>
		<input type="submit" value="Select Room">
	</form>
	<%@ include file="footer.jsp" %>
</body>
</html>