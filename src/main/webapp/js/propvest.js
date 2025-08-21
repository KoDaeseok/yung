// js/provest.js

document.addEventListener('DOMContentLoaded', () => {
    // --- 상세 페이지 스크립트 ---
    const propvestForm = document.getElementById('propvest-form');
    if (propvestForm) {
        // 버튼 및 컨테이너 요소 선택
        const editBtn = document.getElementById('edit-btn');
        const cancelBtn = document.getElementById('cancel-btn');
        const viewModeButtons = document.getElementById('view-mode-buttons');
        const editModeButtons = document.getElementById('edit-mode-buttons');
        const buttonWrapper = document.getElementById('button-group-wrapper'); // 버튼 그룹 전체 컨테이너
        
        if (editBtn) { // 상세 페이지인지 확인
            const fileBtn = propvestForm.querySelector('.file-input-wrapper .btn');
            const formFields = propvestForm.querySelectorAll('input, select, textarea');

            // 수정 모드 활성화 함수
            const enableEditMode = () => {
                formFields.forEach(field => {
                    field.readOnly = false;
                    field.disabled = false;
                });
                fileBtn.classList.remove('btn-disabled');

                // 버튼 그룹 표시 전환
                viewModeButtons.style.display = 'none';
                editModeButtons.style.display = 'flex';
                
                // 컨테이너 클래스를 변경하여 중앙 정렬로 전환
                buttonWrapper.classList.remove('button-container');
                buttonWrapper.classList.add('form-buttons');
            };

            // 수정 모드 비활성화 (취소) 함수
            const disableEditMode = () => {
                location.reload(); // 간단하게 페이지 새로고침으로 처리
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