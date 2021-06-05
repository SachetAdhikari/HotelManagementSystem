package co.samundra.web;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import co.samundra.web.dao.user_credentialsDAO;

@WebServlet("/admin")
@MultipartConfig(
		  //fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  //maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  //maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
public class adminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public adminController() {
        super();
        // TODO Auto-generated constructor stub
    }
	//protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in admincontroller");
		PrintWriter out= response.getWriter();
		
		user_credentialsDAO uc = new user_credentialsDAO();
		String addroom=request.getParameter("addroom");
		String deleteroom=request.getParameter("deleteroom");
		String addservice=request.getParameter("addservice");
		String deleteservice=request.getParameter("deleteservice");
		String addfood=request.getParameter("addfood");
		String deletefood=request.getParameter("deletefood");
		String hotel=request.getParameter("hotel");
		if(addroom!=null) {
		String roomno=request.getParameter("roomno");
		System.out.println(roomno);
		String type=request.getParameter("roomtype");
		System.out.println(type);
		String rate=request.getParameter("roomrate");
		System.out.println(rate);
		String capacity=request.getParameter("roomcapacity");
		System.out.println(capacity);
		uc.adminroom(roomno,type,rate,capacity,hotel);
		response.sendRedirect("./admin.jsp");
		}
		else if(deleteroom!=null) {
			String droomno=request.getParameter("deleteroomno");
			uc.deleteroom(droomno,hotel);
			response.sendRedirect("./admin.jsp");
		}
		else if(addservice!=null) {
			String sname=request.getParameter("servicename");
			String srate=request.getParameter("servicerate");
			String sdesc=request.getParameter("servicedescription");
			Part filePart = request.getPart("file");
			if(filePart != null) {
				for (Part part : request.getParts()) {
					   part.write(System.getProperty("user.dir")+"\\HotelManagementSystem\\HMS\\WebContent\\static\\images\\"+sname+".png");
					}
			}
			uc.adminaddservice(sname, srate, sdesc,hotel);
			response.sendRedirect("./admin.jsp");
		}
		else if(deleteservice!=null) {
			String sname=request.getParameter("deleteservicename");
			uc.admindeleteservice(sname, hotel);
			response.sendRedirect("./admin.jsp");
		}
		else if(addfood!=null) {
			String name=request.getParameter("foodname");
			String rate=request.getParameter("foodrate");
			String type=request.getParameter("foodtype");
			String desc=request.getParameter("fooddescription");
			Part filePart = request.getPart("file");
			if(filePart != null) {
				for (Part part : request.getParts()) {
					   part.write(System.getProperty("user.dir")+"\\HotelManagementSystem\\HMS\\WebContent\\static\\images\\"+name+".png");
					}
			}
			uc.adminaddfood(name, rate, desc,type,hotel);
			response.sendRedirect("./admin.jsp");
			
		}
		else if(deletefood!=null) {
			String name=request.getParameter("deletefoodname");
			uc.admindeletefood(name, hotel);
			response.sendRedirect("./admin.jsp");
	
		}
		
	}
}
