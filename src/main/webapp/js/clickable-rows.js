// js/clickable-rows.js
document.addEventListener('DOMContentLoaded', () => {
    // data-href 속성을 가진 모든 테이블 행(tr)을 찾습니다.
    const clickableRows = document.querySelectorAll('tr[data-href]');
    
    // 각 행에 클릭 이벤트를 추가합니다.
    clickableRows.forEach(row => {
        row.addEventListener('click', () => {
            // data-href 속성에 지정된 URL로 페이지를 이동시킵니다.
            window.location.href = row.dataset.href;
        });
    });
});