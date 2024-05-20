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
    <div class="row mb-2">
        <div class="col-md-8">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="register-tab" data-bs-toggle="tab" data-bs-target="#register-tab-pane" type="button" role="tab" aria-controls="register-tab-pane" aria-selected="true" onclick="window.location.href='/bbs/listRegi'">등록순</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="like-tab" data-bs-toggle="tab" data-bs-target="#like-tab-pane" type="button" role="tab" aria-controls="like-tab-pane" aria-selected="false" onclick="window.location.href='/bbs/listLike'">좋아요순</button>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="register-tab-pane" role="tabpanel" aria-labelledby="register-tab" tabindex="0">
                    <form action="/bbs/listRegi" method="get" class="mt-5">
                        <input type="hidden" name="size" id="size" value="${responseDTO.page_block_size}" >
                        <div class="row">
                            <div class="btn-group col-md-4 mb-4" role="group" >
                                <input type="radio" class="btn-check" name="search_type" id="titleCk" value="t"  autocomplete="off">
                                <label class="btn btn-outline-success" for="titleCk">제목</label>

                                <input type="radio" class="btn-check" name="search_type" id="content" value="c"  autocomplete="off">
                                <label class="btn btn-outline-success" for="content">글내용</label>

                            </div>
                            <div class="col-md-8 mb-4">
                                <input type="text" class="form-control" name="search_word" id="search_word" value="${responseDTO['search_word']}" placeholder="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="input-group mb-3">
                                <span class="input-group-text">시작 날짜</span>
                                <input type="date" class="form-control" id="start_date" name="search_date" aria-label="Username" value="${responseDTO['search_date']}">
                                <span class="input-group-text">끝 날짜</span>
                                <input type="date" class="form-control" id="end_date" name="search_date2" value="${responseDTO['search_date2']}" aria-label="Server">
                            </div>
                        </div>
                        <div class="row justify-content-end">
                            <div class="col align-self-end">
                                <button type="submit" id="submit_btn"  class="btn btn-outline-success">검색</button>
                                <button type="reset" id="reset_btn"  class="btn btn-outline-success">검색 초기화</button>
                            </div>
                        </div>
                    </form>

                    <h3 class="pb-4 mb-4 fst-italic border-bottom"
                        style="display: flex; align-items: flex-start; justify-content:space-between">
                        From the Firehose
<%--                        <c:if test="${not empty sessionScope.loginInfo}">--%>
                            <a class="btn btn-outline-success" href="/bbs/regist">✏️글 작성하기</a>
<%--                        </c:if>--%>
                    </h3>
                    <article class="blog-post">
                        <div class="table-responsive">
                            <table class="table no-wrap user-table custom-table mb-0 text-center">
                                <thead>
                                <tr scope="row" class="align-middle">
                                    <th scope="col" class="border-0">NO</th>
                                    <th scope="col" class="border-0">제목</th>
                                    <th scope="col" class="border-0">등록일</th>
                                    <th scope="col" class="border-0" >좋아요</th>
                                    <th scope="col" class="border-0">오늘의 학습<br/>노출여부</th>
                                    <th scope="col" class="border-0">오늘의 학습<br/>노출기간</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                    <c:when test="${!empty responseDTO}">
                                        <c:forEach var="list" items="${responseDTO.dtoList}" varStatus="i">
                                            <tr style="cursor:pointer;" onclick="window.location.href='/bbs/view?bbsIdx=${list.bbsIdx}'">
                                                <td class="pl-4">${fn:length(responseDTO.dtoList) - i.index}</td>
<%--                                                <td class="pl-4">${fn:length(responseDTO) - i.index}</td>--%>
                                                <td>${list.title}</td>
                                                    <%--                                                    <td>${list.writer}</td>--%>
                                                <td>${fn:substring(list.regDate,0,10)}</td>
                                                <td><span class="material-symbols-outlined align-middle" style="color: gray; font-size: 1rem">favorite</span> ${list.likeCnt}</td>
                                                <td>${list.todayCk}</td>
                                                <c:choose>
                                                <c:when test="${list.todayCk eq 'Y'}">
                                                <td>${list.todayCkStartDate} - ${list.todayCkEndDate}</td>
                                                </c:when>
                                                    <c:otherwise>
                                                        <td></td>
                                                    </c:otherwise>
                                                </c:choose>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td class="text-center" colspan="6">회원정보가 없습니다.</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </article>
                </div>
                <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">...</div>
                <div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel" aria-labelledby="disabled-tab" tabindex="0">...</div>
            </div>


            <nav class="blog-pagination" aria-label="Pagination">
                <ul class="pagination justify-content-center" >
                    <li class="page-itme <c:if test="${responseDTO.prev_page_flag ne true}">disabled</c:if>">
                        <a class="page-link" data-num="<c:choose><c:when test="${responseDTO.prev_page_flag}">${responseDTO.page_block_start-1}</c:when><c:otherwise>${responseDTO.page_block_start}</c:otherwise></c:choose>" href="
                            <c:choose><c:when test="${responseDTO.prev_page_flag}">${responseDTO.linkParams}&page=${responseDTO.page_block_start-1}</c:when>
                        <c:otherwise>#</c:otherwise></c:choose>">Previous</a>
                    </li>
                    <c:forEach begin="${responseDTO.page_block_start}" end="${responseDTO.page_block_end}" var="page_num">
                        <li class="page-item <c:if test="${responseDTO.page == page_num}"> active</c:if>">
                            <a class="page-link" data-num="${page_num}" href="<c:choose><c:when test="${responseDTO.page == page_num}">#</c:when><c:otherwise>${responseDTO.linkParams}&page=${page_num}</c:otherwise></c:choose>">${page_num}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item <c:if test="${responseDTO.next_page_flag ne true}">disabled</c:if>">
                        <a class="page-link" data-num="<c:choose> <c:when test="${responseDTO.next_page_flag}">${responseDTO.page_block_end+1}</c:when>
                        <c:otherwise>${responseDTO.page_block_end}</c:otherwise></c:choose>"
                           href="<c:choose><c:when test="${responseDTO.next_page_flag}">${responseDTO.linkParams}&page=${responseDTO.page_block_end+1}</c:when>
                        <c:otherwise>#</c:otherwise></c:choose>">Next</a>
                    </li>
                </ul>
            </nav>

        </div>
        <div class="col-md-4">
            <div class="position-sticky" style="top: 2rem;">
                <div class="p-4 mb-3 bg-light rounded">
                    <h4 class="fst-italic">About</h4>
                    <p class="mb-0">Customize this section to tell your visitors a little bit about your publication,
                        writers, content, or something else entirely. Totally up to you.</p>
                </div>

                <div class="p-4">
                    <h4 class="fst-italic">Elsewhere</h4>
                    <ol class="list-unstyled">
                        <li><a href="/bbs/listRegi">나의 학습</a></li>
                        <li><a href="/bbs/shareMine">나의 공유</a></li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <div class="row g-5">

    </div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<!--
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
-->
</body>
</html>