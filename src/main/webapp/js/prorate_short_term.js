// js/prorate_short_term.js
document.addEventListener('DOMContentLoaded', () => {
    const shortTermForm = document.getElementById('short-term-form');
    if (!shortTermForm) return;

    // 숫자 입력 필드에 자동으로 콤마(,) 추가
    const numericInputs = shortTermForm.querySelectorAll('.numeric-input');
    numericInputs.forEach(input => {
        input.addEventListener('input', (e) => {
            let value = e.target.value.replace(/[^0-9]/g, '');
            e.target.value = value ? Number(value).toLocaleString() : '';
        });
    });
    
    // 금리 입력 필드는 숫자와 소수점만 허용
    const rateInput = shortTermForm.querySelector('.interest-rate-input');
    if(rateInput) {
        rateInput.addEventListener('input', (e) => {
            e.target.value = e.target.value.replace(/[^0-9.]/g, '');
        });
    }

    // 폼 제출 시 유효성 검사
    shortTermForm.addEventListener('submit', (e) => {
        e.preventDefault();

        const requiredFields = [
            { name: 'productType', message: '상품유형을 입력해주세요.' },
            { name: 'interestRate', message: '금리를 입력해주세요.' },
            { name: 'period', message: '기간을 입력해주세요.' },
            { name: 'managerPosition', message: '직위명을 입력해주세요.' }
        ];

        for (const field of requiredFields) {
            const input = shortTermForm.querySelector(`[name="${field.name}"]`);
            if (input.value.trim() === '') {
                alert(field.message);
                input.focus();
                return;
            }
        }

        if (confirm('등록하시겠습니까?')) {
            // 실제 서버 전송 로직은 여기에 구현합니다.
            // const formData = new FormData(shortTermForm);
            // fetch('/your-submit-url', { method: 'POST', body: formData }).then(...);
            
            alert('등록되었습니다.');
            location.href = '/prorate/short_term/list';
        }
    });
});