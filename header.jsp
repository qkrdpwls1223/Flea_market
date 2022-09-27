<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="layout-style.css">
<style>
        #title {
            padding: 20px;
            height: 50px;
            font-size: 30px;
            font-weight: bold;
            text-align: center;
        }

        .header {
            display: inline-block;
            width: 100%;
        }

        .header ul {
            list-style-type: none;
        }
        #userMenu {
            height: 25px;
            padding-right: 5%;
            margin: 0 auto;
            display: inline-block;
            float: right;
        }

        #userMenu ul li {
            background-color: #dce0f3;
            line-height: 25px;
            float: left;
            text-align: center;
            color: black;
            vertical-align: middle;
            position: relative;
        }

        #topMenu {
            width: 610px;
            margin: 0 auto;
        }

        #topMenu ul li {
            line-height: 60px;
            color: hotpink;
            float: left;
            text-align: center;
            vertical-align: middle;
        }

        .menuLink {
            text-decoration: none;
            display: block;
            width: 300px;
            color: hotpink;
            font-size: 20px;
            font-weight: bold;
        }
		.menuLink:visited {
			color: hotpink;
		}
		.usermenuLink:visited {
			color: black;
		}
        .usermenuLink, .submenuLink {
            text-decoration: none;
            display: block;
            width: 80px;
            font-size: 12px;
            font-weight: bold;
        }

        .userMenuList:hover .menuLink {
            color: yellow;
            background-color: #4d4d4d;
        }

        .userMenuList:hover .submenu {
            height: 465px;
        }

        #title a{
        	margin: 0 auto;
        	text-decoration: none;
        	color: black;
        }

    </style>
</head>
<body>
	<header>
        <div id="title">
            <h2><a href="main.jsp">Flea Market</a></h2>
        </div>
    </header>
    <%@ include file="loginState.jsp" %>
    <div class="header">
        <div id="userMenu">
            <ul>
                <li class="userMenuList">
                    <a href="createAccount.jsp" class="usermenuLink" id="userMenu1">회원가입</a>
                </li>
                <li class="userMenuList">
                    <a href="myPage.jsp" class="usermenuLink" id="userMenu2">마이페이지</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="header" style="background-color: pink;">
        <div id="topMenu">
            <ul>
                <li class="topMenuList">
                    <a href="writeList.jsp?board=1" class="menuLink" id="topMenu1">중고마켓</a>
                </li>
                <li class="topMenuList">
                    <a href="writeList.jsp?board=2" class="menuLink" id="topMenu2">작품마켓</a>
                </li>
            </ul>
        </div>
    </div>
</body>
</html>