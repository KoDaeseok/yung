// static/js/auth.js
document.addEventListener('DOMContentLoaded', () => {
    const loginPopupBtn = document.getElementById('login-popup-btn');
    const loginPopupModal = document.getElementById('login-popup-modal');
    
    if (!loginPopupModal) return;

    const closeModal = loginPopupModal.querySelector('.popup-modal-close');
    const loginForm = document.getElementById('login-form');
    const usernameInput = document.getElementById('popup-username');
    const passwordInput = document.getElementById('popup-password');
    const rememberIdCheckbox = document.getElementById('remember-id');
    const usernameError = document.getElementById('username-error');
    const passwordError = document.getElementById('password-error');

    // 폼의 상태를 초기화하는 함수
    const initializeForm = () => {
        const savedUsername = localStorage.getItem('rememberedUsername');
        
        if (savedUsername) {
            usernameInput.value = savedUsername;
            rememberIdCheckbox.checked = true;
        } else {
            usernameInput.value = '';
            rememberIdCheckbox.checked = false;
        }

        // 비밀번호와 오류 메시지는 항상 초기화
        passwordInput.value = '';
        usernameError.textContent = '';
        passwordError.textContent = '';
        usernameInput.classList.remove('error');
        passwordInput.classList.remove('error');
    };

    // 팝업 열기
    loginPopupBtn.addEventListener('click', (e) => {
        e.preventDefault();
        initializeForm(); // 폼 상태를 초기화
        loginPopupModal.style.display = 'flex';
    });

    // 팝업 닫기 (X 버튼)
    closeModal.addEventListener('click', () => {
        loginPopupModal.style.display = 'none';
    });
    
    // 아이디 저장 체크박스 변경 시 즉시 localStorage에 반영
    rememberIdCheckbox.addEventListener('change', () => {
        if (!rememberIdCheckbox.checked) {
            // 체크 해제 시 바로 저장된 아이디 삭제
            localStorage.removeItem('rememberedUsername');
        }
    });

    // 로그인 유효성 검사 및 아이디 저장 로직
    loginForm.addEventListener('submit', (e) => {
        e.preventDefault();

        usernameError.textContent = '';
        passwordError.textContent = '';
        usernameInput.classList.remove('error');
        passwordInput.classList.remove('error');

        const username = usernameInput.value.trim();
        const password = passwordInput.value.trim();
        let isValid = true;

        if (username === '') {
            usernameError.textContent = '아이디를 입력해주세요.';
            usernameInput.classList.add('error');
            usernameInput.focus();
            isValid = false;
        }

        if (password === '') {
            passwordError.textContent = '비밀번호를 입력해주세요.';
            passwordInput.classList.add('error');
            if (isValid) {
                passwordInput.focus();
            }
            isValid = false;
        }

        if (!isValid) {
            return;
        }

        // 아이디 저장 처리 (로그인 성공 시점에 최종 결정)
        if (rememberIdCheckbox.checked) {
            localStorage.setItem('rememberedUsername', username);
        } else {
            localStorage.removeItem('rememberedUsername');
        }

        const formData = new FormData(loginForm);
        
        // 서버로 로그인 요청
        fetch('/login', {
            method: 'POST',
            body: new URLSearchParams(formData)
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // 로그인 성공 시 페이지 새로고침
                window.location.reload();
            } else {
                // 로그인 실패 시 에러 메시지 표시
                usernameError.textContent = data.message;
                usernameInput.classList.add('error');
                passwordInput.classList.add('error');
            }
        })
        .catch(error => console.error('Error:', error));
    });
});