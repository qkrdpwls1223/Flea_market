<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String email = request.getParameter("email");
	String pw = request.getParameter("psw");
	
	String sql = "SELECT * FROM members WHERE email LIKE '" + email + "'";
	try {
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()) {
			if ( pw.equals(rs.getString("pw")) ) {
				session.setAttribute("user_email", email);
				session.setAttribute("user_name", rs.getString("name"));
				
				response.sendRedirect("main.jsp");
			} else {
				%>
				<script>
				alert("비밀번호를 틀렸습니다.");
			 	location.href= "login.jsp";
				</script>
				<%
			}
		} else {
			%>
			<script>
			alert("존재하지 않는 아이디입니다.");
		 	location.href= "login.jsp";
			</script>
			<%
		}
	} catch(Exception e) {
		e.printStackTrace();
%>
		<script>
		alert("로그인 실패");
	 	location.href= "login.jsp";
		</script>
<%
	}
%>
</body>
</html>