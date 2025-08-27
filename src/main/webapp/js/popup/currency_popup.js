// js/popup/currency_popup.js
document.addEventListener('DOMContentLoaded', () => {
    const currencyModal = document.getElementById('currency-search-modal');
    if (!currencyModal) return;

    const openModalBtns = document.querySelectorAll('.btn-currency-search');
    const closeModalBtn = currencyModal.querySelector('.modal-close-btn');
    const tableBody = currencyModal.querySelector('.results-table tbody');
    const paginationContainer = currencyModal.querySelector('.pagination');
    const itemCounter = currencyModal.querySelector('.item-counter');
    const searchInput = currencyModal.querySelector('.search-bar input');
    const searchButton = currencyModal.querySelector('.search-bar button');
    const searchConditionSelect = currencyModal.querySelector('.search-bar select');

    let parentCurCodeInput = null;
    let parentCurNameInput = null;

    // 예시 통화 데이터 (실제로는 서버에서 Ajax로 가져와야 합니다)
    const allData = [
        { curC: 'KRW', curNm: '원화', natNm: '대한민국' },
        { curC: 'USD', curNm: '미국달러', natNm: '미국' },
        { curC: 'JPY', curNm: '일본엔', natNm: '일본' },
        { curC: 'CNY', curNm: '중국위안', natNm: '중국' },
        { curC: 'EUR', curNm: '유로', natNm: '유럽연합' },
        { curC: 'GBP', curNm: '영국파운드', natNm: '영국' },
        { curC: 'AUD', curNm: '호주달러', natNm: '호주' },
        { curC: 'CAD', curNm: '캐나다달러', natNm: '캐나다' }
    ];
    let currentData = [...allData];
    let currentPage = 1;
    const itemsPerPage = 10;

    const render = (page) => {
        currentPage = page;
        const totalItems = currentData.length;
        const totalPages = Math.ceil(totalItems / itemsPerPage);
        tableBody.innerHTML = '';
        const start = (page - 1) * itemsPerPage;
        const end = start + itemsPerPage;
        const paginatedItems = currentData.slice(start, end);

        if (paginatedItems.length === 0) {
            tableBody.innerHTML = '<tr><td colspan="3" class="no-data"><div class="no-data-content" style="height:150px;">검색 결과가 없습니다.</div></td></tr>';
        } else {
            paginatedItems.forEach(item => {
                const row = document.createElement('tr');
                row.dataset.code = item.curC;
                row.dataset.name = item.curNm;
                row.innerHTML = `<td>${item.curC}</td><td>${item.curNm}</td><td>${item.natNm}</td>`;
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
        paginationHTML += `<a href="#" class="arrow ${currentPage === 1 ? 'disabled' : ''}" data-page="1"><i class="fa-solid fa-angles-left"></i></a>`;
        paginationHTML += `<a href="#" class="arrow ${currentPage === 1 ? 'disabled' : ''}" data-page="${currentPage - 1}"><i class="fa-solid fa-angle-left"></i></a>`;

        for (let i = startPage; i <= endPage; i++) {
            paginationHTML += `<a href="#" class="${i === currentPage ? 'active' : ''}" data-page="${i}">${i}</a>`;
        }

        paginationHTML += `<a href="#" class="arrow ${currentPage === totalPages ? 'disabled' : ''}" data-page="${currentPage + 1}"><i class="fa-solid fa-angle-right"></i></a>`;
        paginationHTML += `<a href="#" class="arrow ${currentPage === totalPages ? 'disabled' : ''}" data-page="${totalPages}"><i class="fa-solid fa-angles-right"></i></a>`;
        
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
    
    openModalBtns.forEach(btn => {
        btn.addEventListener('click', (e) => {
            const wrapper = e.currentTarget.closest('.input-with-button');
            // 팝업이 부모 창의 어떤 입력 필드를 채워야 하는지 설정
            parentCurCodeInput = wrapper.querySelector('input[name="ivPrpCur"]');
            parentCurNameInput = wrapper.querySelector('input[name="ivPrpCurNm"]');
            
            searchInput.value = '';
            currentData = [...allData];
            render(1);
            currencyModal.style.display = 'flex';
        });
    });

    closeModalBtn.addEventListener('click', () => currencyModal.style.display = 'none');
    currencyModal.addEventListener('click', (e) => e.target === currencyModal && (currencyModal.style.display = 'none'));
    
    paginationContainer.addEventListener('click', (e) => {
        e.preventDefault();
        const target = e.target.closest('a');
        if (target && !target.classList.contains('disabled')) {
            const page = parseInt(target.getAttribute('data-page'));
            if (page) render(page);
        }
    });

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
                if (parentCurCodeInput) parentCurCodeInput.value = row.dataset.code;
                if (parentCurNameInput) parentCurNameInput.value = row.dataset.name;
                currencyModal.style.display = 'none';
            });
        });
    };
});