<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>반응형 회전 슬라이더</title>
        <link href="index.css" rel="stylesheet" type="text/css" />

</head>
<body>

<header>
    <div class="logo"></div>
    <div class="header-center">
        <!-- 검색창 추가 -->
        <div class="search-container">
            <input type="text" class="search-input" placeholder="검색...">
            <button class="search-btn">&#128269;</button> <!-- 돋보기 아이콘 -->
        </div>
    </div>
    <div class="header-right">
        <button class="login" onclick="openLoginModal()">로그인</button>
        <a href="#" class="find-id-pw">아이디/비밀번호 찾기</a>
        <button class="notification">
            <span class="bell">&#128276;</span>
        </button>
    </div>
	
	
	
</header>

<nav>
    네비게이션 바: 주요 메뉴 링크
</nav>

<main>

<div class="modal" id="loginModal">
    <div class="modal-content">
        <button class="close-btn" onclick="closeLoginModal()">×</button>
        <h2>로그인</h2>
        <div class="form-group">
            <input type="text" id="loginId" placeholder="아이디">
        </div>
        <div class="form-group">
            <input type="password" id="loginPassword" placeholder="비밀번호">
        </div>
        <div class="form-group">
            <button onclick="login()">로그인</button>
        </div>

        <div class="social-login-buttons">
            <div class="social-login-button" onclick="loginWithGoogle()">
                <img src="https://www.svgrepo.com/show/303108/google-icon-logo.svg" alt="Google">
            </div>
            <div class="social-login-button" onclick="loginWithKakao()">
                <img src="https://upload.wikimedia.org/wikipedia/commons/e/e3/KakaoTalk_logo.svg" alt="Kakao">
            </div>
            <div class="social-login-button" onclick="loginWithNaver()">
                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAnFBMVEUAxzz///8A0DcA0jYAzjgA0TcAzzgAzTkA0TYAzDkAyTsAyzoAyjoAxjzc8t8AwjsAuSIAvRcAvz4AvjgAvB8AujYAwyIAviYAvhcAuy0AuicAvTSY5KmZ6acT1UIAzxjv+/PB7Mvm+OsVy0m16cBn1H192ZEjxkrQ8diF25g4yFmO3Z+e4axJzGap5bfs+vBw1YZTzHDL79S76se+1NxhAAAFB0lEQVR4nO3cbWOaSBAH8N276/VKxaVZxQJJqnnSJmnSXr//d+vuAlarwO6CKzOZ/4u+kUzmV0bUUcP41fXfeHN9xdnVl3N3cdJ8uWKYz6DONTt3BycPCeGHhPDzBoT/YQ8J4YeE8MPeYQ8J4YeE8ENC+GF/YQ8J4YeE8ENC+CEh/LwB4b/YQ0L4ISH8kBB+SAg/7B/sISH8kBB+SAg/b0D4HntICD8khB8StufD9p+G2xxLDVLpj/gKP9hmuFKenTLrVnfzUWWi87E5k/qA3qW2N3v16iU0v3WLaE59XGspc1z/QoMK9e/TPUWdMc23dWY6tyillZ5EP6HuSv1exljcGHVjadTMxlKT7lK/C4UT6q7Szzqf2qJuTyeRITZVMqW6KpnbU0MMIzT3mnTDbXKziKKW/3wDZFaVNumkbRiGFaq2onRq1Re/m7EWooNwmkZ+J/HUQn5fncWGUuo+GI9QqNqa2QqX6lIRNQxYeRW1FM7M1cZD2PKY3fQArK58sbWQ//ykidGxh/SJKSUshapM1PYUoyGeQmYvVHNaEo8JJw5CFk44cTqHfLkuyke0nkIz7aMU8tWsYU7RCPnDIo6OzSkeIV9n7NhdEZFwo6+n0UGDiIT869HraRhh12u8w0Ruj4dlHjNzFqPDSsLl8TBq6KkloYSbXBwSUQn50yI+IOISHptTZMKbxcGcIhPy5wMiNiH/9uecjlfIYi/hTSHivTYdhebl06iF/GW2fz0NI+xeeh6Eqba8hGpORbUc3CllK9Q/6tNtUOFrUcR7fappwCXkdwuxR8Qn5Pf7c4pQuNyfU4RCvprtzilGIf+e78wpSuFyvTOnKIV8tXM9xSnkD3lNZOMUmuchSQ8hXxfC3BfN26LFhZ0wEX7Eswg35fUUsZA/5TURq5A/1nOKVrjJixi3kD8lZk5VJazCck7jEEKfDCGcZlIThZBOwkAZQsifc0UUrucQklCvNJALX/WcColYyF8SqTM+ob4CyiGE/EfmIpQijsMYhxO+XijgHLOQ3+XzOW4hv8+wC5fohXyVYBfyhwy28KHziOVaghZmq85DVhloobxYdh7TfZ7HLLzIvlsdB1g4T35iF87z7jkFLizusQvn+R1qoX55NH/FLix+YBfK5AW7UGY3mIVm2/QNsdBsDGX+jFwoZNZ7Rz5mYaz3vo+Iheb9F5k/oRYaot33aqEK495zCkAo86+ohZqY/I9aaP9uL2ChzOxWMhCFrL4r+q80xi6siWvvlcbohSVR+q/egAjVz/nO6fiFNbHwnFMAwnpOPVdvYITqeuq3eoMg3M6p10oDhLCaU7+VBiCh8Fu9wRD2mVMgwh5zCkrotXqDItwSnVdvYITMd6UBTei+eoMjrImZ4+oNkNBzTuEJXVdvkITbpzZOqzdQwu1KA6+Qeaze4AldVxqjFRZHhfX11OJTb+cS2n4boUlYz6n9SsN8G2GMwuNT6jGnoxU2tlURpe2niYILF32FFdF6TqeLoMJ4MKGwXb1NF+YtntEJRUtbFdHy00QhhRVxppM0x9xevrXWVkeIjjpVpZDA8o+nm0/JtEYf0Qas/gh7dyGLUqcQxsIicXtb9oU6S52EaJvBCoUDunU2XKWAQIfOhqsU1kehUCgUCoVCoVAoFAqFQqFQKBQKhUKhUCgUCoVCoVAoFAqFQqFQKJST5fbcDZw4t+wyPXcPJ016yfgl5rN4e8l/AcfOpfIXeS55AAAAAElFTkSuQmCC" alt="Naver">
            </div>
        </div>

        <a href="#" class="switch-link" onclick="openSignupModal()">회원가입하기</a>
    </div>
