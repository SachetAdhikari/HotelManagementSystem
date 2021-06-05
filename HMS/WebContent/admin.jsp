<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./static/style.css" />
<title>Admin</title>
</head>
<body class="admin-body">
	<form method="post" action="admin" enctype="multipart/form-data">
		<div class="admin-hotel">
		<h1>Select Hotel</h1>
		<select name = "hotel" id = "">
		<% 
        	try{
        		//int num;
        		//String hotel=request.getParameter("Hotel");
        		//int ac=1;
        		//int no = Integer.parseInt(request.getParameter("Hotel"));
        		//Helloo Sachet 
        		//System.out.println(hotel);
        		String dbUrl = "jdbc:mysql://remotemysql.com:3306/jBsMU8OOWb";
        		String dbUsername = "jBsMU8OOWb";
        		String dbPassword = "GPkoS7miTH";
        		String dbDriver = "com.mysql.cj.jdbc.Driver";
        		Class.forName(dbDriver);
				Connection con = DriverManager.getConnection(dbUrl, dbUsername,dbPassword);
        			//PreparedStatement st = con.prepareStatement("select * from room join roomtype on room.roomtypeid=roomtype.id where hotelid='"+1+"' and status='"+0+"' and ac='"+0+"'");
        			PreparedStatement st = con.prepareStatement("select * from hotels");
        			System.out.println("connected on admin");
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
		<div class="admin-addroom">
			<h1>Add Room</h1>
			<label for="roomno" >Room No.</label><br>
			<input type="text" id="roomno" name="roomno"><br>
			<label for="roomtype">Type</label><br>
			<input type="text" id="roomtype" name="roomtype"><br>
			<label for="roomrate">Rate</label><br>
			<input type="text" id="roomrate" name="roomrate"><br>
			<label for="roomcapacity">Room Capacity</label><br>
			<input type="text" id="roomcapacity" name="roomcapacity"><br>
			<button name="addroom" value="1">Add Room</button>
		</div>
		<div class="admin-addservice">
			<h1>Add Service</h1>
			<label for="servicename" >Service Name</label><br>
			<input type="text" id="servicename" name="servicename"><br>
			<label for="servicerate">Rate</label><br>
			<input type="text" id="servicerate" name="servicerate"><br>
			<label for="servicedescription" >Description</label><br>
			<input type="text" id="servicedescription" name="servicedescription"><br>
    		<input type="file" name="file" /> <br>
			<button name="addservice" value="1">Add Service</button>
		</div>
		<div class="admin-addfood">
			<h1>Add Food</h1>
			<label for="foodname" >Food Name</label><br>
			<input type="text" id="foodname" name="foodname"><br>
			<label for="foodtype">Type</label><br>
			<input type="text" id="foodtype" name="foodtype"><br>
			<label for="foodrate">Rate</label><br>
			<input type="text" id="foodrate" name="foodrate"><br>
			<label for="fooddescription" >Description</label><br>
			<input type="text" id="fooddescription" name="fooddescription"><br>
			<input type="file" name="file" /> <br>
			<button name="addfood" value="1">Add Food</button>
		</div>
		
		<div class="admin-deleteroom">
			<h1>Delete Room</h1>
			<label for="deleteroomno">Room No.</label><br>
			<input type="text" id="deleteroomno" name="deleteroomno"><br>
			<button name="deleteroom" value="1">Delete Room</button>
		</div>
		
		<div class="admin-deleteservice">
			<h1>Delete Service</h1>
			<label for="deleteservicename">Service Name</label><br>
			<input type="text" id="deleteservicename" name="deleteservicename"><br>
			<button name="deleteservice" value="1">Delete Service</button><br>
		</div>
				<div class="admin-deletefood">
			<h1>Delete Food</h1>
			<label for="deletefoodname">Food Name</label><br>
			<input type="text" id="deletefoodname" name="deletefoodname"><br>
			<button name="deletefood" value="1">Delete Food</button>
		</div>
	</form>	
</body>
</html>