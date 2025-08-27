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

    let parentNatCodeInput = null;
    let parentNatNameInput = null;

    // 예시 국가 데이터 (실제로는 서버에서 Ajax로 가져와야 함)
    const allData = [
        { natC: 'KR', natKorNm: '대한민국', natEngNm: 'KOREA, REPUBLIC OF' },
        { natC: 'US', natKorNm: '미국', natEngNm: 'UNITED STATES' },
        { natC: 'JP', natKorNm: '일본', natEngNm: 'JAPAN' },
        { natC: 'CN', natKorNm: '중국', natEngNm: 'CHINA' },
        { natC: 'GB', natKorNm: '영국', natEngNm: 'UNITED KINGDOM' },
        { natC: 'DE', natKorNm: '독일', natEngNm: 'GERMANY' },
        { natC: 'FR', natKorNm: '프랑스', natEngNm: 'FRANCE' },
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
            tableBody.innerHTML = '<tr><td colspan="3" class="no-data"><div class="no-data-content">검색 결과가 없습니다.</div></td></tr>';
        } else {
            paginatedItems.forEach(item => {
                const row = document.createElement('tr');
                row.dataset.code = item.natC;
                row.dataset.name = item.natKorNm;
                row.innerHTML = `<td>${item.natC}</td><td>${item.natKorNm}</td><td>${item.natEngNm}</td>`;
                tableBody.appendChild(row);
            });
        }
        updatePagination(totalPages);
        updateItemCounter(start, end, totalItems);
        addRowClickListeners();
    };

    const updatePagination = (totalPages) => {
        // (페이지네이션 UI 업데이트 로직은 펀드 팝업과 동일)
    };
    const updateItemCounter = (start, end, totalItems) => {
        // (아이템 카운터 UI 업데이트 로직은 펀드 팝업과 동일)
    };

    openModalBtns.forEach(btn => {
        btn.addEventListener('click', (e) => {
            const wrapper = e.currentTarget.closest('.input-with-button');
            parentNatCodeInput = wrapper.querySelector('input[name="ivNat"]');
            parentNatNameInput = wrapper.querySelector('input[name="ivNatNm"]');
            
            searchInput.value = '';
            currentData = [...allData];
            render(1);
            nationModal.style.display = 'flex';
        });
    });

    closeModalBtn.addEventListener('click', () => nationModal.style.display = 'none');
    nationModal.addEventListener('click', (e) => e.target === nationModal && (nationModal.style.display = 'none'));

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
                if (parentNatCodeInput) parentNatCodeInput.value = row.dataset.code;
                if (parentNatNameInput) parentNatNameInput.value = row.dataset.name;
                nationModal.style.display = 'none';
            });
        });
    };
});