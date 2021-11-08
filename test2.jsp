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
<%
Thread.sleep(5000);
%>
	<table>
	<tr class="member">
		<td>id
		<td>pw
		<td>ssn
		<td>pnum
		
<%

Connection conn=null;
PreparedStatement pstmt = null;
ResultSet rs = null;
try{
    Context initContext = new InitialContext();
    Context envContext  = (Context)initContext.lookup("java:/comp/env");
    DataSource ds = (DataSource)envContext.lookup("jdbc/TestDB");
    conn = ds.getConnection();


String sql="select * from member";

pstmt=conn.prepareStatement(sql);
rs = pstmt.executeQuery();

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
		if(pstmt != null)			
			pstmt.close();
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