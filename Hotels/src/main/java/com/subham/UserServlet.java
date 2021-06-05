package com.subham;
import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserServlet {
	public void service(HttpServletRequest req,HttpServletResponse res) {
		String u=req.getParameter("username");
		String p=req.getParameter("password");
		
		try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection DB_con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hotel", "root",
                    "L@v@iris870");
            Statement Query_stat = DB_con.createStatement();
            Query_stat.executeUpdate("insert into users values('"+u+"','"+p+"');");
            System.out.println("done");
        } catch (Exception e) {
            System.out.println(e);
        }
	}
}
