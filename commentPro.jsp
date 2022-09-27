<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	int board = Integer.parseInt(request.getParameter("board"));
	int num = Integer.parseInt(request.getParameter("num"));
	String name = (String)session.getAttribute("user_name");
	
	if(name == null) {
		%>
		<script>
		alert("로그인 후 작성 가능합니다.");
	 	location.href= "login.jsp";
		</script>
		<%
	}
%>
<%
	String sql = null;
	if (board == 1) {
		sql = "SELECT max(commentID) FROM comment where bbsId = (select num from board where num = " + num + ")";
	}
	else if (board == 2) {
		sql = "SELECT max(commentID) FROM comment2 where bbsId = (select num from board2 where num = " + num + ")";
	}
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	int commentNum = 0;
	if(rs.next()) {
		commentNum = rs.getInt("max(commentID)") + 1;
	}

	
	//try {		
		String commentText = request.getParameter("comment");
		Timestamp reg_date = new Timestamp(System.currentTimeMillis());
		String user_name = (String)session.getAttribute("user_name");
		
		if (board == 1) {
			sql = "INSERT INTO comment(commentID, bbsID, userID, commentText, commentAvailable, date) VALUES(?,?,?,?,?,?)";
		}
		else if (board == 2) {
			sql = "INSERT INTO comment2(commentID, bbsID, userID, commentText, commentAvailable, date) VALUES(?,?,?,?,?,?)";
		}
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, commentNum);
		pstmt.setInt(2, num);
		pstmt.setString(3, user_name);
		pstmt.setString(4, commentText);
		pstmt.setInt(5, 0);
		pstmt.setTimestamp(6, reg_date);

		pstmt.executeUpdate();

		//response.sendRedirect("contentRead.jsp?board="+board+"&num="+num);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('댓글 작성이 완료되었습니다.')");
		script.println("location.href='contentRead.jsp?board="+board+"&num="+num+ "'");
		out.println("댓글작성 완료");
		script.println("</script>");
	/*
	} catch (IOException ioe) {
		System.out.println(ioe);
	} catch (Exception ex) {
		System.out.println(ex);
	}*/
%>