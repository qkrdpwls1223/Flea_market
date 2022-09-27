<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 삭제</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	int pageNum = Integer.parseInt(request.getParameter("num"));
	int board = Integer.parseInt(request.getParameter("board"));
	String sql = null;
	if (board == 1) {
		sql = "SELECT * FROM board where num like " + pageNum;
	}
	else if (board == 2) {
		sql = "SELECT * FROM board2 where num like " + pageNum;
	}
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	
	String user_name = (String)session.getAttribute("user_name");
	
	if (rs.getString("name").equals(user_name)) {
		if (board == 1) {			
			sql = "DELETE from board where num = " + pageNum + "";
		}
		else if (board == 2) {
			sql = "DELETE from board2 where num = " + pageNum + "";
		}
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		
		if (board == 1) {			
			sql = "DELETE from comment where bbsID = " + pageNum;
		}
		else if (board == 2) {
			sql = "DELETE from comment2 where bbsID = " + pageNum;
		}
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글 삭제가 완료되었습니다.')");
		script.println("location.href= 'writeList.jsp?board="+board+"&num="+pageNum+"'");
		script.println("</script>");
	}
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
 		script.println("alert('글 작성자만 삭제할 수 있습니다.')");
 		script.println("history.back()");
 		script.println("</script>");
	}
%>
</body>
</html>