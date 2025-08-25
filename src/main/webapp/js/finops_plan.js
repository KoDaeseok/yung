// js/finops_plan.js
document.addEventListener('DOMContentLoaded', () => {
    const planForm = document.getElementById('plan-form');
    if (!planForm) return;

    const gridContainer = document.getElementById('plan-grid');
    const isDetailPage = !!document.querySelector('h1 i.fa-circle-info');

    const formatNumber = (num) => {
        if (num === null || num === undefined || num === '') return '';
        return Number(num).toLocaleString();
    };

    const createGrid = (data) => {
        gridContainer.innerHTML = ''; // Clear previous grid

        const table = document.createElement('table');
        table.className = 'data-table plan-table';

        // THEAD
        const thead = document.createElement('thead');
        // [수정] 헤더 구조 변경: '구분' 헤더 추가 및 클래스 명확화
        let headerHTML = `
            <tr>
                <th colspan="2" style="text-align:center;">구분</th>
        `;
        for (let i = 1; i <= 12; i++) {
            headerHTML += `<th colspan="3">${i}월</th>`;
        }
        headerHTML += `</tr><tr>
            <th class="sticky-col-code">펀드코드</th>
            <th class="sticky-col-name">펀드명</th>
        `;
        for (let i = 1; i <= 12; i++) {
            headerHTML += `
                <th>투자금액(집행예정)</th>
                <th>회수금액(상환예정)</th>
                <th>회수이익</th>
            `;
        }
        headerHTML += `</tr>`;
        thead.innerHTML = headerHTML;
        table.appendChild(thead);

        // TBODY
        const tbody = document.createElement('tbody');
        if (!data || data.length === 0) {
            const message = isDetailPage ? "등록된 데이터가 없습니다." : "업로드할 데이터가 없습니다.";
            tbody.innerHTML = `<tr><td colspan="38" class="no-data"><div class="no-data-content" style="height: 300px;">${message}</div></td></tr>`;
        } else {
            data.forEach(row => {
                // [수정] 본문 TD에 클래스 추가
                let rowHTML = `
                    <tr>
                        <td class="sticky-col-code">${row.fundC || ''}</td>
                        <td class="sticky-col-name" style="text-align:left;">${row.fundNm || ''}</td>
                `;
                for (let i = 1; i <= 12; i++) {
                    rowHTML += `
                        <td style="text-align:right;">${formatNumber(row['ivAmt' + i])}</td>
                        <td style="text-align:right;">${formatNumber(row['rtnPrin' + i])}</td>
                        <td style="text-align:right;">${formatNumber(row['rtnPrft' + i])}</td>
                    `;
                }
                rowHTML += `</tr>`;
                tbody.innerHTML += rowHTML;
            });
        }
        table.appendChild(tbody);

        gridContainer.appendChild(table);
    };
    
    // --- 페이지 타입에 따른 초기화 ---
    if (isDetailPage) {
        const sampleDetailData = [
            { fundC: "F001", fundNm: "샘플 주식형 펀드", ivAmt1: 1000000, rtnPrin1: 0, rtnPrft1: 0, ivAmt2: 1500000, rtnPrin2: 50000, rtnPrft2: 10000, ivAmt3: 500000, ivAmt4: 250000, ivAmt5: 300000, ivAmt6: 400000 },
            { fundC: "F002", fundNm: "샘플 채권형 펀드", ivAmt1: 2000000, rtnPrin1: 100000, rtnPrft1: 20000, ivAmt3: 500000, rtnPrin3: 0, rtnPrft3: 0, ivAmt7: 1200000, rtnPrin8: 500000, rtnPrft8: 50000 }
        ];
        createGrid(sampleDetailData);
    } else {
        createGrid([]);
    }


    // --- Event Listeners (등록/수정 페이지 전용) ---
    if (!isDetailPage) {
        document.getElementById('btn-download-template').addEventListener('click', () => {
            alert('연간 자금계획 엑셀 양식을 다운로드합니다.');
        });

        document.getElementById('excel-upload').addEventListener('change', (event) => {
            const file = event.target.files[0];
            if (file) {
                alert(`'${file.name}' 파일이 업로드되었습니다. (시뮬레이션)`);
                const sampleData = [
                    { fundC: "F001", fundNm: "샘플 주식형 펀드", ivAmt1: 1000000, rtnPrin1: 0, rtnPrft1: 0, ivAmt2: 1500000, rtnPrin2: 50000, rtnPrft2: 10000, ivAmt3: 500000, ivAmt4: 250000, ivAmt5: 300000, ivAmt6: 400000 },
                    { fundC: "F002", fundNm: "샘플 채권형 펀드", ivAmt1: 2000000, rtnPrin1: 100000, rtnPrft1: 20000, ivAmt3: 500000, rtnPrin3: 0, rtnPrft3: 0, ivAmt7: 1200000, rtnPrin8: 500000, rtnPrft8: 50000 }
                ];
                createGrid(sampleData);
            }
        });

        document.getElementById('btn-register').addEventListener('click', () => {
            const targetYear = document.getElementById('target-year').value;
            if (!targetYear || targetYear.length !== 4) {
                alert("대상년도 4자리를 정확히 입력해주세요.");
                return;
            }
            if (gridContainer.querySelector('.no-data')) {
                alert("업로드된 데이터가 없습니다.");
                return;
            }
            if (confirm(`${targetYear}년 연간 자금계획을 저장하시겠습니까?`)) {
                alert("저장되었습니다.");
                location.href = '/finops/plan/list';
            }
        });
    }
    
    // 상세 페이지의 삭제 버튼 이벤트
    const deleteBtn = document.getElementById('delete-btn');
    if(deleteBtn) {
        deleteBtn.addEventListener('click', () => {
            const targetYear = new URLSearchParams(window.location.search).get('year');
            if (confirm(`${targetYear}년 연간 자금계획을 삭제하시겠습니까?`)) {
                alert("삭제되었습니다.");
                location.href = '/finops/plan/list';
            }
        });
    }
});