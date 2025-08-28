// js/suggestion.js
document.addEventListener('DOMContentLoaded', () => {
    const detailPage = document.getElementById('suggestion-detail-buttons');

    if (detailPage) {
        const deleteBtn = document.getElementById('delete-btn');
        if (deleteBtn) {
            deleteBtn.addEventListener('click', () => {
                if (confirm("정말로 삭제하시겠습니까?")) {
                    alert("삭제되었습니다.");
                    location.href = '/suggestion'; // 목록 페이지로 이동
                }
            });
        }
    }
});