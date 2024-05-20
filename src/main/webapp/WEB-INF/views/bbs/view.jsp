<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<html>
<head>
    <title>View</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Blog Template · Bootstrap v5.1</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/blog/">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

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

        textarea:focus {
            class="form-control border"
            style="box-shadow: none;"
            readonly
        }
    </style>
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/resources/css/blog.css" rel="stylesheet">
    <link href="/resources/css/mycss.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<main class="container">
<%--    <div class="row mb-2">--%>
<%--        <div class="col-md-6">--%>
<%--            <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">--%>
<%--                <div class="col p-4 d-flex flex-column position-static">--%>
<%--                    <strong class="d-inline-block mb-2 text-primary">World</strong>--%>
<%--                    <h3 class="mb-0">Featured post</h3>--%>
<%--                    <div class="mb-1 text-muted">Nov 12</div>--%>
<%--                    <p class="card-text mb-auto">This is a wider card with supporting text below as a natural lead-in to--%>
<%--                        additional content.</p>--%>
<%--                    <a href="#" class="stretched-link">Continue reading</a>--%>
<%--                </div>--%>
<%--                <div class="col-auto d-none d-lg-block">--%>
<%--                    <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg"--%>
<%--                         role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice"--%>
<%--                         focusable="false"><title>Placeholder</title>--%>
<%--                        <rect width="100%" height="100%" fill="#55595c"/>--%>
<%--                        <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>--%>
<%--                    </svg>--%>

<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="col-md-6">--%>
<%--            <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">--%>
<%--                <div class="col p-4 d-flex flex-column position-static">--%>
<%--                    <strong class="d-inline-block mb-2 text-success">Design</strong>--%>
<%--                    <h3 class="mb-0">Post title</h3>--%>
<%--                    <div class="mb-1 text-muted">Nov 11</div>--%>
<%--                    <p class="mb-auto">This is a wider card with supporting text below as a natural lead-in to--%>
<%--                        additional content.</p>--%>
<%--                    <a href="#" class="stretched-link">Continue reading</a>--%>
<%--                </div>--%>
<%--                <div class="col-auto d-none d-lg-block">--%>
<%--                    <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg"--%>
<%--                         role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice"--%>
<%--                         focusable="false"><title>Placeholder</title>--%>
<%--                        <rect width="100%" height="100%" fill="#55595c"/>--%>
<%--                        <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>--%>
<%--                    </svg>--%>

<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

    <div class="row mb-2">
        <article class="blog-post">
            <h2 class="display-5 link-body-emphasis mb-1">학습 정보</h2>
            <hr>
            <div class="row g-3">
                <table class="table no-wrap user-table custom-table mb-0 text-center">
                    <tr scope="row" class="align-middle">
                        <th scope="col" class="border-0">제목</th>
                        <td class="border-0" colspan="3">${bbs.title}</td>
                        <th scope="col" class="border-0">좋아요</th>
                        <th scope="col" class="border-0"><span class="material-symbols-outlined align-middle" style="color: red; font-size: 1rem">favorite</span>${bbs.likeCnt}</th>

                    </tr>
                    <tr>
                        <th colspan="2">등록일</th>
                        <td colspan="2">오늘의 학습 노출 여부</td>
                        <td colspan="2">오늘의 학습 노출 기간</td>
                    </tr>
                    <tr>
                        <td colspan="2">${fn:substring(bbs.regDate,0,10)}</td>
                        <th colspan="2">${bbs.todayCk}</th>
                        <th colspan="2">${bbs.todayCkStartDate} - ${bbs.todayCkEndDate}</th>
                    </tr>
                </table>
            </div>
            <div class="row g-3">
                <div class="input-group mb-3 col-12">
                    <c:choose>
                        <c:when test="${not empty bbs.saveFileName}">
                            <img src="/resources/img/shareImg/${bbs.saveFileName}" class="img-thumbnail col-4" alt="..." style="height: 600px; width: 400px">
                            <textarea class="form-control col-6 border
                            readonly" aria-label="Sizing example input"
                                      aria-describedby="inputGroup-sizing-default"
                                      id="content" name="content"  cols="45"
                                      rows="20" readonly style="background-color: #ffffff; box-shadow: none; resize:none;">${bbs.content}</textarea>
                        </c:when>
                        <c:otherwise>
                            <textarea class="form-control col-12 border
                            readonly" aria-label="Sizing example input"
                                      aria-describedby="inputGroup-sizing-default"
                                      id="content" name="content"  cols="45"
                                      rows="20" readonly style="background-color: #ffffff; box-shadow: none; resize:none;">${bbs.content}</textarea>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="row g-3">
                <form id="listFrm" name="listFrm">
                    <input type="hidden" value="${bbs.bbsIdx}" id="bbsIdx" name="bbsIdx">
                <table class="table no-wrap user-table custom-table mb-0 text-center">
                    <tr scope="row" class="align-middle">
                        <th scope="col" class="border-0">공유한 사람</th>
                        <td class="border-0" colspan="3">${bbs.share1}</td>
                        <th scope="col" class="border-0"><button type="submit" class="btn btn-secondary">Secondary</button></th>

                    </tr>
                    <tr>
                        <th>분야</th>
                        <th colspan="2">${bbs.category}</th>
                        <th>해시태그</th>
                        <th colspan="2">${bbs.hashtag}</th>
                    </tr>

                </table>
                <div style="display: flex" class="justify-content-end">
                    <nav class="blog-pagination mt-3" aria-label="Pagination">
                        <button class="btn btn-outline-success" type="button" id="" onclick="window.location.href='/bbs/regist'">글 등록</button>
                        <button class="btn btn-outline-success" type="button" id="" onclick="window.location.href='/bbs/listRegi'">목록</button>
                        <button class="btn btn-outline-success" type="button" id="" onclick="window.location.href='/bbs/modify?bbsIdx=${bbs.bbsIdx}'">글 수정</button>
                        <button class="btn btn-outline-success" type="button" id="delBtn">삭제</button>
                    </nav>
                </div>
                </form>
            </div>






