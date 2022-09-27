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
	input[type=text], input[type=number] {
		width: 70%;
		padding: 12px 20px;
		margin: 8px 0;
		display: inline-block;
		border: 1px solid #ccc;
		box-sizing: border-box;
	}
	.title {
		width: 100%;
		float: left;
		display: inline-block;
	}
	.subject {
	}
	.price {
		width: 100%;
	}
	.price input[type=text] {
		width: 30%;
	}
	textarea {
		padding: 20px;
		margin: 10px;
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
<%
	int board = Integer.parseInt(request.getParameter("board"));
	if(user_name == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 후 작성 가능합니다.')");
		script.println("location.href= 'login.jsp'");
		script.println("</script>");
	}
%>
<div id="writeForm">
	<div id="content">
		<form action="writePro.jsp?board=<%=board %>" method="post" encType = "multipart/form-data">
			<div class='title'>
				<div class="subject">
					<label for="subject"><b>상품 이름</b>&nbsp;</label>
					<input type="text" name="subject" placeholder="Enter A Title" required>
				</div>
				<div class="price">
					<label for="price"><b>가격</b>&nbsp;</label>
					<input type="number" name="price" min="100" required > <b>원</b>
				</div>
			</div>
			<div>
				<hr>
				<textarea name="content" placeholder="글 내용을 작성해주세요."></textarea>
			</div>
			<div class="upload">
				<label for="image"><b>이미지 업로드</b></label>
				<input type="file" name="fileName" accept="image/png, image/jpeg" required>
			</div>
			<br>
			<hr>
			<button type="submit">상품 게시</button>
		</form>
	</div>
</div>
</body>
</html>