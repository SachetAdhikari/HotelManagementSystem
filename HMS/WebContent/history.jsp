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
<body class="history-body">
<h1>Your History</h1>
<div  class="table">
<table>
<tr>
<th>Check in</th>
<th>Check out</th>
<th>Guests</th>

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
</div>
<%@ include file="footer.jsp" %>
</body>
</html>