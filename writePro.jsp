<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<%@ include file="dbconn.jsp" %>
<%
	//request.setCharacterEncoding("UTF-8");

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
	//String subject = request.getParameter("subject");
	//String content = request.getParameter("content");
	//int readcount = 0;
	//Timestamp reg_date = new Timestamp(System.currentTimeMillis());
	
	int board = Integer.parseInt(request.getParameter("board"));
	String sql = null;
	if (board == 1) {
		sql = "SELECT max(NUM) FROM board";
	}
	else if (board == 2) {
		sql = "SELECT max(NUM) FROM board2";
	}
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	int num = 0;
	if(rs.next()) {
		num = rs.getInt("max(num)") + 1;
	}

	
	//try {		
		String savePath = "C:\\jsp-work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\JSPStudy\\image";
		String encType = "utf-8";
		int sizeLimit = 10 * 1024 * 1024; //10MB

		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, encType, new DefaultFileRenamePolicy());
		
		int price = Integer.parseInt(multi.getParameter("price"));
		String subject = multi.getParameter("subject");
		String content = multi.getParameter("content");
		int readcount = 0;
		Timestamp reg_date = new Timestamp(System.currentTimeMillis());
		
		Enumeration<?> files = multi.getFileNames();
		String fileName = (String) files.nextElement();
		String fileSystemName = multi.getFilesystemName(fileName);
		
		if (board == 1) {
			sql = "INSERT INTO board(num, name, price, subject, content, readcount, date, filepath) VALUES(?,?,?,?,?,?,?,?)";			
		}
		else if (board == 2) {
			sql = "INSERT INTO board2(num, name, price, subject, content, readcount, date, filepath) VALUES(?,?,?,?,?,?,?,?)";
		}
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.setString(2, name);
		pstmt.setInt(3, price);
		pstmt.setString(4, subject);
		pstmt.setString(5, content);
		pstmt.setInt(6, readcount);
		pstmt.setTimestamp(7, reg_date);
		pstmt.setString(8, fileSystemName);
		
		pstmt.executeUpdate();
		
		response.sendRedirect("writeList.jsp?board="+board);
	/*
	} catch (IOException ioe) {
		System.out.println(ioe);
	} catch (Exception ex) {
		System.out.println(ex);
	}*/
%>