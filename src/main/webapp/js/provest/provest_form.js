// js/provest/provest_form.js
document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('propvest-form');
    
    const initForm = () => {
        // 초기값 설정
        $('#prpOrg').val('KB자산운용'); 
        $('#bsNo').val('116-81-33085'); 
        $('#prpsMnNm').val('정보시스템부');
        
        loadSelectOptions();
    };

    const loadSelectOptions = () => {
        // (실제로는 서버에서 데이터를 받아와야 합니다)
        const teams = [{ c: '104010', cdNm: '대체투자1팀' }, { c: '103010', cdNm: '기업금융1팀' }];
        const fields = [{ c: 'A13', cdNm: '주식스타일형' }, { c: 'C12', cdNm: '국내부동산' }];
        const investmentZones = [{ c: '01', cdNm: '국내' }, { c: '02', cdNm: '해외' }];

        populateSelect('oprTeamTc', teams);
        populateSelect('ivFld', fields);
        populateSelect('ivZoneTc', investmentZones);
        
        // 초기에는 국가 검색 버튼 비활성화
        $('#btn_NatSrch').prop('disabled', true);
    };

    const populateSelect = (elementId, data) => {
        const select = $(`#${elementId}`);
        select.empty().append('<option value="">선택</option>');
        data.forEach(item => {
            select.append(`<option value="${item.c}">${item.cdNm}</option>`);
        });
    };
    
    // '투자지역' 선택 시 이벤트
    $('#ivZoneTc').on('change', function(){
        const natCodeInput = $('#ivNat');
        const natNameInput = $('#ivNatNm');
        const natSearchBtn = $('#btn_NatSrch');

        if($(this).val() === '02'){ // '해외' 선택 시
            natSearchBtn.prop('disabled', false); // 국가 검색 버튼 활성화
            natCodeInput.val('');
            natNameInput.val('');
            $('#ivPrpCur, #ivPrpCurNm').val(''); 
        } else { // '국내' 선택 시
            natSearchBtn.prop('disabled', true); // 국가 검색 버튼 비활성화
            natCodeInput.val('KR');
            natNameInput.val('대한민국');
            $('#ivPrpCur').val('KRW');
            $('#ivPrpCurNm').val('원화'); 
        }
    });

    // 파일 업로드 시 파일명 표시
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
           $('#btn_NatSrch').prop('disabled', true);
       }
    });

    form.addEventListener('submit', (e) => {
        e.preventDefault();
        
        const requiredFields = [
            { id: 'prpRprtTit', msg: '제안제목을 입력해주세요.' },
            { id: 'ivObj', msg: '투자개요를 입력해주세요.' },
            { id: 'oprTeamTc', msg: '공제회 담당팀을 선택해주세요.' },
            { id: 'acmn', msg: '공제회 담당자를 선택해주세요.' },
            { id: 'ivFld', msg: '투자분야를 선택해주세요.' },
            { id: 'ivKindTc', msg: '유형을 선택해주세요.' },
            { id: 'ivCntn', msg: '투자내용을 입력해주세요.' },
            { id: 'prcoChmnNm', msg: '제안사 담당자를 입력해주세요.' },
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