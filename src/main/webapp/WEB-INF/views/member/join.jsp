<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>join</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="/resources/css/ifta.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/checkout/">
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
<%--    <link href="/resources/css/form-validation.css" rel="stylesheet">--%>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"/>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="container w-50">
    <main class="container m-3 my-3" style="border-radius: 20px; box-shadow: #dee1de 5px 5px 20px 5px">
        <div class="py-5 text-center">
<%--            <span class="material-symbols-outlined d-block mx-auto mb-4" style="font-size: 72px">edit_square</span>--%>
            <span class="material-symbols-outlined d-block mx-auto mb-4" style="font-size: 72px">📜</span>
            <h2>Member Join</h2>
            <p class="lead">회원가입을 위해 작성해주세요!</p>
        </div>
        <div>
            <h4 class="mb-3">정보 입력</h4>
            <form class="needs-validation" novalidate method="post" action="/member/join">
                <div class="row g-3 justify-content-center">
                    <div class="col-8 mt-3">
                        <div class="row mb-2 align-items-center justify-content-center">
                            <div class="col-12"><label for="memberId" class="small ifta-label">아이디</label>
                                <input type="text" class="ifta-field" id="memberId" name="memberId" value=""  required>
                            </div>
                        </div>
                        <div class="mb-4" style="display:block;width:100%;margin-top:.25rem;font-size:.875em;color:#9a9a9a">
                            영문 소문자와 숫자 포함 4~20자만 가능합니다.
                        </div>
                        <div id="feedbackId">
                        </div>
                    </div>
                    <div class="col-3 mt-3">
                        <div class="row mb-2 align-items-center justify-content-center">
                            <div class="col-12"><label for="memberId" class="small ifta-label"></label>
                                <button type="button" class="ifta-field" id="idCk" name="idCK" onclick="idbtnChek()">아이디 중복확인</button>
                            </div>
                        </div>
                    </div>
                    <div class="idCk1" style="display:none;width:100%;margin-top:.15rem;font-size:.875em;color:#dc3545">사용 중인 아이디 입니다.</div>
                    <div class="idCk2" style="display:none;width:100%;margin-top:.15rem;font-size:.875em;color:#56c2ff">사용 가능한 아이디 입니다.</div>
                    <div class="col-11 mt-3">
                        <div class="row mb-2 align-items-center justify-content-center">
                            <div class="col-12"><label for="name" class="small ifta-label">이름</label>
                                <input type="tel" class="ifta-field" id="name" name="name" value=""  required>
                            </div>
                        </div>
                        <div class="invalid-feedback">
                            이름을 입력해주세요.
                        </div>
                    </div>
                    <div class="col-11 mt-3">
                        <div class="row mb-2 align-items-center justify-content-center">
                            <div class="col-12"><label for="pwd" class="small ifta-label">비밀번호</label>
                                <input type="password" class="ifta-field" id="pwd" name="pwd" value="" required>
                            </div>
                        </div>
                        <div class="invalid-feedback">
                            비밀번호를 입력해주세요.
                        </div>
                        <div class="mb-4" style="display:block;width:100%;margin-top:.25rem;font-size:.875em;color:#9a9a9a">
                            영어 + 숫자 + 특수문자(@#$%^&~!)조합으로 최소 8 자리 이상 비밀번호를 입력해주세요.
                        </div>
                        <div id="pwdinfo" style="display: none;"></div>
                    </div>
                    <div class="col-11">
                        <div class="row mb-2 align-items-center justify-content-center">
                            <div class="col-12"><label for="pwd2" class="small ifta-label">비밀번호 재입력</label>
                                <input type="password" class="ifta-field" id="pwd2" name="pwd2" value="" required>
                            </div>
                        </div>
                        <div class="invalid-feedback">
                            비밀번호를 재입력해주세요.
                        </div>
                        <div id="pwdck" style="display: none;" >
                            비밀번호와 입력 비밀번호가 다릅니다.
                        </div>
                    </div>
                    <div class="col-11 mt-3">
                        <div class="row mb-2 align-items-center justify-content-center">
<%--                            <div class="input-group mb-3 col-12">--%>
<%--                                <input type="text" class="ifta-field" placeholder="Username" aria-label="Username">--%>
<%--                                <span class="small ifta-label">@</span>--%>
<%--                                <input type="text" class="ifta-field" placeholder="Server" aria-label="Server">--%>
<%--                            </div>--%>
                            <div class="col-5"><label for="email" class="small ifta-label">이메일</label>
                                <input type="text" class="ifta-field" id="email1" name="email1" value="" placeholder="jjj" required>
                            </div>
                            <div class="col-2 align-middle">
                                <div class="py-2 px-3 fw-bold" style="padding:35px 20px 15px;width:100%;"><p style="font-size: 20px"><span class="material-symbols-outlined">alternate_email</span></p></div> </div>
                            <div class="col-5">
                                <select class="ifta-field" id="email2" name="email2">
                                    <option value="gmail.com" selected>gmail.com</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="hanmail.net">hanmail.net</option>
                                    <option value="nate.com">nate.com</option>
<%--                                    <option value="직접입력">직접입력</option>--%>
                                </select>
                            </div>
                        </div>
                        <div class="invalid-feedback">
                            이메일을 입력해주세요.
                        </div>
                    </div>
                    <div class="col-12 mt-3">
                        <div class="row mt-3 mb-4 align-items-center justify-content-center">
                            <div class="col-3"><label for="phone_num1" class="small ifta-label">전화번호</label>
                                <select class="ifta-field" id="phone_num1" name="phone_num1">
                                    <option value="010" selected>010</option>
                                    <option value="011">011</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                    <option value="018">018</option>
                                </select>
                            </div>
                            <div class="col-1 align-middle">
                                <div class="py-2 fw-bold" style="padding:35px 20px 15px;width:100%;"><p style="font-size: 20px"><span class="material-symbols-outlined">remove</span></p></div> </div>
                            <div class="col-3"><label for="phone_num2" class="small ifta-label">&nbsp;</label>
                                <input type="tel" class="ifta-field" id="phone_num2" name="phone_num2" value="${dto.phone_num2}"
                                       placeholder="1111" maxlength="4" required>
                            </div>
                            <div class="col-1">
                                <div class="py-2 fw-bold" style="padding:35px 20px 15px;width:100%;"><p style="font-size: 20px"><span class="material-symbols-outlined">remove</span></p></p></div> </div>
                            <div class="col-3"><label for="phone_num3" class="small ifta-label">&nbsp;</label>
                                <input type="tel" class="ifta-field" id="phone_num3" name="phone_num3" value="${dto.phone_num3}"
                                       placeholder="1111" maxlength="4" required>
                            </div>
                            <div id="phoneck" style='display: none; width:100%;margin-bottom:.25rem;font-size:.875em;color:#dc3545'>
                            </div>
                        </div>
                        <div class="invalid-feedback">
                            전화번호를 입력해주세요.
                        </div>
                    </div>
                </div>
                <hr class="my-4">
                <button class="w-100 my-4 col-11 btn btn-success btn-lg" type="submit" id="submitBtn">가입하기</button>
            </form>
        </div>

    </main>

    <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">&copy; 2017–2021 Company Name</p>
        <ul class="list-inline">
            <li class="list-inline-item"><a href="#">Privacy</a></li>
            <li class="list-inline-item"><a href="#">Terms</a></li>
            <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
    </footer>
</div>



<script src="/resources/js/jquery-3.7.1.min.js"></script>
<%--<script src="/resources/js/bootstrap.bundle.min.js"></script>--%>
<script src="/resources/js/form-validation.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

<script>
    let memberId = document.getElementById("memberId");
    //아이디 중복 체크
    function idbtnChek() {
        if(memberId.value.length <4) {
            alert("4자 이상 아이디를 입력해주세요.")
            return ;
        } else {
            let id = $('#memberId').val();
            $.ajax({
                url: '/member/idCheck',
                type: 'post',
                data: {memberId: id},
                success: function (cnt) {
                    if (cnt == 0) {
                        $('.idCk1').css("display", "none");
                        $('.idCk2').css("display", "block");
                    } else {
                        $('.idCk2').css("display", "none");
                        $('.idCk1').css("display", "block");
                    }
                },
                error: function () {
                    alert("에러입니다");
                }
                // error:function(data, status, opt)
                // {
                //     console.log("code:"+data.status+"\n"+"message:"+data.responseText+"\n"+"error:"+opt);
                // }
            });
        }
    }
    const idcheck = /^[a-z0-9]*$/;
    const numcheck = /^[0-9]*$/;
    const pwdcheck = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[@#$%^&~!]).+$/;
    const validCharacters = /^[a-zA-Z0-9@#$%^&~!]*$/;
    let pwd1 = document.getElementById("pwd");
    let pwd2 = document.getElementById("pwd2");
    let pwdinfo = document.getElementById("pwdinfo");
    let p2 = document.getElementById("phone_num2");
    let p3 = document.getElementById("phone_num3");
    let submitBtn = document.getElementById("submitBtn");

    memberId.addEventListener("keyup", function(e){
        document.getElementById("feedbackId").style.display="none";
        if (!idcheck.test(this.value)) {
            this.value = this.value.replace(/[^a-z0-9]/g, '');
            alert("영어 소문자 및 숫자만 입력이 가능합니다.");
        }
    })
    pwd1.addEventListener('keyup', function(e) {
        if (!validCharacters.test(this.value)) {
            this.value = this.value.replace(/[^a-zA-Z0-9@#$%^&~!]/g, '');
            alert('영어, 숫자, 특수문자(@#$%^&~!)만 입력할 수 있습니다.');
        }
    });
    pwd1.addEventListener("change", function (e) {
        if(!pwdcheck.test(this.value)) {
            if(pwd1.value === "") {
             pwdinfo.style.display = "none";
            } else {
                pwdinfo.style = "display:block;width:100%;margin-top:.25rem;font-size:.875em;color:#dc3545";
                pwdinfo.innerText = "기준에 맞는 비밀번호를 입력해주세요."
            }
        }else {
            pwdinfo.style.display = "none";
        }
    })
    pwd1.addEventListener("input", (e)=>{
        if(pwd1.value == pwd2.value) {
            document.getElementById("pwdck").style.display="none";
        }
    });
    pwd2.addEventListener("input", (e)=>{
        if (pwd1.value != pwd2.value) {
            document.getElementById("pwdck").style = "display:block;width:100%;margin-top:.25rem;font-size:.875em;color:#dc3545";
        }
        if (pwd2.value === "" || pwd1.value == pwd2.value) {
            document.getElementById("pwdck").style.display = "none";
        }
    });


    p2.addEventListener("input", function(e) {
        if (!numcheck.test(this.value)) {
            this.value = this.value.replace(/[^0-9]/g, '');
        }
        if (p2.value.length == 4) {
            document.getElementById("phoneck").style.display = "none";
            p3.focus();
        }
        if (p2.value.length <= 2) {
            document.getElementById("phoneck").style.display = "block";
            document.getElementById("phoneck").innerText = "전화번호 형식에 맞게 입력해주세요.";
        }
    });
    p3.addEventListener("input" , function(e)  {
        if (!numcheck.test(this.value)) {
            this.value = this.value.replace(/[^0-9]/g, '');
        }
        if (p3.value.length != 4) {
            document.getElementById("phoneck").style.display = "block";
            document.getElementById("phoneck").innerText = "전화번호 형식에 맞게 입력해주세요.";
        }
        if (p3.value.length == 4) {
            document.getElementById("phoneck").style.display = "none";
        }
    })

    submitBtn.addEventListener("click", (e) => {
        if(p2.value.length < 3 || p3.value.length < 4) {
            document.getElementById("phoneck").style.display="block";
            e.stopPropagation();
            e.preventDefault();
        }
        if(memberId.value.length < 1) {
            document.getElementById("feedbackId").innerText = "아이디를 입력해주세요.";
            document.getElementById("feedbackId").style = "display:block;width:100%;margin-top:.25rem;font-size:.875em;color:#dc3545";
            e.stopPropagation();
            e.preventDefault();
        }
        // 아이디가 확인이 안된 경우
        if(document.querySelector(".idCk2").style.display !== 'block') {
            memberId.focus();
            alert("아이디 중복 체크를 해주세요.")
            e.stopPropagation();
            e.preventDefault();
        }
        // 비밀번호 입력이 끝나지 않은 경우
        if((document.querySelector(".idCk1").style.display == 'block')  ||
            (document.getElementById("pwdck").style.display == "block") ||
            (document.getElementById("pwdinfo").style.display == "block") ||
            (document.getElementById("phoneck").style.display == "block")) {
            e.stopPropagation();
            e.preventDefault();
            alert("정보를 다 입력해주세요.")
            return false;
        }
    });

</script>
</body>
</html>
