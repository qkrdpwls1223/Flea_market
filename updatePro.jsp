<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	int pageNum = Integer.parseInt(request.getParameter("num"));
	int board = Integer.parseInt(request.getParameter("board"));
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	String sql = "UPDATE board SET subject=?, content=? WHERE num=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, subject);
	pstmt.setString(2, content);
	pstmt.setInt(3, pageNum);
	pstmt.executeUpdate();
	
	response.sendRedirect("contentRead.jsp?board="+board+"&num=" + pageNum);
%>