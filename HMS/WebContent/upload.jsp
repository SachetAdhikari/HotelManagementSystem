<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="uploadPhoto" enctype="multipart/form-data">
    <input type="file" name="file" />
    <input type="text" name="table" />
    <input type="text" name="identity" />
    <input type="submit" value="Upload" />
  </form>
</body>
</html>