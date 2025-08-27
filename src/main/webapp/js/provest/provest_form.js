document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('propvest-form');
    
    const initForm = () => {
        $('#prpOrg').val('KB자산운용'); 
        $('#bsNo').val('116-81-33085'); 
        $('#prpsMnNm').val('정보시스템부');
        
        $("#metSchdDate").datepicker({ dateFormat: "yy-mm-dd" });
        $("#datepicker-icon").on("click", () => { $("#metSchdDate").datepicker("show"); });

        loadSelectOptions();
    };

    const loadSelectOptions = () => {
        const teams = [{ c: '104010', cdNm: '대체투자1팀' }, { c: '103010', cdNm: '기업금융1팀' }];
        const fields = [{ c: 'A13', cdNm: '주식스타일형' }, { c: 'C12', cdNm: '국내부동산' }];
        const investmentZones = [{ c: '01', cdNm: '국내' }, { c: '02', cdNm: '해외' }];
        const countries = [{c: 'KR', cdNm: '대한민국'}, {c: 'US', cdNm: '미국'}];

        populateSelect('oprTeamTc', teams);
        populateSelect('ivFld', fields);
        populateSelect('ivZoneTc', investmentZones);
        populateSelect('ivNat', countries);
        
        $('#ivNat').prop('disabled', true);
    };

    const populateSelect = (elementId, data) => {
        const select = $(`#${elementId}`);
        select.empty().append('<option value="">선택</option>');
        data.forEach(item => {
            select.append(`<option value="${item.c}">${item.cdNm}</option>`);
        });
    };
    
    $('#oprTeamTc').on('change', function() {
        const teamCode = $(this).val();
        const acmnSelect = $('#acmn');
        acmnSelect.empty().append('<option value="">선택</option>');
        if (teamCode) {
            const managers = [{ usid: 'user1', userNm: '김담당' }, { usid: 'user2', userNm: '박팀장' }];
            managers.forEach(item => {
                acmnSelect.append(`<option value="${item.usid}">${item.userNm}</option>`);
            });
        }
    });

    $('#ivFld').on('change', function() {
        const value = $(this).val();
        if (value === 'A13' || value === 'A21' || value === 'A23') {
            $('.investment-details').hide();
            $('.tr-manager').show();
            if(value === 'A13') $('.meeting-details').show();
        } else {
            $('.investment-details').show();
            $('.tr-manager').hide();
        }
    });
    
    $('#ivZoneTc').on('change', function(){
        const natSelect = $('#ivNat');
        if($(this).val() === '02'){ // 해외
            natSelect.prop('disabled', false);
            $('#ivPrpCur, #ivPrpCurNm').val(''); 
        } else { // 국내
            natSelect.prop('disabled', true).val('');
            $('#ivPrpCur').val('KRW');
            $('#ivPrpCurNm').val('원화'); 
        }
    });

    $('#file-upload').on('change', function() {
        const fileName = this.files[0] ? this.files[0].name : "파일을 첨부해주세요.";
        $('#fileName').val(fileName);
    });

    $('#btn_reset').on('click', () => {
       if(confirm('작성한 내용을 모두 초기화하시겠습니까?')){
           form.reset();
           $('select').val('');
           $('#metSchdDate').val('');
           $('#fileName').val('파일을 첨부해주세요.');
           $('#ivPrpCurNm, #ivNatNm').val(''); 
           $('.investment-details').show();
           $('.tr-manager').hide();
           $('#ivNat').prop('disabled', true);
       }
    });

    form.addEventListener('submit', (e) => {
        e.preventDefault();
        
        const requiredFields = [
            { id: 'prpRprtTit', msg: '제안제목을 입력해주세요.' },
            { id: 'ivObj', msg: '투자개요를 입력해주세요.' },
            // ... (기타 모든 필수 필드 검사) ...
        ];

        for (const field of requiredFields) {
            const element = document.getElementById(field.id);
            if (!element.value) {
                alert(field.msg);
                element.focus();
                return;
            }
        }
        
        if (confirm('신규 투자제안을 등록하시겠습니까?')) {
            alert('등록되었습니다.');
            location.href = '/propvest/list'; 
        }
    });

    initForm();
});