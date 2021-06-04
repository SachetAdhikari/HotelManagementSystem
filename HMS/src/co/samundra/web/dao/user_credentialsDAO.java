package co.samundra.web.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import co.samundra.web.loginController;
public class user_credentialsDAO{
	String dbUrl = "jdbc:mysql://remotemysql.com:3306/jBsMU8OOWb";
	String dbUsername = "jBsMU8OOWb";
	String dbPassword = "GPkoS7miTH";
	String dbDriver = "com.mysql.cj.jdbc.Driver";
	int customerid=0;
	String ciin;
	public  void closeConnection(Connection con,PreparedStatement st, ResultSet rs ){
		try { rs.close(); } catch (Exception e) { System.out.println(e); }
        try { st.close(); } catch (Exception e) {  System.out.println(e); }
        try { con.close(); } catch (Exception e) {  System.out.println(e); }
	}
	public boolean authenticateUser(String email, String password, HttpServletRequest request){
		String query = "SELECT * from customer_credentials WHERE email = ? and password=?";
		try{
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbUrl, dbUsername,dbPassword);
			PreparedStatement st = con.prepareStatement(query);
			System.out.println("connected "+email+" "+password);
	        st.setString(1, email);
	        st.setString(2, password);
	        ResultSet rs = st.executeQuery();
	        if(rs.next()){
	        	String cusid = String.valueOf(rs.getInt("id"));
	        	HttpSession session= request.getSession(true);
				session.setAttribute("loggedInUserId", cusid);
				session.setAttribute("email", email);
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
	public void bookingDetails(String hotel,String ac_nac,String room,String noofguest,String cin,String cout,String email,String s1,String s2,String s3) {
		String query = "insert into booking (checkindate,checkoutdate,noofguests,ratefactor,roomid,cusid)" +"values(?,?,?,?,?,?)";
		//String query2="select * from room join roomtype on room.roomtypeid=roomtype.id where hotelid='"+hotel+"' and status='"+0+"' and ac='"+ac_nac+"'";
		String query3="select * from customer_credentials where email='"+email+"' ";
		ciin=cin;
		try{
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbUrl, dbUsername,dbPassword);
			PreparedStatement st = con.prepareStatement(query);
			//PreparedStatement st2 = con.prepareStatement(query2);
			PreparedStatement st3= con.prepareStatement(query3);
			//ResultSet rs =st2.executeQuery();
			ResultSet rs2=st3.executeQuery();
			System.out.println(email);
			//System.out.println("connected"+email+password);
			st.setString(1,cin );
	        st.setString(2, cout);
	        st.setString(3, noofguest);
	        st.setInt(4, 25);
	        st.setString(5, room);
	        //while(rs.next()) {
	        	//st.setInt(5, rs.getInt("id"));
	        //}
	        while (rs2.next()) {
	        	st.setInt(6,rs2.getInt("id"));
	        	customerid=rs2.getInt("id");
	        }
	        st.execute();
	        if(s1!=null) {
	        	int s11=0;
				String query4="select * from services where id='"+s1+"'";
				PreparedStatement st4= con.prepareStatement(query4);
				ResultSet rs4 =st4.executeQuery();
				while(rs4.next()) {
					s11=rs4.getInt("id");
				}
				String q6="insert into customerservices (cusid,serviceid,usedate)"+"values(?,?,?)";
				PreparedStatement st5= con.prepareStatement(q6);
				st5.setInt(1,customerid);
				st5.setInt(2,s11);
				
				st5.setString(3,cin);
				st5.execute();
			}
			if(s2!=null) {
				int s22=0;
				String query5="select * from services where id='"+s2+"'";
				PreparedStatement st4= con.prepareStatement(query5);
				ResultSet rs4 =st4.executeQuery();
				while(rs4.next()) {
					s22=rs4.getInt("id");
				}
				String q6="insert into customerservices (cusid,serviceid,usedate)"+"values(?,?,?)";
				PreparedStatement st5= con.prepareStatement(q6);
				st5.setInt(1,customerid);
				st5.setInt(2,s22);
				st5.setString(3,cin);
				st5.execute();
			}
			if(s3!=null) {
				int s33=0;
				String query6="select * from services where id='"+s3+"'";
				PreparedStatement st4= con.prepareStatement(query6);
				ResultSet rs4 =st4.executeQuery();
				while(rs4.next()) {
					s33=rs4.getInt("id");
				}
				String q6="insert into customerservices (cusid,serviceid,usedate)"+"values(?,?,?)";
				PreparedStatement st5= con.prepareStatement(q6);
				st5.setInt(1,customerid);
				st5.setInt(2,s33);
				st5.setString(3,cin);
				st5.execute();
			}
			String query66="update room set status='"+1+"' where id ='"+room+"' and hotelid='"+hotel+"'";
			PreparedStatement st66= con.prepareStatement(query66);
			st66.executeUpdate();
	        con.close();
	        st.close();
	        //rs.close();
	        //st2.close();
	        rs2.close();
	        st3.close();
		}
		catch(Exception e){
			System.out.println(e);
		}
	}
	public void food(String foodid,String email) {
		System.out.println("in food DAO");
		String query3="select * from customer_credentials where email='"+email+"' ";
		int customerid=0;
		int a=1;
		try{
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbUrl, dbUsername,dbPassword);
			PreparedStatement stf= con.prepareStatement(query3);
			ResultSet rsf=stf.executeQuery();
			while(rsf.next()) {
				customerid=rsf.getInt("id");
			}
			String q="insert into customerfood values('"+customerid+"','"+foodid+"',CURRENT_TIMESTAMP,'"+a+"')";
			PreparedStatement stf1= con.prepareStatement(q);
			stf1.execute();

		}
		catch(Exception e){
			System.out.println(e);
		}
		
		
	}
	public void removeservice(String serviceid,String email) {
		System.out.println("in removeservice DAO");
		try{
			String query34="select * from customer_credentials where email='"+email+"' ";
			int customerid=0;
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbUrl, dbUsername,dbPassword);
			PreparedStatement stf1= con.prepareStatement(query34);
			ResultSet rsf=stf1.executeQuery();
			while(rsf.next()) {
				customerid=rsf.getInt("id");
			}
			String query3="delete from customerservices where cusid='"+customerid+"' and serviceid='"+serviceid+"'";
			PreparedStatement stf= con.prepareStatement(query3);
			stf.executeUpdate();
		}
		catch(Exception e){
			System.out.println(e);
		}
		
	}
	public void addservice(String serviceid,String email) {
		System.out.println("in addservice DAO");
		try{
			String query34="select * from customer_credentials where email='"+email+"' ";
			int customerid=0;
			//String query3="delete from customerservices where cusid='"+customerid+"' and serviceid='"+serviceid+"'and useddate='"+ciin+"' ";
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbUrl, dbUsername,dbPassword);
			PreparedStatement stf1= con.prepareStatement(query34);
			ResultSet rsf=stf1.executeQuery();
			while(rsf.next()) {
				customerid=rsf.getInt("id");
			}
			String q6="insert into customerservices (cusid,serviceid,usedate)"+"values('"+customerid+"','"+serviceid+"',CURDATE())";
			PreparedStatement st5= con.prepareStatement(q6);
			st5.execute();
		}
		catch(Exception e){
			System.out.println(e);
		}
	}
	
	public String[] getBillDetails(String cus_id) {
		try {
			String[] billDetail = new String[6];
			String query = "select b.id, h.name, r.roomno, b.noofguests from booking b inner join room r on b.roomid = r.id inner join hotels h on h.id = r.hotelid inner join roomtype rt on r.roomtypeid = rt.id where b.id=(select max(id) from booking where booking.cusid ="+cus_id+")";
			String query1 = "select curdate() as cur_date";
			String query2 = "";
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
			PreparedStatement st = con.prepareStatement(query);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				billDetail[0] = String.valueOf(rs.getInt("id"));
				billDetail[1] = rs.getString("name");
				billDetail[2] = String.valueOf(rs.getInt("roomno"));
				billDetail[3] = String.valueOf(rs.getInt("noofguests"));
			}
			st = con.prepareStatement(query1);
			rs = st.executeQuery();
			if (rs.next()) {
				billDetail[4] = rs.getString("cur_date");
			}
			st = con.prepareStatement(query2);
			rs = st.executeQuery();
			if (rs.next()) {
				billDetail[4] = rs.getString("total_amount");
			}
			return billDetail;
		}
		catch(Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
