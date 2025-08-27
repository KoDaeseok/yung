// js/provest/propvest_detail.js
document.addEventListener('DOMContentLoaded', () => {
    const propvestForm = document.getElementById('propvest-form');
    if (propvestForm) {
        const editBtn = document.getElementById('edit-btn');
        const cancelBtn = document.getElementById('cancel-btn');
        const viewModeButtons = document.getElementById('view-mode-buttons');
        const editModeButtons = document.getElementById('edit-mode-buttons');
        const buttonWrapper = document.getElementById('button-group-wrapper');
        
        if (editBtn) { 
            const formFields = propvestForm.querySelectorAll('input, select, textarea');
            const fileBtn = propvestForm.querySelector('.file-input-wrapper .btn');

            const enableEditMode = () => {
                formFields.forEach(field => {
                    field.readOnly = false;
                    field.disabled = false;
                });
                fileBtn.classList.remove('btn-disabled');
                viewModeButtons.style.display = 'none';
                editModeButtons.style.display = 'flex';
                buttonWrapper.classList.remove('button-container');
                buttonWrapper.classList.add('form-buttons');
            };

            const disableEditMode = () => {
                location.reload();
            };
            
            editBtn.addEventListener('click', enableEditMode);
            cancelBtn.addEventListener('click', disableEditMode);

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