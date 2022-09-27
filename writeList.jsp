<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" href="layout-style.css">
<style>
	#board {
		display: block;
		text-align: center;
	}
	#board table {
		margin: 20px auto;
		background-color: #dce0f3;
		width: 80%;
	}
	#board thead {
		height: 50px;
		padding: 20px;
		background-color: pink;
	}
	#board tbody {
		background-color: white;
	}
	td {
		height: 25px;
	}
	.price {
		display: block;
	}
	.button {
		background-color: hotpink;
		text-align: center;
		vertical-align: middle;
		width: 150px;
		margin: 20px 5% 50px 0px;
		float: right;
		line-height: 50px;
		font-weight: bold;
    }
    .button a {
		color: white;
		text-decoration: none;
    }
    .boardName {
		width: 70%;
		color: pink;
		margin: 0 auto;
		padding: 20px;
		text-align: center;
	}
</style>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%@ include file="header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	int board = Integer.parseInt(request.getParameter("board"));
	
	String sql = null;
	if (board == 1) {
		sql = "SELECT * FROM board";		
	}
	else {
		sql = "SELECT * FROM board2";
	}
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<div class="boardName">
<%
	if (board == 1) {
		out.println("<h1>중고마켓</h1>");
	}
	else if (board == 2) {
		out.println("<h1>작품마켓</h1>");
	}
%>
</div>
<div id="board">
	<table>
	<thead>
		<tr><td width="5%">상품번호</td><td width='100px'>상품이미지</td><td width='30%'>가격</td><td width="20%">상품이름</td><td width="15%">판매자</td><td width="25%">날짜</td><td width="5%">조회수</td></tr>
	</thead>
	<tbody>
		<%
			String img = null;
			while(rs.next()) {
				img = "./image/" + rs.getString("filepath");
				%> <tr>
				<td><%=rs.getInt("num") %></td>
				<td><img width='100px' height='100px' onerror="this.src='./image/Default.png'" src='<%=img %>'></td>
				<td><div class="price"><%=rs.getInt("price") %><b>원</b></div></td>
				<td><a href="contentRead.jsp?board=<%=board %>&num=<%=rs.getInt("num") %>"><%=rs.getString("subject") %></a></td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getTimestamp("date") %></td>
				<td><%=rs.getInt("readcount") %></td>
				</tr> <%
			}
		
			conn.close();
			pstmt.close();
		%>
	</tbody>
	</table>
</div>
<hr>
<div class="button"><a href="writeForm.jsp?board=<%=board%>">글쓰기</a></div>
</body>
</html>