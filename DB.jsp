<%@page import="java.sql.Statement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table>
	<tr class="member">
		<td>id
		<td>pw
		<td>ssn
		<td>pnum
		
<%

Connection conn=null;
Statement stmt =null;
ResultSet rs = null;
try{
 	String url ="jdbc:mariadb://192.168.124.194:3306/test";
 	String user ="cywell";
 	String pass ="qwer1234";
 	Class.forName("org.mariadb.jdbc.Driver");
 
 	String sql="select * from member";
 	
 	conn = DriverManager.getConnection(url, user, pass);
 	stmt = conn.createStatement();
	rs   = stmt.executeQuery(sql);

while(rs.next()){
	String id = rs.getString("id");
	String pw = rs.getString("pw");
	String ssn = rs.getString("ssn");
	String pnum = rs.getString("pnum");
	

%>
	<tr>
		<td><%=id %>
		<td><%=pw %>
		<td><%=ssn %>
		<td><%=pnum %>	
<% }
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		if(rs != null)
			try{rs.close();}catch(SQLException sqle){}
		if(stmt != null)			
			stmt.close();
		if(conn != null)
			conn.close();
	}

%>
	</table>
	<form action="memberInsert.jsp">
		<input type="submit" value="insert">
	</form>
</body>
</html>