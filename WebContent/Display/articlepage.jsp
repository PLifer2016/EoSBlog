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
	String ID = request.getParameter("ID");
	//链接数据库
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	String url = "jdbc:mysql://localhost:3306/EoSBlog";
	String dbAdmin = "root";
	String dbPassword = "123456";
	Connection conn = DriverManager.getConnection(url,dbAdmin,dbPassword);
	
	//验证用户名和密码
	String sql = "select * from article where arti_ID ='"+ID+"';";
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	String good = null,bad = null;
	while(rs.next()){
		String content = rs.getString("arti_content");
		good = rs.getString("good");
		bad = rs.getString("bad");
		%>
		<div>
		<%=content %>
		</div>
		<%
	}
	rs.close();
	stmt.close();
	conn.close();

%>
<div>
	<form action="../Backstage/goodorbad.jsp?ID=<%=ID %>&param=good" target="id_iframe" method="post">
		<input type="submit" value="赞" name="bad">
		<%=good %>
	</form>
	
	<form action="../Backstage/goodorbad.jsp?ID=<%=ID %>&param=bad" target="id_iframe" method="post">
		<input type="submit" value="踩" name="bad">
		<%=bad %>
	</form>
	<iframe id="id_iframe"name="id_iframe" width=0 height=0 frameborder=0></iframe>
</div>

<div>
	<div>
		<h2>评论</h2>
		<form method="post" action="../Backstage/comment.jsp?ID=<%=ID %>" >
			昵称：<input type="text" name="nickname" >
			邮箱：<input type="text" name="email" >
			评论内容：<input type="text" name="content">
			<input type="submit" value="提交">
		</form>
		
	</div>
	
	<div>
		<%
			String com_nickname = null;
			String com_time = null;
			String com_content=null;
			
			Connection com_conn = DriverManager.getConnection(url,dbAdmin,dbPassword);
			String com_sql = "select * from comment where arti_ID ='"+ID+"';";
			Statement com_stmt = com_conn.createStatement();
			ResultSet com_rs = com_stmt.executeQuery(com_sql);
			while(com_rs.next()){
				com_nickname = com_rs.getString("com_nickname");
				com_time = com_rs.getString("com_time");
				com_content = com_rs.getString("com_content");
				%>
				<div>
					<%=com_nickname %>在<%=com_time %>时评论：<br>
					<%=com_content %>
				</div>
				<% 
			}
			com_rs.close();
			com_stmt.close();
			com_conn.close();
		%>
	</div>
</div>
</body>
</html>