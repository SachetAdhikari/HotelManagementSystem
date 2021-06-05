<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String name = request.getParameter("fullname");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String c_password = request.getParameter("cpassword");
	try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection DB_con = DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/jBsMU8OOWb", "jBsMU8OOWb",
                "GPkoS7miTH");
        Statement Query_stat = DB_con.createStatement();
        Query_stat.executeUpdate("insert into customer_credentials(name,email,password,address,age) values('"+name+"','"+email+"','"+c_password+"','"+"Kathmandu"+"','"+20+"');");
        System.out.println("done");
    } catch (Exception e){
        System.out.println(e);
    }
	response.sendRedirect("./index.html");
	%>
</body>
</html>