<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="#">
		<div class="admin-hotel">
		<h1>Select Hotel</h1>
		<select name = "" id = "">
			
		</select>
		</div>
		<div class="admin-addroom">
			<h1>Add Room</h1>
			<label for="roomno" >Room No.</label>
			<input type="text" id="roomno" name="roomno">
			<label for="roomtype">Type</label>
			<input type="text" id="roomtype" name="roomtype">
			<label for="roomrate">Rate</label>
			<input type="text" id="roomrate" name="roomrate">
			<label for="roomcapacity">Room Capacity</label>
			<input type="text" id="roomcapacity" name="roomcapacity">
			<input type="submit" value="Add Room">
		</div>
		<div class="admin-deleteroom">
			<h1>Delete Room</h1>
			<label for="deleteroomno">Room No.</label>
			<input type="text" id="deleteroomno" name="deleteroomno">
			<input type="submit" id = "deleteroomno" name = "deleteroomno" value="Delete Room">
		</div>
		<div class="admin-addservice">
			<h1>Add Service</h1>
			<label for="servicename" >Service Name</label>
			<input type="text" id="servicename" name="servicename">
			<label for="servicerate">Rate</label>
			<input type="text" id="servicerate" name="servicerate">
			<label for="servicedescription" >Description</label>
			<input type="text" id="servicedescription" name="servicedescription">
			<input type="submit" value="Add Service">
		</div>
		<div class="admin-deleteservice">
			<h1>Delete Service</h1>
			<label for="deleteservicename">Service Name</label>
			<input type="text" id="deleteservicename" name="deleteservicename">
			<input type="submit" id = "deleteservicename" name = "deleteservicename" value="Delete Service">
		</div>
		<div class="admin-addfood">
			<h1>Add Food</h1>
			<label for="foodname" >Food Name</label>
			<input type="text" id="foodname" name="foodname">
			<label for="foodtype">Type</label>
			<input type="text" id="foodtype" name="foodtype">
			<label for="foodrate">Rate</label>
			<input type="text" id="foodrate" name="foodrate">
			<label for="fooddescription" >Description</label>
			<input type="text" id="fooddescription" name="fooddescription">
			<input type="submit" value="Add Food">
		</div>
		<div class="admin-deletefood">
			<h1>Delete Food</h1>
			<label for="deletefoodname">Room No.</label>
			<input type="text" id="deletefoodname" name="deletefoodname">
			<input type="submit" id = "deletefoodname" name = "deletefoodname" value="Delete Food">
		</div>
	</form>	
</body>
</html>