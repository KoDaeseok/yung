// js/popup/nation_popup.js
document.addEventListener('DOMContentLoaded', () => {
    const nationModal = document.getElementById('nation-search-modal');
    if (!nationModal) return;

    const openModalBtns = document.querySelectorAll('.btn-nation-search');
    const closeModalBtn = nationModal.querySelector('.modal-close-btn');
    const tableBody = nationModal.querySelector('.results-table tbody');
    const paginationContainer = nationModal.querySelector('.pagination');
    const itemCounter = nationModal.querySelector('.item-counter');
    const searchInput = nationModal.querySelector('.search-bar input');
    const searchButton = nationModal.querySelector('.search-bar button');
    const searchConditionSelect = nationModal.querySelector('.search-bar select');

    let currentTargetFields = {};

    // [핵심 수정] 국가 데이터에 통화 코드(curC)와 통화명(curNm) 추가
    const allData = [
        { natC: 'KR', natKorNm: '대한민국', natEngNm: 'KOREA, REPUBLIC OF', curC: 'KRW', curNm: '원화' },
        { natC: 'US', natKorNm: '미국', natEngNm: 'UNITED STATES', curC: 'USD', curNm: '미국달러' },
        { natC: 'JP', natKorNm: '일본', natEngNm: 'JAPAN', curC: 'JPY', curNm: '일본엔' },
        { natC: 'CN', natKorNm: '중국', natEngNm: 'CHINA', curC: 'CNY', curNm: '중국위안' },
        { natC: 'GB', natKorNm: '영국', natEngNm: 'UNITED KINGDOM', curC: 'GBP', curNm: '영국파운드' },
        { natC: 'DE', natKorNm: '독일', natEngNm: 'GERMANY', curC: 'EUR', curNm: '유로' },
        { natC: 'FR', natKorNm: '프랑스', natEngNm: 'FRANCE', curC: 'EUR', curNm: '유로' },
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
                row.dataset.code = item.natC;
                row.dataset.name = item.natKorNm;
                // [핵심 수정] 생성되는 행(row)에 통화 정보를 data 속성으로 추가
                row.dataset.curCode = item.curC;
                row.dataset.curName = item.curNm;
                row.innerHTML = `<td>${item.natC}</td><td>${item.natKorNm}</td><td>${item.natEngNm}</td>`;
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
            const form = e.currentTarget.closest('form');
            const wrapper = e.currentTarget.closest('.input-with-button');
            
            // [핵심 수정] 팝업이 값을 채워야 할 필드를 동적으로 찾아 설정 (국가 + 통화)
            currentTargetFields = {
                code: wrapper.querySelector('input[name="ivNat"]'),
                name: wrapper.querySelector('input[name="ivNatNm"]'),
                curCode: form.querySelector('input[name="ivPrpCur"]'),
                curName: form.querySelector('input[name="ivPrpCurNm"]')
            };
            
            searchInput.value = '';
            currentData = [...allData];
            render(1);
            nationModal.style.display = 'flex';
        });
    });

    closeModalBtn.addEventListener('click', () => nationModal.style.display = 'none');
    nationModal.addEventListener('click', (e) => e.target === nationModal && (nationModal.style.display = 'none'));
    
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
                // [핵심 수정] 설정된 input 필드에 국가와 통화 값을 모두 채움
                if (currentTargetFields.code) currentTargetFields.code.value = row.dataset.code;
                if (currentTargetFields.name) currentTargetFields.name.value = row.dataset.name;
                if (currentTargetFields.curCode) currentTargetFields.curCode.value = row.dataset.curCode;
                if (currentTargetFields.curName) currentTargetFields.curName.value = row.dataset.curName;
                
                nationModal.style.display = 'none';
            });
        });
    };
});