<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8"); 
		String title = request.getParameter("title");
		String content = request.getParameter("editorValue");
		String author = "PLifer";
		String ID = request.getParameter("ID");
		
		//out.println(title);
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		String url = "jdbc:mysql://localhost:3306/EoSBlog";
		String dbAdmin = "root";
		String dbPassword = "123456";
		Connection conn = DriverManager.getConnection(url,dbAdmin,dbPassword);
		
		String sql = "update article set arti_content='"+content+"' where arti_ID='"+ID+"';";
		
		//out.print(sql);
		Statement stmt = conn.createStatement();
		int flag = stmt.executeUpdate(sql);
		if(flag!=0){
			out.print("Update successfully!");
		}else{
			out.print("Failed to update!");
		}
		
		stmt.close();
		conn.close();
	%>
</body>
</html>