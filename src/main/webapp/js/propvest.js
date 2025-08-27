// js/propvest.js

// 이 파일은 투자제안 등록(form)과 상세(detail) 페이지의 모든 JavaScript 기능을 담당합니다.
document.addEventListener('DOMContentLoaded', () => {
    const propvestForm = document.getElementById('propvest-form');
    if (!propvestForm) return;

    // ========================================================
    // 공통 기능 및 이벤트 핸들러 (등록/상세 페이지 모두 적용)
    // ========================================================

    // Select 태그에 option을 채우는 헬퍼 함수
    const populateSelect = (elementId, data) => {
        const select = $(`#${elementId}`);
        select.empty().append('<option value="">선택</option>');
        data.forEach(item => {
            select.append(`<option value="${item.c}">${item.cdNm}</option>`);
        });
    };

    // 투자분야 선택 시 이벤트
    $('#ivFld').on('change', function() {
        const selectedField = $(this).val();
        const zoneCode = selectedField ? selectedField.substring(1, 2) : '';

        if (zoneCode === '1') {
            $('#ivZoneTc').val('01').trigger('change');
        } else if (zoneCode === '2') {
            $('#ivZoneTc').val('02').trigger('change');
        } else {
            $('#ivZoneTc').val('').trigger('change');
        }
    });

    // 투자지역 선택 시 이벤트
    $('#ivZoneTc').on('change', function() {
        const selectedZone = $(this).val();
        const nationSearchBtn = $('.btn-nation-search');

        if (selectedZone === '02') { // '해외'
            nationSearchBtn.prop('disabled', false);
            $('#ivNat, #ivNatNm, #ivPrpCur, #ivPrpCurNm').val('');
        } else if (selectedZone === '01') { // '국내'
            nationSearchBtn.prop('disabled', true);
            $('#ivNat').val('KR');
            $('#ivNatNm').val('대한민국');
            $('#ivPrpCur').val('KRW');
            $('#ivPrpCurNm').val('원화');
        } else { // '선택'
            nationSearchBtn.prop('disabled', true);
            $('#ivNat, #ivNatNm, #ivPrpCur, #ivPrpCurNm').val('');
        }
    });

    // ========================================================
    // 등록 페이지 (propvest_form.jsp) 전용 기능
    // ========================================================
    const registerBtn = document.getElementById('btn_reg');
    if (registerBtn) {
        const loadSelectOptions = () => {
            const teams = [{ c: '104010', cdNm: '대체투자1팀' }, { c: '103010', cdNm: '기업금융1팀' }];
            const fields = [
                { c: 'C12', cdNm: '국내부동산' },
                { c: 'C22', cdNm: '해외부동산' },
                { c: 'A13', cdNm: '주식스타일형' },
                { c: 'A21', cdNm: '해외주식-스타일형' }
            ];
            const defaultOption = [{ c: '', cdNm: '선택' }];

            populateSelect('oprTeamTc', teams);
            populateSelect('acmn', defaultOption);
            populateSelect('ivFld', fields);
            populateSelect('ivKindTc', defaultOption);
        };

        const initForm = () => {
            $('#prpOrg').val('KB자산운용');
            $('#bsNo').val('116-81-33085');
            $('#prpsMnNm').val('정보시스템부');
            loadSelectOptions();
            $('#ivZoneTc').trigger('change');
        };
        
        // [추가] 파일 업로드 시 파일명 표시
        $('#file-upload').on('change', function() {
            const fileName = this.files[0] ? this.files[0].name : "파일을 첨부해주세요.";
            $('#fileName').val(fileName);
        });

        $('#btn_reset').on('click', () => {
           if(confirm('작성한 내용을 모두 초기화하시겠습니까?')){
               form.reset();
               $('select').val('');
               $('#fileName').val('파일을 첨부해주세요.');
               initForm();
           }
        });

        propvestForm.addEventListener('submit', (e) => {
            e.preventDefault();
            // ... 유효성 검사 로직 ...
            if (confirm('신규 투자제안을 등록하시겠습니까?')) {
                alert('등록되었습니다.');
                location.href = '/propvest/list'; 
            }
        });

        initForm();
    }

    // ========================================================
    // 상세 페이지 (propvest_detail.jsp) 전용 기능
    // ========================================================
    const editBtn = document.getElementById('edit-btn');
    if (editBtn) {
        const viewModeButtons = document.getElementById('view-mode-buttons');
        const editModeButtons = document.getElementById('edit-mode-buttons');
        const deleteBtn = document.getElementById('delete-btn');
        const cancelBtn = document.getElementById('cancel-btn');
        const pageTitle = document.querySelector('.page-content h1');
        const originalTitleHTML = pageTitle ? pageTitle.innerHTML : '';
        
        const formFields = propvestForm.querySelectorAll('input, select, textarea');
        const fileAddWrapper = document.getElementById('file-add-wrapper');
        const deleteFileBtns = propvestForm.querySelectorAll('.btn-delete-file');

        const enableEditMode = () => {
            formFields.forEach(field => {
                if (field.name !== 'prpOrg' && field.name !== 'bsNo' && field.name !== 'prpsNm') {
                    field.readOnly = false;
                    field.disabled = false;
                }
            });
            
            if ($('#ivZoneTc').val() === '02') {
                 $('.btn-nation-search').prop('disabled', false);
            }
            $('.btn-currency-search').prop('disabled', false);

            if (fileAddWrapper) fileAddWrapper.style.display = 'block';
            deleteFileBtns.forEach(btn => btn.style.display = 'inline-block');
            
            viewModeButtons.style.display = 'none';
            editModeButtons.style.display = 'flex';
            if (pageTitle) pageTitle.innerHTML = originalTitleHTML.replace('상세', '수정');
        };

        const disableEditMode = () => {
            location.reload();
        };

        propvestForm.addEventListener('submit', (e) => {
            e.preventDefault();
            if (confirm('수정한 내용을 저장하시겠습니까?')) {
                alert('저장되었습니다.');
                location.reload();
            }
        });

        editBtn.addEventListener('click', enableEditMode);
        cancelBtn.addEventListener('click', disableEditMode);

        deleteBtn.addEventListener('click', () => {
            if (confirm('정말로 이 제안을 삭제하시겠습니까?')) {
                alert('삭제되었습니다.');
                location.href = '/propvest/list';
            }
        });
        
        // [추가] 상세 페이지 수정 모드에서 파일 삭제 기능
        deleteFileBtns.forEach(btn => {
            btn.addEventListener('click', (e) => {
                if(confirm('파일을 삭제하시겠습니까?')) {
                    e.target.closest('.file-item').remove();
                }
            });
        });

        $(function() {
            $("#meetingDatepicker").datepicker({ dateFormat: "yy-mm-dd" });
            $("#datepicker-icon").on("click", function() {
                if (!$("#meetingDatepicker").is(':disabled')) {
                    $("#meetingDatepicker").datepicker("show");
                }
            });
        });
    }
});