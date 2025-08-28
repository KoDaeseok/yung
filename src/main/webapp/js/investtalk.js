document.addEventListener('DOMContentLoaded', () => {
    // --- 상세 페이지 스크립트 ---
    const detailForm = document.getElementById('investtalk-detail-form');
    if (detailForm) {
        const deleteBtn = document.getElementById('delete-btn');
        if (deleteBtn) {
            deleteBtn.addEventListener('click', () => {
                if (confirm('정말로 이 제안을 삭제하시겠습니까?')) {
                    alert('삭제되었습니다.');
                    location.href = '/investtalk/list';
                }
            });
        }
    }

    // --- 등록/수정 폼 스크립트 ---
    const investtalkForm = document.getElementById('investtalk-form');
    if (investtalkForm) {
        const meetingTypeSelect = investtalkForm.querySelector('[name="meetingType"]');
        const relatedFundRow = investtalkForm.querySelector('.meeting-field[style*="display"]'); // 관련 펀드 행
        const locationTypeSelect = investtalkForm.querySelector('[name="locationType"]');
        const locationInput = investtalkForm.querySelector('[name="location"]');
        const locationRequiredSpan = document.getElementById('location-required');
        const cancelBtn = document.getElementById('cancel-btn');

        // [추가] 미팅 유형 변경 시, '관련 펀드' 필드 표시/숨김 처리
        if (meetingTypeSelect && relatedFundRow) {
            meetingTypeSelect.addEventListener('change', (e) => {
                if (e.target.value === '기존 투자 관련') {
                    relatedFundRow.style.display = '';
                } else {
                    relatedFundRow.style.display = 'none';
                    // 다른 유형 선택 시 선택값 초기화
                    const fundSelect = relatedFundRow.querySelector('[name="fundCode"]');
                    if(fundSelect) fundSelect.value = '';
                }
            });
        }
        
        // 장소구분 변경 로직
        if (locationTypeSelect && locationInput && locationRequiredSpan) {
            locationTypeSelect.addEventListener('change', (e) => {
                if (e.target.value === '외부') {
                    locationInput.readOnly = false;
                    locationRequiredSpan.style.display = '';
                } else {
                    locationInput.readOnly = true;
                    locationInput.value = '';
                    locationRequiredSpan.style.display = 'none';
                }
            });
        }
        
        // 취소 버튼 이벤트
        if (cancelBtn) {
            cancelBtn.addEventListener('click', () => {
                const cancelUrl = cancelBtn.dataset.cancelUrl;
                if (cancelUrl) {
                    location.href = cancelUrl;
                }
            });
        }

        // 폼 제출 시 유효성 검사
        investtalkForm.addEventListener('submit', (e) => {
            e.preventDefault();
            
            // 여기에 유효성 검사 로직을 추가할 수 있습니다.
            // 예: if (form.querySelector('[name="title"]').value.trim() === '') { alert('주제를 입력하세요'); return; }

            const isNew = !new URLSearchParams(window.location.search).has('id');
            const message = isNew ? '제안을 등록하시겠습니까?' : '변경 내용을 저장하시겠습니까?';

            if (confirm(message)) {
                alert(isNew ? '등록되었습니다.' : '저장되었습니다.');
                location.href = '/investtalk/list';
            }
        });

        // 파일 업로드 관련 UI 처리
        const fileInput = document.getElementById('file-upload');
        const fileListContainer = document.getElementById('file-list-container');
        if(fileInput && fileListContainer) {
            fileInput.addEventListener('change', (event) => {
                const files = event.target.files;
                for (const file of files) {
                    const fileItem = document.createElement('div');
                    fileItem.className = 'file-item';
                    fileItem.innerHTML = `
                        <span class="text-link">${file.name}</span>
                        <button type="button" class="btn-delete-file">&times;</button>
                    `;
                    fileListContainer.appendChild(fileItem);
                }
                event.target.value = '';
            });
            
            fileListContainer.addEventListener('click', (e) => {
                if(e.target.classList.contains('btn-delete-file')) {
                    e.target.closest('.file-item').remove();
                }
            });
        }
    }
});