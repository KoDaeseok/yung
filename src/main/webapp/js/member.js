// js/member.js
document.addEventListener('DOMContentLoaded', () => {

    // --- 회원정보 변경 페이지 ---
    const infoForm = document.getElementById('member-info-form');
    if (infoForm) {
        // 비밀번호 변경 팝업 열기
        const changePwBtn = document.getElementById('change-password-btn');
        const passwordPopup = document.getElementById('password-popup-modal');
        if (changePwBtn && passwordPopup) {
            const closeBtn = passwordPopup.querySelector('.popup-modal-close');
            changePwBtn.addEventListener('click', () => passwordPopup.style.display = 'flex');
            closeBtn.addEventListener('click', () => passwordPopup.style.display = 'none');
        }

        // 비밀번호 초기화 버튼 (관리자용)
        document.querySelectorAll('.reset-password-btn').forEach(btn => {
            btn.addEventListener('click', (e) => {
                e.stopPropagation(); // 행 클릭 이벤트 방지
                const userId = e.target.dataset.userid;
                if (confirm(`'${userId}' 사용자의 비밀번호를 초기화하시겠습니까?`)) {
                    alert('비밀번호가 초기화되었습니다.');
                }
            });
        });
    }

    // --- 신규 아이디 등록 페이지 ---
    const addForm = document.getElementById('member-add-form');
    if (addForm) {
        addForm.addEventListener('submit', (e) => {
            e.preventDefault();
            // 간단한 유효성 검사 예시
            if (addForm.querySelector('[name="userId"]').value.trim() === '') {
                alert('아이디를 입력해주세요.');
                return;
            }
            if (confirm('신규 아이디를 등록하시겠습니까?')) {
                alert('등록되었습니다.');
                location.href = '/member/info';
            }
        });
    }

    // --- 공통: 클릭 가능한 행 ---
    document.querySelectorAll('tr[data-href]').forEach(row => {
        row.addEventListener('click', () => {
            window.location.href = row.dataset.href;
        });
    });
});