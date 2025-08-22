// js/finops_popup.js
document.addEventListener('DOMContentLoaded', () => {
    const openModalBtns = document.querySelectorAll('.btn-search');
    const modal = document.getElementById('fund-search-modal');

    if (!modal) return;

    const closeModalBtn = modal.querySelector('.modal-close-btn');
    const tableBody = modal.querySelector('.results-table tbody');
    const paginationContainer = modal.querySelector('.pagination');
    const itemCounter = modal.querySelector('.item-counter');
    
    const searchConditionSelect = modal.querySelector('.search-bar select');
    const searchInput = modal.querySelector('.search-bar input');
    const searchButton = modal.querySelector('.search-bar button');

    let parentFundCodeInput = null;
    let parentFundNameInput = null;

    const allData = [
        { code: "951515032501", name: "KBPG에너지인프라모특별자산신탁" },
        { code: "951112103101", name: "KB스타오피스사모부동산신탁" },
        { code: "A001", name: "미래에셋성장주식형펀드" },
        { code: "B002", name: "삼성가치주식형펀드" },
        { code: "C003", name: "한국투자네비게이터증권투자신탁" },
        { code: "D004", name: "신한BNPP좋은아침코리아" },
        { code: "E005", name: "KB밸류포커스자(주식)" },
        { code: "F006", name: "마이다스블루칩성장주" },
        { code: "G007", name: "대신배당성장주식형" },
        { code: "H008", name: "한화코리아레전드" },
        { code: "I009", name: "흥국멀티플레이자(주식)" },
        { code: "J010", name: "유리웰스파argo-v" },
        { code: "K011", name: "트러스톤다이나믹코리아" },
        { code: "L012", name: "에셋플러스코리아리치투게더" },
        { code: "M013", name: "메리츠코리아증권투자신탁" },
        { code: "N014", name: "IBK그랑프리증권자투자신탁" },
        { code: "O015", name: "KTB빅샷증권자투자신탁" },
        { code: "P016", name: "NH-Amundi Allset성장" },
        { code: "Q017", name: "키움장대주식형증권" },
        { code: "R018", name: "하나UBS코리아대표그룹" },
        { code: "S019", name: "동양중소형고배당" },
        { code: "T020", name: "신영마라톤증권투자신탁" },
        { code: "U021", name: "베어링고배당증권투자회사" },
        { code: "V022", name: "KB액티브배당증권" }
    ];
    let currentData = [...allData];
    let currentPage = 1;
    const itemsPerPage = 10;

    // --- 렌더링 및 페이지네이션 함수 ---
    const render = (page) => {
        currentPage = page;
        const totalItems = currentData.length;
        const totalPages = Math.ceil(totalItems / itemsPerPage);
        tableBody.innerHTML = '';
        const start = (page - 1) * itemsPerPage;
        const end = start + itemsPerPage;
        const paginatedItems = currentData.slice(start, end);

        if (paginatedItems.length === 0) {
            tableBody.innerHTML = '<tr><td colspan="2" class="no-data"><div class="no-data-content" style="height:150px;">검색 결과가 없습니다.</div></td></tr>';
        } else {
            paginatedItems.forEach(item => {
                const row = document.createElement('tr');
                row.setAttribute('data-code', item.code);
                row.setAttribute('data-name', item.name);
                row.innerHTML = `<td>${item.code}</td><td>${item.name}</td>`;
                tableBody.appendChild(row);
            });
        }
        updatePagination(totalPages);
        updateItemCounter(start, end, totalItems);
        addRowClickListeners();
    };

    const updatePagination = (totalPages) => {
        paginationContainer.innerHTML = '';
        if (totalPages === 0) return;

        const maxPagesToShow = 5;
        let startPage = Math.floor((currentPage - 1) / maxPagesToShow) * maxPagesToShow + 1;
        let endPage = Math.min(startPage + maxPagesToShow - 1, totalPages);

        let paginationHTML = '';
        paginationHTML += `<a href="#" class="arrow ${currentPage === 1 ? 'disabled' : ''}" data-page="1">&laquo;</a>`;
        paginationHTML += `<a href="#" class="arrow ${currentPage === 1 ? 'disabled' : ''}" data-page="${currentPage - 1}">&lsaquo;</a>`;

        for (let i = startPage; i <= endPage; i++) {
            paginationHTML += `<a href="#" class="${i === currentPage ? 'active' : ''}" data-page="${i}">${i}</a>`;
        }

        paginationHTML += `<a href="#" class="arrow ${currentPage === totalPages ? 'disabled' : ''}" data-page="${currentPage + 1}">&rsaquo;</a>`;
        paginationHTML += `<a href="#" class="arrow ${currentPage === totalPages ? 'disabled' : ''}" data-page="${totalPages}">&raquo;</a>`;
        
        paginationContainer.innerHTML = paginationHTML;
    };
    
    const updateItemCounter = (start, end, totalItems) => {
        if (totalItems === 0) {
            itemCounter.textContent = '0 - 0 of 0';
        } else {
            const endItem = Math.min(end, totalItems);
            itemCounter.textContent = `${start + 1} - ${endItem} of ${totalItems}`;
        }
    };
    
    // --- 팝업 열기/닫기 ---
    openModalBtns.forEach(btn => {
        btn.addEventListener('click', (e) => {
            const wrapper = e.currentTarget.closest('.input-with-button');
            parentFundCodeInput = wrapper.querySelector('input[name="fundCode"]');
            parentFundNameInput = wrapper.querySelector('input[name="fundName"]');
            
            searchInput.value = '';
            currentData = [...allData];
            render(1);
            modal.style.display = 'flex';
        });
    });

    closeModalBtn.addEventListener('click', () => modal.style.display = 'none');
    modal.addEventListener('click', (e) => e.target === modal && (modal.style.display = 'none'));
    
    paginationContainer.addEventListener('click', (e) => {
        e.preventDefault();
        const target = e.target.closest('a');
        if (target && !target.classList.contains('disabled')) {
            const page = parseInt(target.getAttribute('data-page'));
            if (page) render(page);
        }
    });

    // --- 검색 및 결과 선택 기능 ---
    const performSearch = () => {
        const condition = searchConditionSelect.value;
        const query = searchInput.value.toLowerCase();
        
        currentData = allData.filter(item => {
            if (!query) return true;
            const targetField = item[condition] || '';
            return targetField.toLowerCase().includes(query);
        });
        render(1);
    };

    searchButton.addEventListener('click', performSearch);
    searchInput.addEventListener('keyup', e => e.key === 'Enter' && performSearch());

    const addRowClickListeners = () => {
        tableBody.querySelectorAll('tr').forEach(row => {
            row.addEventListener('click', () => {
                if (parentFundCodeInput && parentFundNameInput) {
                    parentFundCodeInput.value = row.getAttribute('data-code');
                    parentFundNameInput.value = row.getAttribute('data-name');
                }
                modal.style.display = 'none';
            });
        });
    };
});