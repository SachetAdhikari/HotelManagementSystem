package co.samundra.web.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
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
	        query = "select b.bookingstatus from booking b where b.id = (select max(id) from booking where booking.cusid = ?)";
	        if(rs.next()){
	        	String cusid = String.valueOf(rs.getInt("id"));
	        	st = con.prepareStatement(query);
	        	st.setString(1, cusid);
	        	rs = st.executeQuery();
	        	HttpSession session= request.getSession(true);
	        	if (rs.next()) {
	        		int booking_status = rs.getInt("bookingstatus");
	        		if (booking_status == 0) {
	        			session.setAttribute("userStatus", "CurrentlyBooked");
	        		}
	        		else {
	        			session.setAttribute("userStatus", "CurrentlyVacant");
	        		}
	        	}
	        	else {
	        		session.setAttribute("userStatus", "NewUser");
	        	}
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
	public int inputUserdetails(String name,String email,String password) {
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
	        st = con.prepareStatement("select id from customer_credentials where email= "+email+" and password= "+password);
	        ResultSet rs = st.executeQuery();
	        rs.next();
	        int cus_id = rs.getInt("id");
	        con.close();
	        st.close();
	        rs.close();
	        return cus_id;
		}
		catch(Exception e){
			System.out.println(e);
			return 0;
		}
		
	}
	public void bookingDetails(String hotel,String ac_nac,String room,String noofguest,String cin,String cout,String email,String s1,String s2,String s3) {
		String query = "insert into booking (checkindate,checkoutdate,noofguests,ratefactor,roomid,cusid,bookingstatus)" +"values(?,?,?,?,?,?,?)";
		//String query2="select * from room join roomtype on room.roomtypeid=roomtype.id where hotelid='"+hotel+"' and status='"+0+"' and ac='"+ac_nac+"'";
		String query3="select * from customer_credentials where email='"+email+"' ";
		//ciin=cin;
		int customerid=0;
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
	        st.setInt(7, 0);
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
	public void addservice(String serviceid,String email ,String customerid ) {
		System.out.println("in addservice DAO");
		try{
			//String query34="select * from customer_credentials where email='"+email+"' ";
			//int customerid=0;
			//String query3="delete from customerservices where cusid='"+customerid+"' and serviceid='"+serviceid+"'and useddate='"+ciin+"' ";
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbUrl, dbUsername,dbPassword);
			//PreparedStatement stf1= con.prepareStatement(query34);
			//ResultSet rsf=stf1.executeQuery();
			//while(rsf.next()) {
				//customerid=rsf.getInt("id");
			//}
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
			String[] billDetail = new String[9];
			//String query = "select b.id,b.roomid, b.ratefactor, h.name, r.roomno, b.noofguests from booking b inner join room r on b.roomid = r.id inner join hotels h on h.id = r.hotelid inner join roomtype rt on r.roomtypeid = rt.id where b.id=(select max(id) from booking where booking.cusid ="+cus_id+")";
			String query = "select b.id, b.checkindate, b.roomid, b.ratefactor, h.name, r.roomno, b.noofguests from booking b inner join room r on b.roomid = r.id inner join hotels h on h.id = r.hotelid inner join roomtype rt on r.roomtypeid = rt.id where b.bookingstatus=0 and b.cusid="+cus_id;
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			rs.next();
			billDetail[0] = String.valueOf(rs.getInt("id"));
			billDetail[1] = rs.getString("name");
			billDetail[2] = String.valueOf(rs.getInt("roomno"));
			billDetail[3] = String.valueOf(rs.getInt("noofguests"));
			String room_id = String.valueOf(rs.getInt("roomid"));
			String checkindate = rs.getString("checkindate");
			float ratefactor = rs.getFloat("ratefactor");
			query = "select curdate() as cur_date";
			rs = st.executeQuery(query);
			rs.next();
			String cur_date = rs.getString("cur_date");
			billDetail[4] = cur_date;
			query = "select datediff("+cur_date+","+checkindate+") as days";
			rs = st.executeQuery(query);
			rs.next();
			int noOfDays = rs.getInt("days") + 1;
			query = "select rt.rate from roomtype rt inner join room r on r.roomtypeid = rt.id where r.id ="+ room_id;
			rs = st.executeQuery(query);
			rs.next();
			float room_rate = noOfDays*rs.getFloat("rate");
			billDetail[5] = String.valueOf(room_rate);
			query = "select sum(hs.rate) as servicerate from hotelservices hs inner join customerservices cs on hs.idservice=cs.serviceid where cs.cusid = " + cus_id;
			rs = st.executeQuery(query);
			float service_rate = 0;
			while (rs.next()) {
			 service_rate += rs.getFloat("servicerate");
			}
			billDetail[6] = String.valueOf(service_rate);
			query = "select sum(f.rate) as foodrate from food f inner join customerfood cf on cf.foodid=f.id where cf.cusid = " + cus_id;
			rs = st.executeQuery(query);
			float food_rate = 0;
			while (rs.next()) {
			 food_rate += rs.getFloat("foodrate");
			}
			System.out.println(service_rate + food_rate);
			billDetail[7] = String.valueOf(food_rate);
			billDetail[8] = String.valueOf(service_rate+food_rate+room_rate);
			con.close();
			st.close();
			rs.close();
			return billDetail;
		}
		catch(Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public String insertIntoBill(float total_amount, String cus_id) {
		String query = "insert into bills (date, `total amount`, bookingid) values(?, ?, ?)";
		try {
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
			PreparedStatement st = con.prepareStatement("select curdate() as cur_date");
			ResultSet rs = st.executeQuery();
			rs.next();
			String date = rs.getString("cur_date");
			st = con.prepareStatement("select id from booking where booking.bookingstatus = 0 and booking.cusid= " + cus_id);
			rs = st.executeQuery();
			rs.next();
			String bookingid = String.valueOf(rs.getInt("id")); 
			st = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			st.setString(1, date);
			st.setString(2, String.valueOf(total_amount));
			st.setString(3, bookingid);
			st.executeUpdate();
			rs = st.getGeneratedKeys();
			rs.next();
			String bill_id = String.valueOf(rs.getInt(1));
			con.close();
			rs.close();
			st.close();
			return bill_id;
		}
		catch (Exception e){
			System.out.println(e);
			return null;
		}
		
	}
	
	public void setBookingstatus(String cus_id) {
		String query = "UPDATE booking SET bookingstatus = 1 WHERE booking.cusid = ? and bookingstatus=0";
		try {
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, cus_id);
			st.executeUpdate();
			con.close();
			st.close();
		}
		catch (Exception e){
			System.out.println(e);
		}
				
	}
	
	public void insertIntoCustomerBill(String bill_id, String cus_id) {
		String query = "insert into customerbill (billid, cusid) values(?, ?)";
		try {
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, bill_id);
			st.setString(2, cus_id);
			st.executeUpdate();
			con.close();
			st.close();
		}
		catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public void deleteFromCustomerFood(String cus_id) {
		String query = "DELETE FROM customerfood WHERE customerfood.cusid = ?";
		try {
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, cus_id);
			st.executeUpdate();
			con.close();
			st.close();
		}
		catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public void deleteFromCustomerServices(String cus_id) {
		String query = "DELETE FROM customerservices WHERE customerservices.cusid = ?";
		try {
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, cus_id);
			st.executeUpdate();
			con.close();
			st.close();
		}
		catch (Exception e) {
			System.out.println(e);
		}
	}
}
