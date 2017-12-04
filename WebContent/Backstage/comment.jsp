<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String nickname = request.getParameter("nickname");
	String email = request.getParameter("email");
	String content = request.getParameter("content");
	String ID = request.getParameter("ID");
	//链接数据库
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	String url = "jdbc:mysql://localhost:3306/EoSBlog";
	String dbAdmin = "root";
	String dbPassword = "123456";
	Connection conn = DriverManager.getConnection(url,dbAdmin,dbPassword);
	
	String sql = "insert into comment (com_nickname,com_email,arti_ID,com_content,com_time)values('"+nickname+"','"+email+"','"+ID+"','"+content+"',now());";
	Statement stmt = conn.createStatement();
	
	int flag = stmt.executeUpdate(sql);
	if(flag!=0){
		out.print("Comment successfully!");
	}else{
		out.print("Failed to Comment!");
	}
	
	stmt.close();
	conn.close();
%>
</body>
</html>