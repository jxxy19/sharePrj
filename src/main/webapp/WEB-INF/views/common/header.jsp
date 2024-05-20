<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>

    <title>header</title>
    <meta charset="utf-8"/><meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Blog Template · Bootstrap v5.1</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/blog/">



    <!-- Bootstrap core CSS -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>


    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/resources/css/blog.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
<div class="container">
    <header class="blog-header py-3">
        <div class="row flex-nowrap justify-content-between align-items-center">
<%--            <div class="col-4 pt-1">--%>
<%--                <a class="link-secondary" href="/">Subscribe</a>--%>
<%--            </div>--%>
            <div class="text-center">
                <a class="blog-header-logo text-dark" href="/">SITE</a>
            </div>
<%--            <div class="col-4 d-flex justify-content-end align-items-center">--%>
<%--                <a class="link-secondary" href="#" aria-label="Search">--%>
<%--                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>--%>
<%--                </a>--%>
<%--            </div>--%>
        </div>
    </header>

    <div class="nav-scroller py-1 mb-2">
        <nav class="nav d-flex justify-content-between">
            <a class="p-2 link-secondary" href="/">Main</a>
            <a class="p-2 link-secondary" href="/bbs/listRegi">List</a>
<%--            <div>--%>
<%--            <a class="btn btn-sm btn-outline-secondary" href="/member/login">Login</a>--%>
<%--            <a class="btn btn-sm btn-outline-secondary" href="/member/join">Sign up</a>--%>
<%--            </div>--%>
            <c:choose>
                <c:when test="${empty sessionScope.memberId}">
                    <div>
<%--                        없을 때 자동 로그인 로직을 처리한다,,,--%>
                    <a class="btn btn-sm btn-outline-secondary" href="/member/login">Login</a>
                    <a class="btn btn-sm btn-outline-secondary" href="/member/join">Sign up</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div>
                        <a class="btn btn-sm btn-outline-secondary" href="/member/view">Mypage</a>
                        <a class="btn btn-sm btn-outline-secondary" href="/member/logout">Logout</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </nav>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>