// static/js/auth.js
document.addEventListener('DOMContentLoaded', () => {
    const loginPopupBtn = document.getElementById('login-popup-btn');
    const loginPopupModal = document.getElementById('login-popup-modal');
    
    // 로그인 버튼이 없으면(로그인 상태) 아무 작업도 하지 않음
    if (!loginPopupBtn) return;
    
    // 팝업 관련 요소
    const closeModal = loginPopupModal.querySelector('.popup-modal-close');
    const loginForm = document.getElementById('login-form');
    const usernameInput = document.getElementById('popup-username');
    const passwordInput = document.getElementById('popup-password');
    const rememberIdCheckbox = document.getElementById('remember-id');
    const usernameError = document.getElementById('username-error');
    const passwordError = document.getElementById('password-error');

    // 폼 초기화 함수
    const initializeForm = () => {
        const savedUsername = localStorage.getItem('rememberedUsername');
        if (savedUsername) {
            usernameInput.value = savedUsername;
            rememberIdCheckbox.checked = true;
        } else {
            usernameInput.value = '';
            rememberIdCheckbox.checked = false;
        }
        passwordInput.value = '';
        usernameError.textContent = '';
        passwordError.textContent = '';
        usernameInput.classList.remove('error');
        passwordInput.classList.remove('error');
    };

    // 팝업 열기/닫기
    loginPopupBtn.addEventListener('click', (e) => {
        e.preventDefault();
        initializeForm();
        loginPopupModal.style.display = 'flex';
    });
    closeModal.addEventListener('click', () => {
        loginPopupModal.style.display = 'none';
    });
    
    // 아이디 저장 체크박스 이벤트
    rememberIdCheckbox.addEventListener('change', () => {
        if (!rememberIdCheckbox.checked) {
            localStorage.removeItem('rememberedUsername');
        }
    });

    // 로그인 폼 제출 로직
    loginForm.addEventListener('submit', (e) => {
        e.preventDefault();
        
        let isValid = true;
        usernameError.textContent = '';
        passwordError.textContent = '';
        usernameInput.classList.remove('error');
        passwordInput.classList.remove('error');

        if (usernameInput.value.trim() === '') {
            usernameError.textContent = '아이디를 입력해주세요.';
            usernameInput.classList.add('error');
            isValid = false;
        }
        if (passwordInput.value.trim() === '') {
            passwordError.textContent = '비밀번호를 입력해주세요.';
            passwordInput.classList.add('error');
            isValid = false;
        }
        if (!isValid) return;

        if (rememberIdCheckbox.checked) {
            localStorage.setItem('rememberedUsername', usernameInput.value.trim());
        } else {
            localStorage.removeItem('rememberedUsername');
        }

        const formData = new FormData(loginForm);

        fetch('/login', {
            method: 'POST',
            body: new URLSearchParams(formData)
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                window.location.reload();
            } else {
                usernameError.textContent = data.message;
                usernameInput.classList.add('error');
                passwordInput.classList.add('error');
            }
        })
        .catch(error => console.error('Error:', error));
    });

    // [수정] 메인 페이지이고 로그아웃 상태일 때 팝업 자동 표시
    const showPopupOnIndex = () => {
        // 로그인 버튼이 존재하고(로그아웃 상태), 현재 페이지가 메인('/') 페이지일 때
        if (loginPopupBtn && window.location.pathname === '/') {
            initializeForm();
            loginPopupModal.style.display = 'flex';
        }
    };

    showPopupOnIndex();
});