<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

  <title>Hello, world!</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container">
  <div class="row">
    <%--    <h>Header</h>--%>

    <div class="card">
      <div class="card-header">
        Featured
      </div>
      <div class="card-body">
        <h5 class="card-title">Special title treatment</h5>
        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
        <a href="#" class="btn btn-primary">Go somewhere</a>
      </div>
    </div>
<%--    <div class="row content">--%>
<%--      <div class="card m-3" id="player" style="width: 18rem;">--%>
<%--        <img src="/resources/img/700c6b93fa36e0a03054f791e5ffab6e.jpg" class="card-img-top mt-3" alt="...">--%>
<%--        <div class="card-body">--%>
<%--          <p class="card-text" style="text-align:  center;">노래를 들으면 눈물이 나....☆★<br>--%>
<%--            ₀․₀₀◦──────────◦ ₃․₁₅--%>
<%--            <br>--%>
<%--            ┊ ⇄ ◁◁ II ▷▷ ↻ ┊--%>
<%--        </div>--%>
<%--      </div>--%>
<%--      <div class="card m-3" style="width: 18rem;">--%>
<%--        <img src="/resources/img/IMG_0416.gif" class="card-img-top mt-3" alt="...">--%>
<%--        <div class="card-body">--%>
<%--          <p class="card-text" style="text-align:  center;">키킥 감사 감사 <br>ヾ(￣▽￣) Bye~Bye~--%>
<%--          </p>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>

    <div class="row tooter">

      <div class="row-fixed-bottom" style="z-index: -100">
        <footer class="py-1 my-1">
          <p class="text-center text-muted">풔풔</p>
        </footer>
      </div>
    </div>

  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script>
  // let track = new Audio();
  // track.src = '/resources/mp3/Little_Light.mp3';
  // let customPlayButton = document.getElementById("player");
  // customPlayButton.addEventListener("click", function(){
  //   if( track.paused ){
  //     track.play();
  //     track.autoplay = true;}
  //   else{
  //     track.pause();
  //   }
  // });
</script>
</body>
</html>