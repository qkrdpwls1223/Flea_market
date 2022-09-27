<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<style type="text/css">
	.recommend {
		margin: 0 auto;
		padding: 50px;
	}
	.product {
		padding: 10px;
		width: 220px;
		background-color: white;
		float: left;
	}
</style>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%@ include file="header.jsp" %>
<%
	String sql = "select * from board where readcount = (select max(readcount) from board)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
%>
	<div class="recommend">
		<h2>추천 상품</h2>
		<div class="product">
			<table>
			<tr><td><a href="contentRead.jsp?board=1&num=<%=rs.getInt("num") %>"><img width='200px' height='200px' onerror="this.src='./image/Default.png'" src='<%="./image/" + rs.getString("filepath") %>'></a></td></tr>
			<tr><td><a href="contentRead.jsp?board=1&num=<%=rs.getInt("num") %>"><%=rs.getString("subject") %></a></td></tr>
			<tr><td><%=rs.getInt("price") %><b>원</b></td></tr>
			</table>
		</div>
<%
	sql = "select * from board where num = (select max(num) from board)";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	rs.next();
%>
		<div class="product">
			<table>
			<tr><td><a href="contentRead.jsp?board=1&num=<%=rs.getInt("num") %>"><img width='200px' height='200px' onerror="this.src='./image/Default.png'" src='<%="./image/" + rs.getString("filepath") %>'></a></td></tr>
			<tr><td><a href="contentRead.jsp?board=1&num=<%=rs.getInt("num") %>"><%=rs.getString("subject") %></a></td></tr>
			<tr><td><%=rs.getInt("price") %><b>원</b></td></tr>
			</table>
		</div>
<%
	sql = "select * from board2 where num = (select max(num) from board2)";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	rs.next();
%>
		<div class="product">
			<table>
			<tr><td><a href="contentRead.jsp?board=2&num=<%=rs.getInt("num") %>"><img width='200px' height='200px' onerror="this.src='./image/Default.png'" src='<%="./image/" + rs.getString("filepath") %>'></a></td></tr>
			<tr><td><a href="contentRead.jsp?board=2&num=<%=rs.getInt("num") %>"><%=rs.getString("subject") %></a></td></tr>
			<tr><td><%=rs.getInt("price") %><b>원</b></td></tr>
			</table>
		</div>
<%
	sql = "select * from board2 where readcount = (select max(readcount) from board2)";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	rs.next();
%>
		<div class="product">
			<table>
			<tr><td><a href="contentRead.jsp?board=2&num=<%=rs.getInt("num") %>"><img width='200px' height='200px' onerror="this.src='./image/Default.png'" src='<%="./image/" + rs.getString("filepath") %>'></a></td></tr>
			<tr><td><a href="contentRead.jsp?board=2&num=<%=rs.getInt("num") %>"><%=rs.getString("subject") %></a></td></tr>
			<tr><td><%=rs.getInt("price") %><b>원</b></td></tr>
			</table>
		</div>
	</div>
</body>
</html>