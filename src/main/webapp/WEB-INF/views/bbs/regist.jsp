<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<html>
<head>
    <title>regist</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
    <link href="/resources/css/form-validation.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<main class="container">

    <div class="row g-5">
        <div class="col-md-8">
            <form name="frmRegist" id="frmRegist" method="post" action="/bbs/regist" enctype="multipart/form-data">
                <div class="form-check ">

                    <div class="input-group mb-3">
                        <span class="input-group-text" id="inputGroup-sizing-default">제목</span>
                        <input type="text" class="form-control" aria-label="Sizing example input"
                               aria-describedby="inputGroup-sizing-default"
                               id="title" name="title" value="${dto.title}" maxlength="100">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="inputGroup-sizing-default0">작성자</span>
                        <input type="text" class="form-control" aria-label="Sizing example input"
                               aria-describedby="inputGroup-sizing-default"
                               id="memberId" name="memberId" value="${sessionScope.memberId}" maxlength="50" readonly style="background-color: white">
                    </div>
                    <div class="row g-3">
                        <div class="input-group mb-3 col-12">

                            <img src="" class="img-thumbnail col-4  image-box" alt="..." style="height: 600px; width: 400px">
                            <span class="input-group-text mx-1" id="inputGroup-sizing-default1">내용</span>
                            <textarea class="form-control col-6" aria-label="Sizing example input"
                                      aria-describedby="inputGroup-sizing-default"
                                      id="content" name="content"  cols="45"
                                      rows="20">${dto.content}</textarea>
                        </div>
                        <div id="div_err_content" style="display: none"></div>
                    </div>
<%--                    <img src="..." class="rounded mx-auto d-block" alt="...">--%>
                    <div class="input- group mb-3">
                        <input type="file" class="form-control" aria-label="Sizing example input"
                               aria-describedby="inputGroup-sizing-default"
                               id="file" name="file" accept="image/*" value="${dto.orgFileName}">
                    </div>
                    <div class="row">
                    <div class="form-check form-check-inline col-5 mx-0 align-middle">
                        <span>오늘의 학습 노출 여부 : </span>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="todayCk" id="todayCK0" value="Y">
                            <label class="form-check-label" for="todayCK0">YES</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="todayCk" id="todayCK1" value="N" checked>
                            <label class="form-check-label" for="todayCK1">NO</label>
                        </div>
                    </div>
                    <div id="div_err_display_interest" style="display: none"></div>
                        <div class="col-7">
                            <div class="input-group mb-3">
                                <span class="input-group-text">시작 날짜</span>
                                <input type="date" class="form-control" id="start_date" name="todayCkStartDate" aria-label="Username" value="${responseDTO.todayCkStartDate}" disabled="disabled">
                                <span class="input-group-text">끝 날짜</span>
                                <input type="date" class="form-control" id="end_date" name="todayCkEndDate" value="${responseDTO.todayCkEndDate}" aria-label="Server" disabled="disabled">
                            </div>
                        </div>
                        <div class="input-group mb-3 col-12">
