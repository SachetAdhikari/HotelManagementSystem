package co.samundra.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
/* The Java file upload Servlet example */
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/uploadPhoto")
@MultipartConfig(
		  //fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  //maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  //maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
public class fileController extends HttpServlet {

	private static final long serialVersionUID = 1L;

public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Part filePart = request.getPart("file");
    String fileName = filePart.getSubmittedFileName();
    for (Part part : request.getParts()) {
      part.write(System.getProperty("user.dir")+"\\HotelManagementSystem\\HMS\\WebContent\\static\\photo.png");
      System.out.println("photo uploaded");
      System.out.println(System.getProperty("user.dir") ) ;
    }
    
  }

}