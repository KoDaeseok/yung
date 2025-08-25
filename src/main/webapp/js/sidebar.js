// js/sidebar.js
document.addEventListener('DOMContentLoaded', () => {
    const reqCntSpan = document.getElementById('reqCnt');
    const smnCntSpan = document.getElementById('smnCnt');

    // 현황판 요소가 페이지에 존재할 때만(즉, 로그인 상태일 때만) 실행
    if (reqCntSpan && smnCntSpan) {
        // 서버에 현황 데이터를 요청하는 함수
        const fetchStatusData = () => {
            fetch('/main/sideStat.do')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    // 성공적으로 데이터를 받아오면 화면에 숫자를 업데이트
                    reqCntSpan.textContent = data.reqCnt || 0;
                    smnCntSpan.textContent = data.smnCnt || 0;
                })
                .catch(error => {
                    console.error('Error fetching side status data:', error);
                    // 에러 발생 시 기본값 0으로 유지
                    reqCntSpan.textContent = 0;
                    smnCntSpan.textContent = 0;
                });
        };

        // 페이지 로드 시 즉시 실행
        fetchStatusData();
    }
});