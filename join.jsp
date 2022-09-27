<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%
		if(user_email != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 가입된 회원입니다.')");
			script.println("location.href= 'main.jsp'");
			script.println("</script>");
		}
	%>
	<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
	
		//회원가입 정보
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pw = request.getParameter("psw");
		
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phoneNumber = phone1 + "-" + phone2 + "-" + phone3;
		
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO members(EMAIL, PW, NAME, PHONE) VALUES(?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setString(4, phoneNumber);
		
		try {
			pstmt.executeUpdate();
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('가입이 완료되었습니다.')");
			script.println("location.href= 'main.jsp'");
			script.println("</script>");
		} catch (SQLException ex) {
			if (ex.getErrorCode() == 1062) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 사용중인 Email입니다.')");
				script.println("location.href= 'createAccount.jsp'");
				script.println("</script>");
			}
			else {
				out.println("MEMBERS 테이블 삽입 실패");
				out.println("SQLException: " + ex.getMessage());
			}
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	%>
</body>
</html>