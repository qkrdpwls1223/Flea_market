<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>
<style type="text/css">
	.form {
		width: 500px;
		height: 300px;
		align-items: center;
		margin: 30px auto;
		padding: 20px;
		border: 2px solid #969ba1;
		border-radius: 20px;
		background-color: #fffbfc;
	}
	.email {
		margin: 20px 0px 20px 0px;
	}
	.name input[type=text] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }
    .phone input[type=text], select {
        width: 30%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }    
</style>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%@ include file="header.jsp" %>
<%
	String sql = "SELECT * FROM members where email = '" + user_email + "'";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
	
	String phone1 = "";
	String phone2 = "";
	String phone3 = "";
	
	if(rs.getString("phone") != null) {
		phone1 = rs.getString("phone").substring(0, 3);
		phone2 = rs.getString("phone").substring(4, 7);
		phone3 = rs.getString("phone").substring(9, 12);
	}
%>
<div class="form">
	<div class="email">
		<b>이메일 : <%=rs.getString("email") %></b>
	</div>
	<form action="myUpdatePro.jsp" method="post">
		<div class="name">
			<label for="image"><b>이름</b></label>
			<input type="text" value="<%=rs.getString("name") %>" name="name" required>
		</div>
		<div class="phone">
			<label for="image"><b>전화번호</b></label>
			<div>
	        <select name="phone1">
	            <option selected>010</option>
	            <option>011</option>
	            <option>016</option>
	            <option>017</option>
	            <option>018</option>
	            <option>019</option>
	        </select>
	        - <input type="text" value="<%=phone2 %>" name="phone2" size="4">
	        - <input type="text" value="<%=phone3 %>" name="phone3" size="4">
			</div>
        </div>
        <button type="submit">수정</button>
	</form>
</div>
</body>
</html>