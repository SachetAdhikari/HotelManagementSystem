package co.samundra.web.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import co.samundra.web.loginController;
public class user_credentialsDAO{
	String dbUrl = "jdbc:mysql://remotemysql.com:3306/jBsMU8OOWb";
	String dbUsername = "jBsMU8OOWb";
	String dbPassword = "GPkoS7miTH";
	String dbDriver = "com.mysql.cj.jdbc.Driver";
	public  void closeConnection(Connection con,PreparedStatement st, ResultSet rs ){
		try { rs.close(); } catch (Exception e) { System.out.println(e); }
        try { st.close(); } catch (Exception e) {  System.out.println(e); }
        try { con.close(); } catch (Exception e) {  System.out.println(e); }
	}
	public boolean authenticateUser(String email, String password){
		String query = "SELECT * from customer_credentials WHERE email = ? and password=?";
		try{
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbUrl, dbUsername,dbPassword);
			PreparedStatement st = con.prepareStatement(query);
			System.out.println("connected"+email+password);
	        st.setString(1, email);
	        st.setString(2, password);
	        ResultSet rs = st.executeQuery();
	        
	        if(rs.next()){
	        	closeConnection(con,st,rs);
	        	return true;
	        }
	        else{
	        	closeConnection(con,st,rs);
	        	return false;
	        }
		}
		catch(Exception e){
			System.out.println(e);
		}
		return false;
	}
	public void inputUserdetails(String name,String email,String password) {
		String query = "insert into customer_credentials(name,email,password,address,age)" +"values(?,?,?,?,?)";
		try{
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbUrl, dbUsername,dbPassword);
			PreparedStatement st = con.prepareStatement(query);
			System.out.println("connected"+email+password);
			st.setString(1, name);
	        st.setString(2, email);
	        st.setString(3, password);
	        st.setString(4, "Kathmandu");
	        st.setInt(5, 20);
	        st.execute();
	        con.close();
	        st.close();
		}
		catch(Exception e){
			System.out.println(e);
		}
		
	}
	public void bookingDetails(String hotel,String ac_nac,String room,String noofguest,String cin,String cout,String email) {
		String query = "insert into booking (checkindate,checkoutdate,noofguests,ratefactor,roomid,cusid)" +"values(?,?,?,?,?,?)";
		String query2="select * from room join roomtype on room.roomtypeid=roomtype.id where hotelid='"+hotel+"' and status='"+0+"' and ac='"+ac_nac+"'";
		try{
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbUrl, dbUsername,dbPassword);
			PreparedStatement st = con.prepareStatement(query);
			PreparedStatement st2 = con.prepareStatement(query2);
			ResultSet rs =st2.executeQuery();
			System.out.println(email);
			//System.out.println("connected"+email+password);
			st.setString(1,cin );
	        st.setString(2, cout);
	        st.setString(3, noofguest);
	        st.setInt(4, 25);
	        while(rs.next()) {
	        	st.setInt(5, rs.getInt("id"));
	        	st.setInt(6,rs.getInt("hotelid"));
	        }
	        st.execute();
	        con.close();
	        st.close();
	        rs.close();
		}
		catch(Exception e){
			System.out.println(e);
		}
	}
}
