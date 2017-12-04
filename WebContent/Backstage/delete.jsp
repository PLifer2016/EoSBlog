<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除文章</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String ID = request.getParameter("ID");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	String url = "jdbc:mysql://localhost:3306/EoSBlog";
	String dbAdmin = "root";
	String dbPassword = "123456";
	Connection conn = DriverManager.getConnection(url,dbAdmin,dbPassword);
	
	String sql = "delete from article where arti_ID='"+ID+"';";
	Statement stmt = conn.createStatement();
	int flag = stmt.executeUpdate(sql);
	out.println(ID);
	if(flag!=0){
		out.print("Delete successfully!");
	}else{
		out.print("Failed to delete!");
	}
	stmt.close();
	conn.close();
	%>
</body>
</html>