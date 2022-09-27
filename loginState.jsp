<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="layout-style.css">
<style>
	#state {
		padding-right: 5%;
		margin: 5px;
		float: right;
		font-size: 12px;
	}
</style>
</head>
<body>
<%
	String user_email = (String)session.getAttribute("user_email");
	String user_name = (String)session.getAttribute("user_name");
%>

<div id="state">
<%
	if(user_email != null) {
		%>
		<%=user_name %> (<%=user_email %>) 님 환영합니다!
		<a href="logout.jsp">로그아웃</a>
		<%
	} else {
		out.println("Guest 상태입니다!");
		%>
		<a href="login.jsp">로그인</a>
		<%
	}
%>
</div>
</body>
</html>