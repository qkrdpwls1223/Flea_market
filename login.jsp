<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="layout-style.css">
    <style>
        #title {
            padding: 20px;
            height: 50px;
            font-size: 30px;
            font-weight: bold;
            text-align: center;
        }
        #signIn {
            width: 500px;
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

        button {
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
	<div id="signIn">
        <h1 class="container">Sign-In</h1>
        <br />
        <form action="loginOk.jsp" method="post">
            <div class="container">
                <label for="email"><b>Email</b></label>
                <input type="text" placeholder="Enter email" name="email" required>

                <label for="psw"><b>Password</b></label>
                <input type="password" placeholder="Enter password" name="psw" required>

                <button type="submit">Login</button>
                <span class="psw">Forgot <a href="#">password?</a></span>
            </div>
        </form>
    </div>
</body>
</html>