<%--            <ul>--%>
<%--                <li><strong>To bold text</strong>, use <code class="language-plaintext highlighter-rouge">&lt;strong&gt;</code>.</li>--%>
<%--                <li><em>To italicize text</em>, use <code class="language-plaintext highlighter-rouge">&lt;em&gt;</code>.</li>--%>
<%--                <li>Abbreviations, like <abbr title="HyperText Markup Language">HTML</abbr> should use <code class="language-plaintext highlighter-rouge">&lt;abbr&gt;</code>, with an optional <code class="language-plaintext highlighter-rouge">title</code> attribute for the full phrase.</li>--%>
<%--                <li>Citations, like <cite>— Mark Otto</cite>, should use <code class="language-plaintext highlighter-rouge">&lt;cite&gt;</code>.</li>--%>
<%--                <li><del>Deleted</del> text should use <code class="language-plaintext highlighter-rouge">&lt;del&gt;</code> and <ins>inserted</ins> text should use <code class="language-plaintext highlighter-rouge">&lt;ins&gt;</code>.</li>--%>
<%--                <li>Superscript <sup>text</sup> uses <code class="language-plaintext highlighter-rouge">&lt;sup&gt;</code> and subscript <sub>text</sub> uses <code class="language-plaintext highlighter-rouge">&lt;sub&gt;</code>.</li>--%>
<%--            </ul>--%>
<%--            <p>Most of these elements are styled by browsers with few modifications on our part.</p>--%>
<%--            <h2>Heading</h2>--%>
<%--            <p>This is some additional paragraph placeholder content. It has been written to fill the available space and show how a longer snippet of text affects the surrounding content. We'll repeat it often to keep the demonstration flowing, so be on the lookout for this exact same string of text.</p>--%>
<%--            <h3>Sub-heading</h3>--%>
<%--            <p>This is some additional paragraph placeholder content. It has been written to fill the available space and show how a longer snippet of text affects the surrounding content. We'll repeat it often to keep the demonstration flowing, so be on the lookout for this exact same string of text.</p>--%>
<%--            <pre><code>Example code block</code></pre>--%>
<%--            <p>This is some additional paragraph placeholder content. It's a slightly shorter version of the other highly repetitive body text used throughout.</p>--%>
        </article>
                </div>

<%--            <nav class="blog-pagination" aria-label="Pagination">--%>
<%--                <ul class="pagination justify-content-center" >--%>
<%--                    <li class="page-itme <c:if test="${responseDTO.prev_page_flag ne true}">disabled</c:if>">--%>
<%--                        <a class="page-link" data-num="<c:choose><c:when test="${responseDTO.prev_page_flag}">${responseDTO.page_block_start-1}</c:when><c:otherwise>${responseDTO.page_block_start}</c:otherwise></c:choose>" href="--%>
<%--                            <c:choose><c:when test="${responseDTO.prev_page_flag}">${responseDTO.linkParams}&page=${responseDTO.page_block_start-1}</c:when>--%>
<%--                        <c:otherwise>#</c:otherwise></c:choose>">Previous</a>--%>
<%--                    </li>--%>
<%--                    <c:forEach begin="${responseDTO.page_block_start}" end="${responseDTO.page_block_end}" var="page_num">--%>
<%--                        <li class="page-item <c:if test="${responseDTO.page == page_num}"> active</c:if>">--%>
<%--                            <a class="page-link" data-num="${page_num}" href="<c:choose><c:when test="${responseDTO.page == page_num}">#</c:when><c:otherwise>${responseDTO.linkParams}&page=${page_num}</c:otherwise></c:choose>">${page_num}</a>--%>
<%--                        </li>--%>
<%--                    </c:forEach>--%>
<%--                    <li class="page-item <c:if test="${responseDTO.next_page_flag ne true}">disabled</c:if>">--%>
<%--                        <a class="page-link" data-num="<c:choose> <c:when test="${responseDTO.next_page_flag}">${responseDTO.page_block_end+1}</c:when>--%>
<%--                        <c:otherwise>${responseDTO.page_block_end}</c:otherwise></c:choose>"--%>
<%--                           href="<c:choose><c:when test="${responseDTO.next_page_flag}">${responseDTO.linkParams}&page=${responseDTO.page_block_end+1}</c:when>--%>
<%--                        <c:otherwise>#</c:otherwise></c:choose>">Next</a>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--            </nav>--%>


</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

<script>
    let delBtn = document.getElementById("delBtn");

    delBtn.addEventListener("click", function(){
        document.getElementById("listFrm").action = '/bbs/delete';
        document.getElementById("listFrm").method = 'post';
        document.getElementById("listFrm").submit();


    })
</script>
<!--
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
-->
</body>
</html>