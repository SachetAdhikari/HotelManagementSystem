<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" import= "java.text.SimpleDateFormat"  
import ="java.util.Date"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String hotel_name=request.getParameter("Hotel");
	String room_number=request.getParameter("RoomNumber");
	String no_of_guest=request.getParameter("NoOfGuests");
	String sDate1=request.getParameter("CinDate");  
    //Date C_in=new SimpleDateFormat("dd/MM/yyyy").parse(sDate1); 
    //String sDate2=request.getParameter("CoutDate");  
    //Date C_out=new SimpleDateFormat("dd/MM/yyyy").parse(sDate2); 

	
	try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection DB_con = DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/jBsMU8OOWb", "jBsMU8OOWb",
                "GPkoS7miTH");
        Statement Query_stat = DB_con.createStatement();
        Query_stat.executeUpdate("insert into hotels(name,address) values('"+hotel_name+"','"+"Kathmandu"+"');");
        Statement Query_stats = DB_con.createStatement();
        Query_stat.executeUpdate("insert into room(status,roomno) values('"+1+"','"+room_number+"');");
        System.out.println("done");
    } catch (Exception e){
        System.out.println(e);
    }
	response.sendRedirect("./index.html");
	%>
</body>
</html>