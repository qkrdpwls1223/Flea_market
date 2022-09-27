<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String user_email = (String)session.getAttribute("user_email");
	
	String name = request.getParameter("name");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String phoneNumber = phone1 + "-" + phone2 + "-" + phone3;
	
	String sql = "UPDATE members SET name=?, phone=? WHERE email=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, phoneNumber);
	pstmt.setString(3, user_email);
	pstmt.executeUpdate();
	
	response.sendRedirect("myPage.jsp");
%>