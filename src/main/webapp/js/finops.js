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

            // [추가] asset 상세 페이지용 요소
            const excelButtons = document.getElementById('edit-mode-excel-buttons');
            const viewModeAssetBody = document.getElementById('view-mode-asset-body');
            const editModeAssetBody = document.getElementById('asset-table-body');


            const enableEditMode = () => {
                formFields.forEach(field => {
                    field.readOnly = false;
                    field.disabled = false;
                });
                
                if(searchBtn) searchBtn.disabled = false;
                if(fileAddWrapper) fileAddWrapper.style.display = 'block';
                deleteFileBtns.forEach(btn => btn.style.display = 'inline-block');
                
                // [추가] asset 상세 페이지 수정 모드 처리
                if(excelButtons) excelButtons.style.display = 'flex';
                if(viewModeAssetBody) viewModeAssetBody.style.display = 'none';
                if(editModeAssetBody) editModeAssetBody.style.display = '';


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
            event.stopPropagation(); // 이벤트 버블링을 막아 행 전체 클릭 방지
            const filename = link.getAttribute('data-filename');
            alert('"' + filename + '" 다운로드를 시작합니다.'); 
        });
    });
});