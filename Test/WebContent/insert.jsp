<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.regex.Pattern" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String regdate = request.getParameter("regdate");
	String content = request.getParameter("content");
	
	if(title == "" || title == null) out.println("title이 null입니다.");
	if(writer == "" || writer == null) out.println("writer가 null입니다.	");
	else if(!Pattern.matches("^[a-zA-Z0-9]+@[a-zA-Z0-9]+$", writer)) out.println("이메일 형식이 아닙니다.");
	
	try {
		String url = "jdbc:mysql://localhost:3306/Pengpark";
		String id = "root";
		String pw = "miswneh8";
		
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con = DriverManager.getConnection(url, "Pengpark", "miswneh8");
		out.println("Mysql 데이터베이스 db에 성공적으로 접속했습니다");
		
		Statement stmt = con.createStatement();
		
		String sql = "INSERT INTO Pengpark.board" + 
		"(idx, title, writer, regdate, count, content)" + 
				"VALUES("+ 2 +", '"+title+"', '"+writer+"', now(), '1', '"+content+"')";
		stmt.executeUpdate(sql);
		
		con.close();	
	}
	
	catch (Exception e) {
		out.println("Mysql 데이터베이스 db 접속에 문제가 있습니다. <hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
	
	finally {
		out.print("<script>location.href='index.jsp';</script>");
	}
	
%>
</head>
<body>
</body>
</html>