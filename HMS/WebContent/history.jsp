<%@ include file="navbar.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<html>
<head>
<title>
UserHistory
</title>
</head>
<body>
<h1>Your History</h1>
<table border="1">
<tr>
<td>Check in</td>
<td>Check out</td>
<td>Guests</td>

</tr>
<%
try{
con = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
st= con.prepareStatement("select * from booking where cusid=2");
rs = st.executeQuery();
int i = 1;
while(rs.next()){
%>
<tr>
<td><%=rs.getString("checkindate") %></td>
<td><%=rs.getString("checkoutdate") %></td>
<td><%=rs.getString("noofguests") %></td>
</tr>
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<%@ include file="footer.jsp" %>
</body>
</html>