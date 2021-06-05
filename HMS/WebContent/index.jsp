<%@ include file="navbar.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home</title>
  </head>
  <body>
      <section class="intro">
        <h1>NAMASTE</h1>
      </section>
      <section class="hotels box-section" id="hotels">
      <%
      session = request.getSession();
      if (session.getAttribute("loggedInUserId")!=null && session.getAttribute("userStatus").equals("CurrentlyBooked")){%>
      	<h1>You're Currently Booked in one of Our Hotels</h1>
      	<a href="./dashboard.jsp" class="button">View Dashboard</a>
      <%}
      else{
      %>
      	<h2>Our Hotels</h2>
        <div class="general-SBH">
        <% 
        try{
        		String dbUrl = "jdbc:mysql://remotemysql.com:3306/jBsMU8OOWb";
        		String dbUsername = "jBsMU8OOWb";
        		String dbPassword = "GPkoS7miTH";
        		String dbDriver = "com.mysql.cj.jdbc.Driver";
        		Class.forName(dbDriver);
				Connection con = DriverManager.getConnection(dbUrl, dbUsername,dbPassword);
        		PreparedStatement st = con.prepareStatement("select * from hotels");
        		System.out.println("On Index");
        	       ResultSet rs = st.executeQuery();
        	        while(rs.next()){
        	        	%>
        	        	<div class="general-SBHbox bookH">
        	        	<div class="imgg">
        	        	<img src="./static/images/h1.jpg" alt="hotel">
        	        	</div>
        	        	<div class="description">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Et voluptates quasi tempore, perspiciatis reprehenderit excepturi, placeat ea quis debitis suscipit corrupti enim maxime praesentium laborum, at qui. Aspernatur suscipit quo et voluptatum ipsa, fugit harum reiciendis accusantium ut quia voluptates consectetur excepturi blanditiis iusto numquam ratione ad ex? Voluptate, eveniet?
						</div>
              			<button value="<%=rs.getInt("id")%>">Book Now</button>
            			</div>
        	        	<%
        	        }
        	        con.close();
        	        st.close();
        	}
        		catch(Exception e){
        			System.out.println(e);
        		}
        	%>
        </div>
        <% } 
        %>
      </section>
      <section class="service" id="services">
        <h1>Services we provide</h1>
        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Modi quod sapiente facere, distinctio quis tempora consequuntur nostrum in perferendis optio impedit tenetur aliquam aliquid placeat.</p>
        <div class="row">
            <div class="service-col">
                <h3>Blogs</h3>
                <p>Ratione culpa maiores et omnis architecto quis voluptatibus veritatis dignissimos suscipit! Maiores ut rerum exercitationem. Inventore nostrum mollitia commodi excepturi, quod architecto repudiandae velit voluptatibus dolorum. Veritatis quaerat voluptate explicabo autem facilis deserunt eos, accusantium eaque eveniet magnam quia est adipisci dolorum excepturi enim tempora provident pariatur modi vero suscipit expedita reiciendis iusto. Recusandae temporibus quos obcaecati, corrupti atque fuga deserunt impedit. Similique facere expedita magni minus consectetur quasi alias excepturi velit, incidunt dolor adipisci nemo, ipsam accusantium facilis illum vel repellendus optio aspernatur! Harum accusantium a officiis suscipit provident saepe, assumenda quas voluptatibus amet praesentium. Sint ducimus vitae quaerat at sit iste maxime cupiditate aliquam eius impedit illo corporis praesentium, ipsa aperiam! Voluptates, corporis quibusdam! Placeat officia quaerat veniam nihil corporis delectus libero eos minus, expedita quam?</p>
            </div>
            <div class="service-col">
                <h3>Write and Earn</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum ut quaerat quas ea at vitae sapiente soluta itaque ipsam, ratione culpa maiores et omnis architecto quis voluptatibus veritatis dignissimos suscipit! Maiores ut rerum exercitationem. Inventore nostrum mollitia commodi excepturi, quod architecto repudiandae velit voluptatibus dolorum. Veritatis quaerat voluptate explicabo autem facilis deserunt eos, accusantium eaque eveniet magnam quia est adipisci dolorum excepturi enim tempora provident pariatur modi vero suscipit expedita reiciendis iusto. Recusandae temporibus quos obcaecati, corrupti atque fuga deserunt impedit. Similique facere expedita magni minus consectetur quasi alias excepturi velit, incidunt dolor adipisci nemo, ipsam accusantium facilis illum vel repellendus optio aspernatur! Harum accusantium a officiis suscipit provident saepe, assumenda quas voluptatibus amet praesentium.
                </p>
            </div>  
            <div class="service-col">  
                <h3>Read and Earn</h3>
                <p>Ratione culpa maiores et omnis architecto quis voluptatibus veritatis dignissimos suscipit! Maiores ut rerum exercitationem. Inventore nostrum mollitia commodi excepturi, quod architecto repudiandae velit voluptatibus dolorum. Veritatis quaerat voluptate explicabo autem facilis deserunt eos, accusantium eaque eveniet magnam quia est adipisci dolorum excepturi enim tempora provident pariatur modi vero suscipit expedita reiciendis iusto. Recusandae temporibus quos obcaecati, corrupti atque fuga deserunt impedit. Similique facere expedita magni minus consectetur quasi alias excepturi velit, incidunt dolor adipisci nemo, ipsam accusantium facilis illum vel repellendus optio aspernatur! Harum accusantium a officiis suscipit provident saepe, assumenda quas voluptatibus amet praesentium. Sint ducimus vitae quaerat at sit iste maxime cupiditate aliquam eius impedit illo corporis praesentium, ipsa aperiam! Voluptates, corporis quibusdam! Placeat officia quaerat veniam nihil corporis delectus libero eos minus, expedita quam?</p>
            </div>
        </div>
    </section>
    <div class="index-footer">
    	<%@ include file="footer.jsp" %>
    </div>
  </body>
  
</html>
