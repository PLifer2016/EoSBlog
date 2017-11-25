<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LOGIN CHECK</title>
</head>
<body>
<%
	String username0 = request.getParameter("username");
	String password0 = request.getParameter("password");
	boolean validated = false;  //验证标识
	
	//链接数据库
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	String url = "jdbc:mysql://localhost:3306/EoSBlog";
	String dbAdmin = "root";
	String dbPassword = "123456";
	Connection conn = DriverManager.getConnection(url,dbAdmin,dbPassword);
	
	//验证用户名和密码
	String sql = "select * from admin";
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
		if(rs.getString("adminName").trim().compareTo(username0)==0
			&& rs.getString("adminPassword").trim().compareTo(password0)==0){
			validated = true;
		}
	}
	
	rs.close();
	stmt.close();
	conn.close();
	
	if(validated){
    	response.sendRedirect("../utf8-jsp/index.html");
        return;        
	}
	else{
		
	}
	
%>
</body>
</html>