// js/finops_manager.js
document.addEventListener('DOMContentLoaded', () => {
    const formPage = document.getElementById('manager-form');
    const detailPage = document.getElementById('manager-form-detail');

    // form 페이지 (등록/수정) 스크립트
    if (formPage) {
        const isNew = !new URLSearchParams(window.location.search).has('id');

        formPage.addEventListener('submit', (e) => {
            e.preventDefault();
            
            // 유효성 검사
            const requiredFields = [
                { name: "fundCode", message: "펀드를 선택해주세요." },
                { name: "orgType", message: "기관구분을 선택해주세요." },
                { name: "roleType", message: "역할구분을 선택해주세요." },
                { name: "managerName", message: "이름을 입력해주세요." },
                { name: "position", message: "직위를 입력해주세요." },
                { name: "startDate", message: "담당 시작일을 입력해주세요." }
            ];

            for (const field of requiredFields) {
                const input = formPage.querySelector(`[name="${field.name}"]`);
                if (!input.value) {
                    alert(field.message);
                    input.focus();
                    return;
                }
            }

            const message = isNew ? '등록하시겠습니까?' : '저장하시겠습니까?';
            if (confirm(message)) {
                alert('처리되었습니다.');
                location.href = '/finops/manager/list';
            }
        });
    }

    // detail 페이지 스크립트
    if (detailPage) {
        const deleteBtn = document.getElementById('delete-btn');
        if (deleteBtn) {
            deleteBtn.addEventListener('click', () => {
                if (confirm("정말로 삭제하시겠습니까?")) {
                    alert("삭제되었습니다.");
                    location.href = '/finops/manager/list';
                }
            });
        }
    }
});