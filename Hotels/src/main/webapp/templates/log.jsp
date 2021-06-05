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
	String u=request.getParameter("username");
	String p=request.getParameter("password");
	boolean olduser=false;
	try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection DB_con = DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/jBsMU8OOWb", "jBsMU8OOWb",
                "GPkoS7miTH");
        //Statement Query_stat = DB_con.createStatement();
        String queryCheck = "SELECT * from customer_credentials WHERE email = ? and password=?";
        PreparedStatement st = DB_con.prepareStatement(queryCheck);
        st.setString(1, u);
        st.setString(1,p);
        ResultSet rs = st.executeQuery();
        if(rs.next()){
        	olduser=true;
        }
        System.out.println("done");
    } catch (Exception e){
        System.out.println(e);
    }
	if(olduser){
		response.sendRedirect("./index.html");
	}
	else{
		response.sendRedirect("./signup.html");
	}
	%>
</body>
</html>