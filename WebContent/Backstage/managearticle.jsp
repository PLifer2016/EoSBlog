<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理文章</title>
</head>
<body>
	<%
	int i=1;
	request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	String url = "jdbc:mysql://localhost:3306/EoSBlog";
	String dbAdmin = "root";
	String dbPassword = "123456";
	Connection conn = DriverManager.getConnection(url,dbAdmin,dbPassword);
	
	String sql = "select * from article";
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	%>
		<table border="1" cellspacing="0">
			<tr>
				<td>文章</td>
				<td>标题</td>
				<td>编辑时间</td>
				<td>标签</td>
				<td>编辑操作</td>
				<td>删除操作</td>
			</tr>
	<% 
	while(rs.next()){
		%>
			<tr>
				<td><%=i++ %></td>
				<td><%=rs.getString("arti_title") %></td>
				<td><%=rs.getString("arti_date") %></td>
				<td><%=rs.getString("arti_class") %></td>
				<td><a href="../utf8-jsp/editorarticle.jsp?ID=<%=rs.getString("arti_ID")%>">编辑</a></td>
				<td><a href="delete.jsp?ID=<%=rs.getString("arti_ID")%>">删除</a></td>
			</tr>
		<%
	}
	rs.close();
	stmt.close();
	conn.close();
	%>
	</table>
	<% 
	%>
</body>
</html>