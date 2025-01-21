
document.querySelectorAll('.expand-button').forEach(button => {
    button.addEventListener('click', function() {
        const category = this.getAttribute('data-category');
        toggleCategoryList(category);
    });
});

// 카테고리 리스트 토글
function toggleCategoryList(category) {
    const listElement = document.querySelector(`.${category}-list`);
    
    if (listElement.classList.contains('visible')) {
        listElement.classList.remove('visible');
    } else {
        listElement.classList.add('visible');
        if (category === 'genre') {
            listElement.innerHTML = `
                <li>트로트</li>
                <li>클래식</li>
                <li>팝음악</li>
                <li>재즈</li>
                <li>록</li>
                <li>힙합</li>
            `;
        } else if (category === 'artist') {
            listElement.innerHTML = `
                <li>아이유</li>
                <li>방탄소년단</li>
                <li>지코</li>
                <li>태양</li>
                <li>뷔</li>
                <li>박재범</li>
                <li>트와이스</li>
                <li>레드벨벳</li>
                <li>EXO</li>
                <li>BLACKPINK</li>
            `;
        } else if (category === 'mood') {
            listElement.innerHTML = `
                <li>신나는</li>
                <li>슬픈</li>
                <li>몽환적인</li>
                <li>고요한</li>
                <li>감성적인</li>
                <li>경쾌한</li>
                <li>우울한</li>
            `;
        }
    }
}


const slider = document.querySelector('#rotationframe .slider');
const leftButton = document.querySelector('#rotationframe .button.left');
const rightButton = document.querySelector('#rotationframe .button.right');
const slideImages = document.querySelectorAll('#rotationframe .slider img');
let currentIndex = 0;

// 슬라이더 초기화
function initializeSlider() {
    const visibleImages = getVisibleImagesCount(); // 보이는 이미지 수 계산
    const slideWidth = 100 / visibleImages; // 각 이미지 너비 계산 (보이는 이미지 비율)

    // 슬라이더의 너비 설정
    slider.style.width = `${slideWidth * slideImages.length}%`;

    // 각 이미지 너비 설정
    slideImages.forEach(img => {
        img.style.width = `${slideWidth}%`; // 각 이미지 너비를 동적으로 설정
    });

    updateSlider(); // 슬라이더 업데이트
}

// 현재 화면에서 보이는 이미지 수 계산
function getVisibleImagesCount() {
    const screenWidth = window.innerWidth;

    if (screenWidth >= 1200) return 4; // 데스크톱에서 보이는 이미지 수
    if (screenWidth >= 768) return 3; // 태블릿에서 보이는 이미지 수
    return 2; // 모바일에서 보이는 이미지 수
}

// 슬라이더 업데이트 (슬라이드 애니메이션 적용)
function updateSlider() {
    const visibleImages = getVisibleImagesCount();
    const offset = currentIndex * -(100 / visibleImages); // 이동할 위치 계산
    slider.style.transition = 'transform 0.5s ease-in-out'; // 슬라이드 이동 애니메이션
    slider.style.transform = `translateX(${offset}%)`; // 이동 애니메이션
}

// 좌측 버튼 클릭 시
leftButton.addEventListener('click', () => {
    const visibleImages = getVisibleImagesCount();
    currentIndex = (currentIndex - 1 + slideImages.length) % slideImages.length; // 순환하는 방식으로 이동
    updateSlider();
});

// 우측 버튼 클릭 시
rightButton.addEventListener('click', () => {
    const visibleImages = getVisibleImagesCount();
    currentIndex = (currentIndex + 1) % slideImages.length; // 순환하는 방식으로 이동
    updateSlider();
});

// 화면 크기 변경 시 슬라이더 초기화 및 상태 업데이트
window.addEventListener('resize', () => {
    initializeSlider(); // 화면 크기 변경 시 초기화
    updateSlider(); // 슬라이더 상태 업데이트
});