</div>

<!-- 회원가입 모달 -->
<div class="modal" id="signupModal">
    <div class="modal-content">
        <button class="close-btn" onclick="closeSignupModal()">×</button>
        <h2>회원가입</h2>
        <div class="form-group">
            <input type="text" id="signupId" placeholder="아이디">
            <button type="button" onclick="checkId()">아이디 중복 체크</button>
        </div>
        <div class="form-group">
            <input type="password" id="signupPassword" placeholder="비밀번호">
        </div>
        <div class="form-group">
            <input type="password" id="signupConfirmPassword" placeholder="비밀번호 확인">
        </div>
        <div class="form-group">
            <input type="text" id="signupName" placeholder="이름">
        </div>
        <div class="form-group">
            <input type="text" id="signupJumin" placeholder="주민등록 앞자리">
        </div>

        <!-- CAPTCHA -->
        <div class="form-group captcha-container">
            <input type="text" class="captcha-input" id="captchaInput" placeholder="자동입력방지">
            <span class="captcha-code" id="captchaCode">AB12C</span>
        </div>

        <div class="form-group">
            <button onclick="signup()">회원가입</button>
        </div>
        <a href="#" class="switch-link" onclick="openLoginModal()">로그인하기</a>
    </div>
</div>


<aside id="sidebar">
    <div class="upper-section">
        <div class="category">
            <h3>장르</h3>
            <button class="expand-button" data-category="genre">+</button>
            <ul class="genre-list"></ul>
        </div>
        <div class="category">
            <h3>아티스트</h3>
            <button class="expand-button" data-category="artist">+</button>
            <ul class="artist-list"></ul>
        </div>
        <div class="category">
            <h3>노래 분위기</h3>
            <button class="expand-button" data-category="mood">+</button>
            <ul class="mood-list"></ul>
        </div>
    </div>

    <div class="lower-section">
        <div class="tags">
            <span>#컨셉</span>
            <span>#최근유행하는</span>
            <span>#영화테마곡</span>
            <span>#힙합</span>
            <span>#트로트</span>
            <span>#발라드</span>
            <span>#인디음악</span>
            <span>#여름</span>
            <span>#겨울</span>
        </div>
    </div>
