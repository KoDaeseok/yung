// js/provest/propvest_form.js
document.addEventListener('DOMContentLoaded', () => {
    // 폼과 관련된 주요 요소들을 가져옵니다.
    const form = document.getElementById('propvest-form');
    
    // --- 초기화 함수 ---
    const initForm = () => {
        // 제안기관, 사업자번호, 제안자 정보 설정
        $('#prpOrg').val('KB자산운용'); 
        $('#bsNo').val('116-81-33085'); 
        $('#prpsMnNm').val('정보시스템부');
        
        // 날짜 선택기(Datepicker) 초기화
        $("#metSchdDate").datepicker({
            dateFormat: "yy-mm-dd"
        });
        
        // 아이콘 클릭 시 날짜 선택기 표시
        $("#datepicker-icon").on("click", () => {
            $("#metSchdDate").datepicker("show");
        });

        // 콤보박스(Select) 데이터 로드
        loadSelectOptions();
    };

    // --- 콤보박스 옵션 로드 (서버 연동 시 실제 데이터로 대체) ---
    const loadSelectOptions = () => {
        // 예시 데이터
        const teams = [{ c: '104010', cdNm: '대체투자1팀' }, { c: '103010', cdNm: '기업금융1팀' }];
        const fields = [{ c: 'A13', cdNm: '주식스타일형' }, { c: 'C12', cdNm: '국내부동산' }];
        const investmentZones = [{ c: '01', cdNm: '국내' }, { c: '02', cdNm: '해외' }];
        const countries = [{c: 'KR', cdNm: '대한민국'}, {c: 'US', cdNm: '미국'}];

        populateSelect('oprTeamTc', teams);
        populateSelect('ivFld', fields);
        populateSelect('ivZoneTc', investmentZones);
        populateSelect('ivNat', countries);
        
        // 초기에는 국가 선택 비활성화
        $('#ivNat').prop('disabled', true);
    };

    const populateSelect = (elementId, data) => {
        const select = $(`#${elementId}`);
        select.empty().append('<option value="">선택</option>');
        data.forEach(item => {
            select.append(`<option value="${item.c}">${item.cdNm}</option>`);
        });
    };
    
    // --- 이벤트 핸들러 ---

    // 담당팀 변경 시 담당자 목록 동적 로드
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

    // 투자분야 변경 시 UI 동적 변경
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
    
    // [복원] 투자지역 변경 시 국가 선택 활성화/비활성화 및 통화 설정
    $('#ivZoneTc').on('change', function(){
        const natSelect = $('#ivNat');
        if($(this).val() === '02'){ // 해외
            natSelect.prop('disabled', false);
            $('#ivPrpCur').val('');
            $('#ivPrpCurNm').val(''); 
        } else { // 국내
            natSelect.prop('disabled', true).val('');
            $('#ivPrpCur').val('KRW');
            $('#ivPrpCurNm').val('원화'); 
        }
    });

    // 제안통화 검색 버튼 클릭 (팝업 시뮬레이션)
    $('#btn_CurSrch').on('click', function() {
        alert('통화 검색 팝업을 표시합니다 (현재는 시뮬레이션).');
        $('#ivPrpCur').val('USD');
        $('#ivPrpCurNm').val('미국 달러');
    });

    // 파일 업로드 시 파일명 표시
    $('#file-upload').on('change', function() {
        const fileName = this.files[0] ? this.files[0].name : "파일을 첨부해주세요.";
        $('#fileName').val(fileName);
    });

    // 초기화 버튼
    $('#btn_reset').on('click', () => {
       if(confirm('작성한 내용을 모두 초기화하시겠습니까?')){
           form.reset();
           $('select').val('');
           $('#metSchdDate').val('');
           $('#fileName').val('파일을 첨부해주세요.');
           $('#ivPrpCurNm').val('');
           $('#ivNatNm').val(''); 
           $('.investment-details').show();
           $('.tr-manager').hide();
           $('#ivNat').prop('disabled', true);
       }
    });

    // 등록 버튼 (유효성 검사)
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
            { id: 'prcoChmnNm', msg: '제안사 담당자를 입력해주세요.' }
        ];

        for (const field of requiredFields) {
            const element = document.getElementById(field.id);
            if (!element.value) {
                alert(field.msg);
                element.focus();
                return;
            }
        }
        
        const ivFldValue = $('#ivFld').val();
        if (ivFldValue !== 'A13' && ivFldValue !== 'A21' && ivFldValue !== 'A23') {
             if (!$('#ivZoneTc').val()) { alert('투자지역을 선택해주세요.'); return; }
             if ($('#ivZoneTc').val() === '02' && !$('#ivNat').val()) { alert('해외 투자 시 국가를 선택해주세요.'); return; }
             if (!$('#ivPrpCur').val()) { alert('제안통화를 입력해주세요.'); return; }
             if (!$('#ivTrm').val()) { alert('투자기간을 입력해주세요.'); return; }
             if (!$('#ivPrpAmt').val()) { alert('본회제안금액을 입력해주세요.'); return; }
             if (!$('#objPrrt').val()) { alert('목표수익률(IRR)을 입력해주세요.'); return; }
        } else {
             if (!$('#chrgOprMn').val()) { alert('담당 운용역을 입력해주세요.'); return; }
             if (!$('#chrgOprMnCarr').val()) { alert('담당 운용역 경력을 입력해주세요.'); return; }
        }

        if (confirm('신규 투자제안을 등록하시겠습니까?')) {
            alert('등록되었습니다.');
            location.href = '/propvest/list'; 
        }
    });

    // --- 초기화 함수 실행 ---
    initForm();
});