// 초기화 함수 호출
initializeSlider(); // 페이지 로드 시 슬라이더 초기화



    function openLoginModal() {
        document.getElementById('loginModal').style.display = 'flex';
    }

    // 로그인 모달 닫기
    function closeLoginModal() {
        document.getElementById('loginModal').style.display = 'none';
    }

    // 회원가입 모달 열기
    function openSignupModal() {
        document.getElementById('signupModal').style.display = 'flex';
        closeLoginModal(); // 로그인 모달을 닫음
    }

    // 회원가입 모달 닫기
    function closeSignupModal() {
        document.getElementById('signupModal').style.display = 'none';
    }

    // 로그인 처리
    function login() {
        const loginId = document.getElementById('loginId').value;
        const loginPassword = document.getElementById('loginPassword').value;
        console.log('로그인 아이디:', loginId, '비밀번호:', loginPassword);
        closeLoginModal();
    }

    // 소셜 로그인
    function loginWithGoogle() {
        alert("구글로 로그인");
    }

    function loginWithKakao() {
        alert("카카오로 로그인");
    }

    function loginWithNaver() {
        alert("네이버로 로그인");
    }

    // 회원가입 처리
    function signup() {
        const signupId = document.getElementById('signupId').value;
        const signupPassword = document.getElementById('signupPassword').value;
        const signupConfirmPassword = document.getElementById('signupConfirmPassword').value;
        const signupName = document.getElementById('signupName').value;
        const signupJumin = document.getElementById('signupJumin').value;
        const captchaInput = document.getElementById('captchaInput').value;

        // CAPTCHA 확인
        if (captchaInput !== document.getElementById('captchaCode').innerText) {
            alert('자동입력방지가 일치하지 않습니다.');
            return;
        }

        if (signupPassword === signupConfirmPassword) {
            console.log('회원가입 아이디:', signupId, '비밀번호:', signupPassword, '이름:', signupName, '주민등록 앞자리:', signupJumin);
            closeSignupModal();
        } else {
            alert('비밀번호가 일치하지 않습니다.');
        }
    }

    // 아이디 중복 체크
    function checkId() {
        const signupId = document.getElementById('signupId').value;
        alert(signupId + "는 사용 가능한 아이디입니다.");
    }
	
	let selectedImage = null;
let musicToolbox = document.getElementById('musicToolbox');
let playBtn = document.getElementById('playBtn');

// 이미지 클릭 이벤트
const images = document.querySelectorAll('.slider img');
images.forEach((image, index) => {
    image.addEventListener('click', () => {
        selectedImage = image;  // 클릭한 이미지 저장
        showMusicToolbox(index); // 툴박스를 해당 이미지에 맞게 표시
    });
});

// 툴박스 보이기
function showMusicToolbox(index) {
    musicToolbox.style.display = 'block';
    musicToolbox.classList.add('active');  // 툴박스 상태를 활성화

    // 이미지에 해당하는 툴박스 정보 업데이트
    // 예시로 trackInfo 업데이트 (각 이미지마다 다른 정보 설정 가능)
    document.getElementById('currentTime').textContent = '00:00';
    document.getElementById('totalTime').textContent = '03:30';

    // 클릭된 이미지 상태 변경 (checked)
    images.forEach(img => img.classList.remove('checked'));
    selectedImage.classList.add('checked');
}

// 툴박스 밖 클릭 시 툴박스 사라지기
document.addEventListener('click', (e) => {
    if (!musicToolbox.contains(e.target) && !selectedImage.contains(e.target)) {
        musicToolbox.style.display = 'none';
        selectedImage.classList.remove('checked');
    }
});

// 툴박스의 버튼 동작 예시 (재생/정지)
playBtn.addEventListener('click', () => {
    // 재생/정지 기능 구현
    if (playBtn.textContent === '▶️') {
        playBtn.textContent = '⏸️'; // 정지로 변경
    } else {
        playBtn.textContent = '▶️'; // 재생으로 변경
    }
});


let currentDate = new Date();
let formattedDate = currentDate.toISOString().split('T')[0]; // YYYY-MM-DD 형식

let dateCells = document.querySelectorAll('#rankTable td:last-child');
dateCells.forEach(cell => {
    cell.textContent = formattedDate;
});