</aside>
    <section>
        <article id="rotationframe">
            <button class="button left">&#9664;</button>
            <div class="slider">
                <img src="https://i.namu.wiki/i/H7mgrr-jYeaIIZHsS-gEBzBdo3Xh6YTY8SJfteOZEENQuQK1DRiZ_COJxiA5ehHUCw4SFL23Ghiezjr3Jj1ex8LzjJZm_R185qlN7dcKvW2_WKEE0qrf-0ZnNNXonxiZ6dcOTaVQHe-g3bOuxWGy8Q.webp" alt="이미지 1">
                <img src="https://charts-static.billboard.com/img/2024/10/rose-000-apt-kne-180x180.jpg" alt="이미지 2">
                <img src="https://charts-static.billboard.com/img/2024/08/lady-gaga-r3b-diewithasmile-6og-180x180.jpg" alt="이미지 3">
                <img src="https://charts-static.billboard.com/img/2024/04/shaboozey-2wm-abarsongtipsy-bat-180x180.jpg" alt="이미지 4">
            </div>
            <button class="button right">&#9654;</button>
        </article>
        <article>
            아티클 2: 독립된 콘텐츠 블록
        </article>
    </section>

<aside class="right-section">
    <h2>노래 랭킹</h2>
<aside id="rankings">
    <h2>Top 10 Music Rankings</h2>
    <table id="rankTable">
        <thead>
            <tr>
                <th>순위</th>
                <th>노래명</th>
                <th>순위 변동</th>
                <th>실시간 날짜</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td>Shape of You</td>
                <td><span class="rank-change up">▲ 1</span></td>
                <td>2025-01-22</td>
            </tr>
            <tr>
                <td>2</td>
                <td>Blinding Lights</td>
                <td><span class="rank-change down">▼ 2</span></td>
                <td>2025-01-22</td>
            </tr>
            <tr>
                <td>3</td>
                <td>Levitating</td>
                <td><span class="rank-change up">▲ 3</span></td>
                <td>2025-01-22</td>
            </tr>
            <!-- 추가된 노래 순위들 -->
        </tbody>
    </table>
</aside>
</aside>
</main>

    <section class="bottom-section">
        <p>바텀섹션: 추가적인 정보나 링크 등을 넣을 수 있는 공간입니다.</p>
    </section>

    <!-- 푸터 -->
<footer>

    <div class="footer-links">
        <a href="/about-us">회사소개</a>
        <a href="/partnership">제휴안내</a>
        <a href="/advertising">광고안내</a>
        <a href="/terms">이용약관</a>
        <a href="/privacy-policy">개인정보처리방침</a>
        <a href="/youth-protection">청소년보호정책</a>
    </div>
    <p>Copyright ⓒ 2025 All rights reserved.</p>
</footer>


<div id="musicToolbox" class="music-toolbox">
    <button id="prevBtn">⏮️</button>
    <button id="playBtn">▶️</button>
    <button id="nextBtn">⏭️</button>
    <div id="trackInfo">
        <span id="currentTime">00:00</span> / <span id="totalTime">03:30</span>
    </div>
</div>


<script src="./index.js">

</script>
</body>
</html>
