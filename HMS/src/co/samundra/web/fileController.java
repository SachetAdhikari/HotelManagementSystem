package co.samundra.web;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

@MultipartConfig(
		  //fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  //maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  //maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
public class fileController{
	public void savePic(HttpServletRequest request) throws ServletException, IOException {
	final String path = System.getProperty("user.dir")+"\\HotelManagementSystem\\HMS\\WebContent\\static\\images\\";
	 final Part filePart = request.getPart("file");
	 final String fileName = request.getAttribute("identityname")+".jpg";

	 OutputStream out = null;
	 InputStream fileContent = null;

	 try {
	  out = new FileOutputStream(new File(path + File.separator
	      + fileName));
	  fileContent = filePart.getInputStream();

	  int read = 0;
	  final byte[] bytes = new byte[1024];

	  while ((read = fileContent.read(bytes)) != -1) {
	   out.write(bytes, 0, read);
	  }
	  System.out.println("New file " + fileName + " created at " + path);

	 } catch (FileNotFoundException fne) {
		 System.out.println("You either did not specify a file to upload or are "
	      + "trying to upload a file to a protected or nonexistent "
	      + "location.");
		 System.out.println("<br/> ERROR: " + fne.getMessage());

	 } finally {
	  if (out != null) {
	   out.close();
	  }
	  if (fileContent != null) {
	   fileContent.close();
	  }
	 }
	}
}

