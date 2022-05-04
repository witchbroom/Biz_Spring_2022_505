<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나의 홈페이지</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        nav ul {
            display: flex;
            background-color: black;
            color: white;
            list-style: none;
        }

        nav li {
            padding: 12px 16px;
        }

        nav li:hover {
            background-color: #ddd;
            color: blue;
            font-weight: 500;
        }
    </style>
</head>

<body>
    <nav>
        <ul>
            <li>HOME</li>
            <li>공지사항</li>
            <li>자유게시판</li>
            <li>로그인</li>
            <li>회원가입</li>
        </ul>
    </nav>

</body>

</html>