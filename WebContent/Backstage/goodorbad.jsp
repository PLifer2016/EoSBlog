<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8"); 
	String flag = request.getParameter("param");
	String ID = request.getParameter("ID");
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	String url = "jdbc:mysql://localhost:3306/EoSBlog";
	String dbAdmin = "root";
	String dbPassword = "123456";
	Connection conn = DriverManager.getConnection(url,dbAdmin,dbPassword);
	
	String sql = null;
	if(flag.equals("good")==true){
		sql = "update article set good=good+1 where arti_ID='"+ID+"';";
	}
	else{
		sql = "update article set bad=bad+1 where arti_ID='"+ID+"';";
	}
	
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	
	stmt.close();
	conn.close();
	
%>