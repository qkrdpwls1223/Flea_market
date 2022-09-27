<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Join Page</title>
    <link rel="stylesheet" href="layout-style.css">
    <style>
        #title {
            padding: 20px;
            height: 50px;
            font-size: 30px;
            font-weight: bold;
            text-align: center;
        }
        #join {
            width: 500px;
            height: 540px;
            align-items: center;
            margin: 30px auto;
            padding-top: 20px;
            padding-bottom: 40px;
            border: 2px solid #969ba1;
            border-radius: 20px;
            background-color: #fffbfc;
        }

        .container {
            margin: 0 auto;
            width: 80%;
        }

        span.psw {
            float: right; /*레이아웃*/
            padding-top: 16px;
        }

        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block; /*요소 정의*/
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        #phone input[type=text], select {
            width: 30%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        button {
        	float: right;
            background-color: hotpink;
            color: white;
            padding: 14px 20px;
            margin: 20px 0;
            border: none;
            width: 100%;
            cursor: pointer;
        }

            button:hover {
                background-color: royalblue;
            }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    <%
	    if(user_name != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 회원입니다.')");
			script.println("location.href= 'main.jsp'");
			script.println("</script>");
		}
    %>
    <div id="join">
        <h1 class="container">Create account</h1>
        <br />
        <form action="join.jsp" method="post">
            <div class="container">
                <label for="name"><b>Your name</b></label>
                <input type="text" placeholder="First and last name" name="name" required>

                <label for="email"><b>Email</b></label>
                <input type="text" name="email" required>

                <label for="psw"><b>Password</b></label>
                <input type="password" placeholder="At least 6 characters" name="psw" required>

                <label for="psw"><b>Re-enter password</b></label>
                <input type="password" name="psw" required>

                <label for="mobileNumber"><b>Mobile number</b></label>
                <br />
                <div id="phone">
                    <select name="phone1">
                        <option>010</option>
                        <option>011</option>
                        <option>016</option>
                        <option>017</option>
                        <option>018</option>
                        <option>019</option>
                    </select>
                    - <input type="text" name="phone2" size="4" required>
                    - <input type="text" name="phone3" size="4" required>
                </div>
                <button type="submit">Create</button>
            </div>
        </form>
    </div>
</body>
</html>