<%--                            <label for="share" class="form-label">공유할 사람 선택</label>--%>
                            <select class="form-select form-control" id="share1" name="share1" aria-label="Default select example">
                                <option selected value="">공유할 사람 선택1</option>
                                <c:forEach var="list" items="${memberList}">
                                    <option value="<c:out value="${list.memberId}"/>"><c:out value="${list.name}"/>
                                </c:forEach>
                            </select>
                            <select class="form-select form-control" id="share2" name="share1" aria-label="Default select example" disabled="disabled">
                                <option value="" selected>공유할 사람 선택2</option>
                                <c:forEach var="list" items="${memberList}">
                                    <option value="<c:out value="${list.memberId}"/>"><c:out value="${list.name}"/>
                                </c:forEach>
                            </select>
                            <select class="form-select form-control" id="share3" name="share1" aria-label="Default select example" disabled="disabled">
                                <option value="" selected>공유할 사람 선택3</option>
                                <c:forEach var="list" items="${memberList}">
                                    <option value="<c:out value="${list.memberId}"/>"><c:out value="${list.name}"/>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="category" class="form-label">분야</label>
                            <input type="text" class="form-control" name="category" id="category" value="${responseDTO['category']}">
                        </div>
                        <div class="col-md-6">
                            <label for="hashtag" class="form-label">해시태그</label> <!--<span class="text-muted">(선택사항)</span>-->
                            <input type="text" class="form-control" name="hashtag" id="hashtag" value="${responseDTO['hashtag']}">
                        </div>
                    </div>
                    <div id="div_err_title" style="display: none"></div>
                    <div id="div_err_display_date" style="display: none"></div>

            </form>
            <nav class="blog-pagination mt-3" aria-label="Pagination">
                <button class="btn btn-outline-success" type="submit">글 등록</button>
                <button class="btn btn-outline-success" id="resetBtn" type="reset">초기화</button>
                <button class="btn btn-outline-success" type="button" onclick="window.location.href='/bbs/listRegi'">목록</button>

            </nav>

        </div>

    </div>

    <div class="col-md-4">
        <div class="position-sticky" style="top: 2rem;">
            <div class="p-4 mb-3 bg-light rounded">
                <h4 class="fst-italic">ABOUT</h4>
                <p class="mb-0">올리고 싶은 글을 올려봐요!<br>
                    나쁜 글은 안됩니닷!(・｀ヘ´・；)</p>
            </div>
        </div>
    </div>
    </div>

</main>

<footer class="blog-footer">
    <p>Blog template built for <a href="https://getbootstrap.com/">Bootstrap</a> by <a href="https://twitter.com/mdo">@mdo</a>.
    </p>
    <p>
        <a href="#">Back to top</a>
    </p>
</footer>

<ul>

</ul>

<script>
    let share1 = document.getElementById("share1");
    let share2 = document.getElementById("share2");
    let share3 = document.getElementById("share3");
    share1.addEventListener("change", (e)=> {
        if(share1.value != "") {
            share2.disabled = false;
        }
        if(share1.value == ""){
            share2.disabled= true;
            share3.disabled= true;
        }
    })
    share2.addEventListener("change", (e)=>{
        if(share2.value != "") {
            share3.disabled = false;
        }
        if(share2.value == ""){
            share3.disabled= true;
        }
    })
    const serverValidResult = {};
    <c:forEach items="${errors}" var="err">
    if (document.getElementById("div_err_${err.getField()}") != null) {
        document.getElementById("div_err_${err.getField()}").innerHTML = "<div style='width:100%;margin-bottom:.25rem;font-size:.875em;color:#dc3545'>${err.getField()}필드는 공백일 수 없습니다.</div>";
        document.getElementById("div_err_${err.getField()}").style.display = "block";
    }
    serverValidResult['${err.getField()}'] = '${err.defaultMessage}';
    </c:forEach>
    console.log(serverValidResult);

    const fileDOM = document.querySelector('#file');
    const preview = document.querySelector('.image-box');
    // const src = URL.createObjectURL(fileDOM.files[0]);

    fileDOM.addEventListener("click", () => {
        // if (fileDOM.value == "") {
        //     URL.revokeObjectURL(src);
        // }
        console.log(fileDOM.value)
        fileDOM.value = "";
        preview.src = "";
    })
    fileDOM.addEventListener('change', () => {
        console.log(fileDOM.files[0].name);
        console.log(fileDOM.value)
        const imageSrc = URL.createObjectURL(fileDOM.files[0]);
        preview.src = imageSrc;
        if(fileDOM.value == "") {
            alert("qlsrkqt")
        }
    });

    let resetBtn = document.getElementById("resetBtn");
    resetBtn.addEventListener("click", (e)=> {
        preview.src = "..."
        share2.disabled = true;
        share3.disabled = true;

    })

    document.getElementById("todayCK0").addEventListener("click", (e) => {
        if(document.getElementById("todayCK0").checked) {
            document.getElementById("start_date").disabled = false;
            document.getElementById("end_date").disabled = false;
        }
    })
    document.getElementById("todayCK1").addEventListener("click", (e) => {
        if(document.getElementById("todayCK1").checked) {
            document.getElementById("start_date").disabled = true;
            document.getElementById("end_date").disabled = true;
        }
    })


</script>
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
