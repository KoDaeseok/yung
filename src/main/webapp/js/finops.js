// js/finops.js
document.addEventListener('DOMContentLoaded', () => {
    
    // --- 상세 페이지 스크립트 ---
    const finopsForm = document.getElementById('finops-form');
    if (finopsForm) {
        const editBtn = document.getElementById('edit-btn');
        if (editBtn) {
            const viewModeButtons = document.getElementById('view-mode-buttons');
            const editModeButtons = document.getElementById('edit-mode-buttons');
            const formFields = finopsForm.querySelectorAll('input, select, textarea');
            const searchBtn = finopsForm.querySelector('.btn-search');
            const fileAddWrapper = document.getElementById('file-add-wrapper');
            const deleteFileBtns = finopsForm.querySelectorAll('.btn-delete-file');

            const enableEditMode = () => {
                formFields.forEach(field => {
                    field.readOnly = false;
                    field.disabled = false;
                });
                
                if(searchBtn) searchBtn.disabled = false;
                if(fileAddWrapper) fileAddWrapper.style.display = 'block';
                deleteFileBtns.forEach(btn => btn.style.display = 'inline-block');
                
                viewModeButtons.style.display = 'none';
                editModeButtons.style.display = 'flex';
            };

            const disableEditMode = () => {
                location.reload();
            };

            editBtn.addEventListener('click', enableEditMode);
            document.getElementById('cancel-btn').addEventListener('click', disableEditMode);

            // 파일 삭제 버튼에 이벤트 추가
            deleteFileBtns.forEach(btn => {
                btn.addEventListener('click', (e) => {
                    // 실제로는 서버에 삭제 요청 후 성공 시 아래 코드 실행
                    e.target.closest('.file-item').remove();
                });
            });
        }
    }

    // --- 목록 페이지 다운로드 기능 ---
    const downloadLinks = document.querySelectorAll('.download-link');
    downloadLinks.forEach(link => {
        link.addEventListener('click', (event) => {
            event.preventDefault();
            const filename = link.getAttribute('data-filename');
            alert('"' + filename + '" 다운로드를 시작합니다.'); 
        });
    });
});