<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>로그인</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Signin Template · Bootstrap v5.1</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
    <!-- Bootstrap core CSS -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"/>

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
    <link href="/resources/css/signin.css" rel="stylesheet">
</head>

<body class="text-center">
<div class="container">
    <main class="form-signin" style="border-radius: 20px; box-shadow: #dee1de 5px 5px 20px 5px">
        <form name="frmLogin" id="frmLogin" action="/member/login" method="post">
            <input type="hidden" name="rtn_url" id="rtn_url" value="${rtn_url}"/>
            <span class="material-symbols-outlined mb-4" style="font-size: 50px">🏠</span>
            <h1 class="h3 mb-3 fw-normal">로그인</h1>
            <div class="form-floating">
                <input type="text" class="form-control" name="memberId" id="memberId" placeholder="아이디"
                       value="${requestScope.save_id}">
                <label for="memberId">아이디</label>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호">
                <label for="pwd">비밀번호</label>
            </div>

            <div class="checkbox mb-3">
                <label>
                    <input type="checkbox" name="saveId" id="saveId" value="N"
                           <c:if test="${not empty cookie.save_id}">checked</c:if>> 아이디 저장
                </label>
            </div>
            <button class="w-100 btn btn-lg btn-success" type="submit" id="btnLogin" >로그인</button>
            <button class="w-100 btn btn-lg btn-outline-success my-3" type="button" onclick="window.location.href='/bbs/loginfind'">비밀번호 찾기</button>
            <a class="mt-15 mb-10" href="/member/join" style="color : green">회원가입</a>
            <p class="mt-5 mb-3 text-muted">&copy; 2017–2024</p>
        </form>
    </main>

</div>
<script>
    const btnLogin = document.getElementById("btnLogin");
    const frm = document.getElementById("frmLogin");
    let loginBtn = document.getElementById("btnLogin");
    let idSvBtn = document.getElementById("saveId");
    let memberId = document.getElementById("memberId");
    let pwd = document.getElementById("pwd");
    const idcheck = /^[a-z0-9]*$/;
    const pwdcheck = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[@#$%^&~!]).+$/;
    const validCharacters = /^[a-zA-Z0-9@#$%^&~!]*$/;

    // btnLogin.addEventListener("click", function (e) {
    //     e.preventDefault()
    //     e.stopPropagation()
    //     // frm.method="post";
    //     frm.submit();
    // }, false);
    idSvBtn.addEventListener("click", (e) => {
        if (idSvBtn.value == "Y") {
            idSvBtn.value = "N"
        } else {
            idSvBtn.value = 'Y';
        }
    });
    memberId.addEventListener("keyup", function(e){
        if (!idcheck.test(this.value)) {
            this.value = this.value.replace(/[^a-z0-9]/g, '');
            alert("영어 소문자 및 숫자만 입력이 가능합니다.");
        }
    })
    pwd.addEventListener('keyup', function(e) {
        if (!validCharacters.test(this.value)) {
            this.value = this.value.replace(/[^a-zA-Z0-9@#$%^&~!]/g, '');
            alert('영어, 숫자, 특수문자(@#$%^&~!)만 입력할 수 있습니다.');
        }
    });
    pwd.addEventListener("input", function (e) {
        if(!pwdcheck.test(this.value)) {
            loginBtn.disabled = true;
        }
        else {
            loginBtn.disabled = false;
        }
    })
    loginBtn.addEventListener("click", function(e) {
       if(memberId.value.length < 1 ) {
           alert("아이디를 입력해주세요.");
           memberId.focus();
           e.preventDefault();
           e.stopPropagation()
           return false;
       }
        if(pwd.value.length < 1 ) {
            alert("비밀번호를 입력해주세요.");
            pwd.focus();
            e.preventDefault();
            e.stopPropagation();
            return false;
        }
    });

</script>


</body>

</html>
