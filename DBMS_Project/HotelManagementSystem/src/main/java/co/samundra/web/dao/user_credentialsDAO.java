package co.samundra.web.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class user_credentialsDAO{
	String dbUrl = "jdbc:mysql://remotemysql.com:3306/jBsMU8OOWb";
	String dbUsername = "jBsMU8OOWb";
	String dbPassword = "GPkoS7miTH";
	String dbDriver = "com.mysql.jdbc.Driver";
	public boolean authenticateUser(String email, String password){
		String query = "SELECT * from customer_credentials WHERE email = ? and password=?";
		try{
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbUrl, dbUsername,dbPassword);
	        PreparedStatement st = con.prepareStatement(query);
	        st.setString(1, email);
	        st.setString(1, password);
	        ResultSet rs = st.executeQuery();
	        if(rs.next()){
	        	return true;
	        }
	        else{
	        	return false;
	        }
		}
		catch(Exception e){
			System.out.println(e);
		}
		return false;
	}
}
