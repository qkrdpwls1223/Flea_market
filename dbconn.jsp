<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	Connection conn = null;

	//DB 정보
	String url = "jdbc:mysql://182.31.244.79:3306/jspstudydb";
	String user = "root";
	String password = "1234";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
		
	} catch (ClassNotFoundException ex) {
		out.println("드라이버 로딩 실패");
		out.println("SQLException: " + ex.getMessage());
	} catch(SQLException ex){
            System.out.println("에러: " + ex);
	}
%>
</body>
</html>