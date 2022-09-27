<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글읽기</title>
<style>
	.boardName {
		width: 70%;
		color: pink;
		margin: 0 auto;
		padding: 20px;
		text-align: center;
	}
	.content {
		width: 70%;
		height: auto;
		padding: 20px;
		display: block;
		text-align: left;
		margin: 20px auto;
		background-color: white;
		border: 1px solid #969ba1;
		border-radius: 5px;
	}
	.content hr {
		margin-top: 15px;
		margin-bottom: 15px;
	}
	.contentText {
		display: block;
		height: 80%;
	}
	.commentWrite {
		float: left;
		padding: 50px;
		display: inline-block;
	}
	.button {
	
		text-align: right;
	}

</style>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%	
	request.setCharacterEncoding("UTF-8");
	int board = Integer.parseInt(request.getParameter("board"));
	int num = Integer.parseInt(request.getParameter("num"));
	
	String sql = null;
	if (board == 1) {
		sql = "SELECT * FROM board where num like " + num;
	}
	else if (board == 2) {
		sql = "SELECT * FROM board2 where num like " + num;
	}
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
%>
<%@ include file="header.jsp" %>
<%
if(rs.next()) {
	//조회수 업데이트
	if (board == 1) {
		sql = "UPDATE board SET readcount = " + (rs.getInt("readcount") + 1) + " WHERE num = " + num;
	}
	else if (board == 2) {
		sql = "UPDATE board2 SET readcount = " + (rs.getInt("readcount") + 1) + " WHERE num = " + num;
	}
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
}
else {
	out.println("페이지 번호가 잘못되었습니다.");
}
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
<div class="content">
	<h2><%=rs.getString("subject") %></h2>
	<p>작성자 : <%=rs.getString("name") %></p>
	<p>조회수 : <%=rs.getInt("readcount") + 1 %></p>
	<hr>
	
	<div class="contentText">
		<%
			if(rs.getString("filepath") != null) {
				out.println("<img src='./image/"+rs.getString("filepath")+"' class='image' width='auto'>");
			}
		%>
		<script>
			window.onload = function() {
				var img = document.querySelector("img");
				if (img.offsetWidth > 500) {
			    	img.width = 500;
			    	img.style.width = '500px';
				}
			}

		</script>
		<p><%=rs.getString("content") %></p>
	</div>
	
	<div class="button">
		<form>
			<input type="button" value="수정" onclick="location.href='updateForm.jsp?board=<%=board %>&num=<%=num %>'">
			<input type="button" value="삭제" onclick="location.href='contentDelete.jsp?board=<%=board%>&num=<%=num %>'">
			<input type="button" value="목록으로" onclick="location.href='writeList.jsp?board=<%=board %>'">
		</form>
	</div>
	<hr>
	<h3>댓글</h3>
<%
	if (board == 1) {
		sql = "select * from comment where bbsId = (select num from board where num=" + num + ")";		
	}
	else {
		sql = "select * from comment2 where bbsId = (select num from board2 where num=" + num + ")";
	}
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>
	<table class="commentTable">
	<%
			String img = null;
			while(rs.next()) {
				%> <tr>
				<td><%=rs.getString("userID") + " :" %>&nbsp;</td>
				<td width="60%"><%=rs.getString("commentText") %></td>
				<td><%=rs.getTimestamp("date") %></td>
				</tr> <%
			}
		
			conn.close();
			pstmt.close();
	%>
	</table>
	<div class="commentWrite">
		<form action="commentPro.jsp?board=<%=board %>&num=<%=num %>" method="post">
			<input type="text" placeholder="댓글을 입력해주세요." name="comment" required>
			<button type="submit">댓글작성</button>
		</form>
	</div>
</div>
</body>
</html>