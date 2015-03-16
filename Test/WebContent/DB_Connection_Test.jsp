<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DB_Connection</title>
</head>
<body>
<%
	
	Connection conn = null;
	
	try {
		String url = "jdbc:mysql://localhost:3306/Pengpark";
		String id = "root";
		String pw = "miswneh8";
		
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con = DriverManager.getConnection(url, "Pengpark", "miswneh8");
		out.println("Mysql 데이터베이스 db에 성공적으로 접속했습니다");
		con.close();	
	}
	
	catch (Exception e) {
		out.println("Mysql 데이터베이스 db 접속에 문제가 있습니다. <hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
</body>
</html>