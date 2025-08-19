// static/js/signup.js
document.addEventListener('DOMContentLoaded', () => {
    // --- 요소 가져오기 ---
    const openModalBtn = document.getElementById('open-org-search-btn');
    const modal = document.getElementById('org-search-modal');
    if (!openModalBtn || !modal) return;

    const closeModalBtn = modal.querySelector('.modal-close-btn');
    const orgCodeInput = document.getElementById('org-code');
    const orgNameInput = document.getElementById('org-name');
    const tableBody = modal.querySelector('.results-table tbody');
    const paginationContainer = modal.querySelector('.pagination');
    const itemCounter = modal.querySelector('.item-counter');
    const searchInput = modal.querySelector('.search-bar input');
    const searchButton = modal.querySelector('.btn-search-action');
    
    // --- 임시 데이터 (52개) ---
    const allData = [
        { code: "A001", type: "국내증권사", name: "(구)NH투자증권" },
        { code: "B002", type: "금융기타(증금등)", name: "(주)생보제일호위탁관리부동산투자회사" },
        { code: "C003", type: "기타기관", name: "(주)케이리얼티제6호위탁관리부동산투자회사" },
        { code: "D004", type: "국내은행", name: "HSBC은행" },
        { code: "E005", type: "국내운용사", name: "IMM PE" },
        { code: "F006", type: "국내증권사", name: "KB증권(주)" },
        { code: "G007", type: "국내은행", name: "KEB하나은행" },
        { code: "H008", type: "국내운용사", name: "LB자산운용" },
        { code: "I009", type: "국내증권사", name: "NH투자증권 결제업무부" },
        { code: "J010", type: "국내은행", name: "경남은행" },
        { code: "K011", type: "국내증권사", name: "골드만삭스증권" },
        { code: "L012", type: "국내운용사", name: "대신자산운용" },
        { code: "M013", type: "국내증권사", name: "메리츠증권" },
        { code: "N014", type: "국내은행", name: "부산은행" },
        { code: "O015", type: "국내운용사", name: "삼성SRA자산운용" },
        { code: "P016", type: "기타기관", name: "서울보증보험" },
        { code: "Q017", type: "국내증권사", name: "신영증권" },
        { code: "R018", type: "국내운용사", name: "이지스자산운용" },
        { code: "S019", type: "국내은행", name: "전북은행" },
        { code: "T020", type: "국내증권사", name: "카카오페이증권" },
        { code: "U021", type: "국내운용사", name: "코람코자산운용" },
        { code: "V022", type: "기타기관", name: "하나대체투자자산운용" },
        { code: "W023", type: "국내증권사", name: "하이투자증권" },
        { code: "X024", type: "국내은행", name: "한국산업은행" },
        { code: "Y025", type: "국내운용사", name: "한화자산운용" },
        { code: "Z026", type: "기타기관", name: "흥국생명보험" },
        { code: "A027", type: "국내증권사", name: "현대차증권" },
        { code: "B028", type: "국내은행", name: "BNK부산은행" },
        { code: "C029", type: "국내운용사", name: "CBRE자산운용" },
        { code: "D030", type: "국내증권사", name: "DB금융투자" },
        { code: "E031", type: "국내은행", name: "DGB대구은행" },
        { code: "F032", type: "국내운용사", name: "FG자산운용" },
        { code: "G033", type: "국내증권사", name: "IBK투자증권" },
        { code: "H034", type: "국내은행", name: "JB전북은행" },
        { code: "I035", type: "국내운용사", name: "JR투자운용" },
        { code: "J036", type: "국내증권사", name: "KB증권" },
        { code: "K037", type: "국내은행", name: "KDB산업은행" },
        { code: "L038", type: "국내운용사", name: "KOREIT" },
        { code: "M039", type: "국내증권사", name: "KTB투자증권" },
        { code: "N040", type: "국내은행", name: "SC제일은행" },
        { code: "O041", type: "국내운용사", name: "YNP자산운용" },
        { code: "P042", type: "기타기관", name: "교보생명" },
        { code: "Q043", type: "국내증권사", name: "대신증권" },
        { code: "R044", type: "국내은행", name: "신한은행" },
        { code: "S045", type: "국내운용사", name: "우리자산운용" },
        { code: "T046", type: "기타기관", name: "우체국" },
        { code: "U047", type: "국내증권사", name: "유안타증권" },
        { code: "V048", type: "국내은행", name: "제주은행" },
        { code: "W049", type: "국내운용사", name: "칸서스자산운용" },
        { code: "X050", type: "기타기관", name: "하나생명" },
        { code: "Y051", type: "국내증권사", name: "한국투자증권" },
        { code: "Z052", type: "국내은행", name: "우리은행" }
    ];

    let currentData = [...allData]; // 현재 필터링된 데이터를 저장할 배열
    let currentPage = 1;
    const itemsPerPage = 15;

    // --- 렌더링 및 UI 업데이트 함수 ---
    const render = (page) => {
        currentPage = page;
        const totalItems = currentData.length;
        const totalPages = Math.ceil(totalItems / itemsPerPage);

        // 테이블 렌더링
        tableBody.innerHTML = '';
        const start = (page - 1) * itemsPerPage;
        const end = start + itemsPerPage;
        const paginatedItems = currentData.slice(start, end);

        if (paginatedItems.length === 0) {
            tableBody.innerHTML = '<tr><td colspan="2">검색 결과가 없습니다.</td></tr>';
        } else {
            paginatedItems.forEach(item => {
                const row = document.createElement('tr');
                row.setAttribute('data-code', item.code);
                row.setAttribute('data-name', item.name);
                row.innerHTML = `<td>${item.type}</td><td>${item.name}</td>`;
                tableBody.appendChild(row);
            });
        }

        // 페이지네이션 및 카운터 업데이트
        updatePagination(totalPages);
        updateItemCounter(start, end, totalItems);
        addRowClickListeners();
    };
    
    const updatePagination = (totalPages) => {
        paginationContainer.innerHTML = '';
        if (totalPages === 0) return;
        
        const maxPagesToShow = 5;
        let startPage = Math.floor((currentPage - 1) / maxPagesToShow) * maxPagesToShow + 1;
        let endPage = startPage + maxPagesToShow - 1;
        if (endPage > totalPages) endPage = totalPages;

        paginationContainer.innerHTML += `<a href="#" class="arrow" data-page="1">&laquo;</a>`;
        paginationContainer.innerHTML += `<a href="#" class="arrow" data-page="${currentPage - 1}">&lsaquo;</a>`;

        for (let i = startPage; i <= endPage; i++) {
            paginationContainer.innerHTML += `<a href="#" class="${i === currentPage ? 'active' : ''}" data-page="${i}">${i}</a>`;
        }
        
        paginationContainer.innerHTML += `<a href="#" class="arrow" data-page="${currentPage + 1}">&rsaquo;</a>`;
        paginationContainer.innerHTML += `<a href="#" class="arrow" data-page="${totalPages}">&raquo;</a>`;
        
        if (currentPage === 1) {
            paginationContainer.querySelector('[data-page="1"]').classList.add('disabled');
            paginationContainer.querySelector(`[data-page="${currentPage - 1}"]`).classList.add('disabled');
        }
        if (currentPage === totalPages) {
            paginationContainer.querySelector(`[data-page="${currentPage + 1}"]`).classList.add('disabled');
            paginationContainer.querySelector(`[data-page="${totalPages}"]`).classList.add('disabled');
        }
    };
    
    const updateItemCounter = (start, end, totalItems) => {
        if (totalItems === 0) {
            itemCounter.textContent = '0 - 0 of 0';
            return;
        }
        const endItem = Math.min(end, totalItems);
        itemCounter.textContent = `${start + 1} - ${endItem} of ${totalItems}`;
    };

    // --- 이벤트 리스너 ---
    openModalBtn.addEventListener('click', () => {
        searchInput.value = ''; // 검색창 초기화
        currentData = [...allData]; // 데이터 초기화
        render(1);
        modal.style.display = 'flex';
    });

    closeModalBtn.addEventListener('click', () => modal.style.display = 'none');
    modal.addEventListener('click', (e) => {
        if (e.target === modal) modal.style.display = 'none';
    });

    paginationContainer.addEventListener('click', (e) => {
        e.preventDefault();
        const target = e.target.closest('a');
        if (target && !target.classList.contains('disabled')) {
            const page = parseInt(target.getAttribute('data-page'));
            if (page) render(page);
        }
    });

    const addRowClickListeners = () => {
        tableBody.querySelectorAll('tr').forEach(row => {
            row.addEventListener('click', () => {
                orgCodeInput.value = row.getAttribute('data-code');
                orgNameInput.value = row.getAttribute('data-name');
                modal.style.display = 'none';
            });
        });
    };
    
    // [추가] 조회(검색) 기능
    const performSearch = () => {
        const searchTerm = searchInput.value.toLowerCase();
        currentData = allData.filter(item => item.name.toLowerCase().includes(searchTerm));
        render(1); // 검색 결과의 첫 페이지로 이동
    };

    searchButton.addEventListener('click', performSearch);
    searchInput.addEventListener('keyup', (e) => {
        if (e.key === 'Enter') {
            performSearch();
        }
    });
});