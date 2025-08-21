// js/provest.js

document.addEventListener('DOMContentLoaded', () => {
    // --- 상세 페이지 스크립트 ---
    const propvestForm = document.getElementById('propvest-form');
    if (propvestForm) {
        // 버튼 요소 선택
        const editBtn = document.getElementById('edit-btn');
        const cancelBtn = document.getElementById('cancel-btn');
        const viewModeButtons = document.getElementById('view-mode-buttons');
        const editModeButtons = document.getElementById('edit-mode-buttons');
        
        if (editBtn) { // 상세 페이지인지 한번 더 확인
            const fileBtn = propvestForm.querySelector('.file-input-wrapper .btn');
            const formFields = propvestForm.querySelectorAll('input, select, textarea');

            // 수정 모드 활성화 함수
            const enableEditMode = () => {
                formFields.forEach(field => {
                    field.readOnly = false;
                    field.disabled = false;
                });
                fileBtn.classList.remove('btn-disabled');
                viewModeButtons.style.display = 'none';
                editModeButtons.style.display = 'flex';
            };

            // 수정 모드 비활성화 (취소) 함수
            const disableEditMode = () => {
                location.reload();
            };
            
            // 버튼에 클릭 이벤트 연결
            editBtn.addEventListener('click', enableEditMode);
            cancelBtn.addEventListener('click', disableEditMode);

            // jQuery UI 달력 기능
            $(function() {
                $("#meetingDatepicker").datepicker({ dateFormat: "yy-mm-dd" });
                $("#datepicker-icon").on("click", function() {
                    if (!$("#meetingDatepicker").is(':disabled')) {
                        $("#meetingDatepicker").datepicker("show");
                    }
                });
            });
        }
    }
});