// js/dms.js
document.addEventListener('DOMContentLoaded', () => {

    // 파일 업로드 UI 공통 로직
    const fileUploadLogic = (form) => {
        if (!form) return;

        const fileInput = form.querySelector('#file-upload');
        const fileListContainer = form.querySelector('#file-list-container');

        if (fileInput && fileListContainer) {
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
                // 입력 필드 초기화로 동일한 파일 재업로드 가능
                event.target.value = '';
            });

            fileListContainer.addEventListener('click', (e) => {
                if (e.target.classList.contains('btn-delete-file')) {
                    e.target.closest('.file-item').remove();
                }
            });
        }
    };

    // --- 요청자료 등록 페이지 스크립트 ---
    const requestResponseForm = document.getElementById('request-response-form');
    if (requestResponseForm) {
        fileUploadLogic(requestResponseForm);

        requestResponseForm.addEventListener('submit', (e) => {
            e.preventDefault();
            if (requestResponseForm.querySelector('.file-item') === null) {
                alert('제공자료를 1개 이상 첨부해야 합니다.');
                return;
            }
            if (confirm('자료를 등록하시겠습니까?')) {
                alert('등록되었습니다.');
                location.href = '/dms/request/list';
            }
        });
    }

    // --- 리서치자료 등록 페이지 스크립트 ---
    const researchForm = document.getElementById('research-form');
    if (researchForm) {
        fileUploadLogic(researchForm);

        researchForm.addEventListener('submit', (e) => {
            e.preventDefault();
             if (researchForm.querySelector('.file-item') === null) {
                alert('제공자료를 1개 이상 첨부해야 합니다.');
                return;
            }
            if (confirm('리서치 자료를 등록하시겠습니까?')) {
                alert('등록되었습니다.');
                location.href = '/dms/request/list';
            }
        });
    }
});