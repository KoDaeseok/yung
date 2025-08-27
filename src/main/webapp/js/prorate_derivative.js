// js/prorate_derivative.js
document.addEventListener('DOMContentLoaded', () => {
    const derivativeForm = document.getElementById('derivative-form');
    if (!derivativeForm) return;

    // 숫자 입력 필드에 자동으로 콤마(,) 추가
    const numericInputs = derivativeForm.querySelectorAll('.numeric-input');
    numericInputs.forEach(input => {
        input.addEventListener('input', (e) => {
            const value = e.target.value.replace(/[^0-9]/g, '');
            e.target.value = Number(value).toLocaleString();
        });
    });

    // 금리 입력 필드 유효성 검사 (숫자와 소수점만 허용)
    const rateInputs = derivativeForm.querySelectorAll('.interest-rate-input');
    rateInputs.forEach(input => {
        input.addEventListener('input', (e) => {
            e.target.value = e.target.value.replace(/[^0-9.]/g, '');
        });
    });


    // 폼 제출 시 유효성 검사
    derivativeForm.addEventListener('submit', (e) => {
        e.preventDefault();

        const assetScale = derivativeForm.querySelector('[name="assetScale"]');
        const equityCapital = derivativeForm.querySelector('[name="equityCapital"]');
        const firstRateInput = derivativeForm.querySelector('[name="rate_1"]');

        if (assetScale.value.trim() === '') {
            alert('자산규모를 입력해주세요.');
            assetScale.focus();
            return;
        }

        if (equityCapital.value.trim() === '') {
            alert('자기자본을 입력해주세요.');
            equityCapital.focus();
            return;
        }

        // 최소 하나의 금리는 입력되었는지 확인
        let isAtLeastOneRateEntered = false;
        rateInputs.forEach(input => {
            if (input.value.trim() !== '') {
                isAtLeastOneRateEntered = true;
            }
        });

        if (!isAtLeastOneRateEntered) {
            alert('하나 이상의 금리를 입력해야 합니다.');
            firstRateInput.focus();
            return;
        }

        if (confirm('제출하시겠습니까?')) {
            // 실제 서버 전송 로직은 여기에 구현합니다.
            // const formData = new FormData(derivativeForm);
            // fetch('/your-submit-url', { method: 'POST', body: formData }).then(...);
            
            alert('등록되었습니다.');
            location.href = '/prorate/derivative/list';
        }
    });
});