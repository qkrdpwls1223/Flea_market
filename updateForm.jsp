<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="layout-style.css">
<style>
	#writeForm {
		width: 70%;
		display: block;
		text-align: center;
		margin: 20px auto;
	}
	#content {
		width: 100%;
		display: inline-block;
	}
	input[type=text] {
		width: 70%;
		padding: 12px 20px;
		margin: 8px 0;
		display: inline-block;
		border: 1px solid #ccc;
		box-sizing: border-box;
	}
	textarea {
		margin: 20px;
		padding: 20px;
		width: 85%;
		height: 500px;
		resize: none;
		box-sizing: border-box;
	}
	button {
		background-color: hotpink;
		color: white;
		padding: 14px 20px;
		margin: 20px;
		border: none;
		width: 200px;
		cursor: pointer;
    }
    .content hr {
    	margin: 10px auto;
    	display: inline-block;
    }
    .upload {
    	width: 100%;
    	height: 40px;
    	display: inline-block;
    	float: left;
    }
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	int board = Integer.parseInt(request.getParameter("board"));
	int pageNum = Integer.parseInt(request.getParameter("num"));

	String sql = "SELECT * FROM board where num = " + pageNum;
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	
	if (rs.getString("name").equals(user_name) == false) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
 		script.println("alert('글 작성자만 수정할 수 있습니다.')");
 		script.println("history.back()");
 		script.println("</script>");
	}
%>
<div id="writeForm">
	<div id="content">
		<form action="updatePro.jsp?board=<%=board%>&num=<%=pageNum %>" method="post">
			<input type="hidden" name="num" value="<%=pageNum %>">
			<label for="subject"><b>글 제목</b>&nbsp;</label>
			<input type="text" name="subject" value="<%=rs.getString("subject") %>">
			<hr>
			<textarea name="content" placeholder="글 내용을 작성해주세요."><%=rs.getString("content") %></textarea>
			<div class="upload">
				<label for="image"><b>이미지 재</b></label>
				<input type="file" name="fileName" accept="image/png, image/jpeg">
			</div>
			<hr>
			
			<button type="submit">수정</button>
		</form>
	</div>
</div>
</body>
</html>