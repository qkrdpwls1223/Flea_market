<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%@ include file="header.jsp" %>
<%
	if(user_name == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 후 이용 가능합니다.')");
		script.println("location.href= 'login.jsp'");
		script.println("</script>");
	}

	String sql = "SELECT * FROM members where email = '" + user_email + "'";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
%>
	<p>이메일 : <%=rs.getString("email") %></p>
	<p>이름 : <%=rs.getString("name") %></p>
	<p>전화번호 : <%=rs.getString("phone") %></p>
	<form>
		<input type="button" value="개인정보수정" onclick="location.href='myUpdateForm.jsp'">
	</form>
</body>
</html>