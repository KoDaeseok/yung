// js/finops_asset.js

document.addEventListener('DOMContentLoaded', () => {
    // 숫자 포맷팅 함수
    const formatNumber = (num) => num ? Number(num).toLocaleString() : '0';

    // 테이블 렌더링 함수
    const renderAssetTable = (data) => {
        const tableBody = document.getElementById('asset-table-body');
        tableBody.innerHTML = ''; // 테이블 초기화

        if (!data || data.length === 0) {
            tableBody.innerHTML = `<tr><td colspan="12" class="no-data"><div class="no-data-content" style="height: 250px;">데이터가 없습니다.</div></td></tr>`;
            return;
        }

        data.forEach(item => {
            const row = `
                <tr>
                    <td style="text-align: center;">${item.ivObj || ''}</td>
                    <td>${item.ivObjDesc || ''}</td>
                    <td style="text-align: center;">${item.ivIsoNatSymNm || ''}</td>
                    <td style="text-align: center;">${item.entrAstsIvMethNm || ''}</td>
                    <td style="text-align: center;">${item.entrAstsRateNm || ''}</td>
                    <td style="text-align: center;">${item.ivStatTcNm || ''}</td>
                    <td style="text-align: right;">${formatNumber(item.ivAmt)}</td>
                    <td style="text-align: right;">${formatNumber(item.fxIvAmt)}</td>
                    <td style="text-align: right;">${formatNumber(item.ivEstmAmt)}</td>
                    <td style="text-align: right;">${formatNumber(item.fxIvEstmAmt)}</td>
                    <td style="text-align: right;">${item.grossTvpi || ''}</td>
                    <td style="text-align: right;">${item.grossIrr || ''}</td>
                </tr>
            `;
            tableBody.innerHTML += row;
        });
    };

    // 엑셀 업로드 이벤트 처리
    const excelUploadInput = document.getElementById('excel-upload');
    excelUploadInput.addEventListener('change', (event) => {
        const file = event.target.files[0];
        if (!file) {
            alert('파일을 선택해주세요.');
            return;
        }

        // 실제 프로젝트에서는 여기서 파일을 서버로 전송하고,
        // 서버는 엑셀을 파싱하여 JSON 형태로 응답합니다.
        // 아래는 서버로부터 응답받은 가상의 JSON 데이터입니다.
        console.log(`'${file.name}' 파일 업로드 시뮬레이션`);
        alert('엑셀 파일이 업로드되었습니다. 서버로부터 받은 데이터로 그리드를 채웁니다.');
        
        const sampleData = [
            { ivObj: "강남 프라임 빌딩", ivObjDesc: "오피스 자산", ivIsoNatSymNm: "대한민국", entrAstsIvMethNm: "대출", entrAstsRateNm: "고정", ivStatTcNm: "운용중", ivAmt: "1500000000", fxIvAmt: "0", ivEstmAmt: "1550000000", fxIvEstmAmt: "0", grossTvpi: "1.03", grossIrr: "7.5" },
            { ivObj: "판교 데이터센터", ivObjDesc: "인프라 자산", ivIsoNatSymNm: "대한민국", entrAstsIvMethNm: "지분", entrAstsRateNm: "변동", ivStatTcNm: "운용중", ivAmt: "2000000000", fxIvAmt: "0", ivEstmAmt: "2100000000", fxIvEstmAmt: "0", grossTvpi: "1.05", grossIrr: "8.0" }
        ];

        // 펀드 정보 업데이트 (시뮬레이션)
        document.getElementById('acquisitionCost').value = formatNumber(3500000000);
        document.getElementById('appraisedValue').value = formatNumber(3650000000);

        renderAssetTable(sampleData);
    });

    // 양식 다운로드 이벤트 처리
    document.getElementById('btn_down').addEventListener('click', () => {
        alert('편입자산 세부내역 엑셀 양식을 다운로드합니다.');
        // 실제 다운로드 로직: location.href = '/path/to/template.xlsx';
    });

    // 등록 버튼 이벤트 처리
    document.getElementById('btn_reg').addEventListener('click', () => {
        const fundCode = document.getElementById('fundCode').value;
        const targetYear = document.getElementById('targetYear').value;
        const targetQuarter = document.getElementById('targetQuarter').value;
        const rows = document.querySelectorAll('#asset-table-body tr');

        if (!fundCode) {
            alert("펀드를 선택해주세요.");
            return;
        }
        if (!targetYear || !targetQuarter) {
            alert("대상년도와 분기를 모두 입력해주세요.");
            return;
        }
        if (rows.length === 0 || rows[0].querySelectorAll('td').length <= 1) {
            alert("업로드된 편입자산 세부 내역이 없습니다.");
            return;
        }
        
        // 업로드된 데이터의 합계와 펀드 정보의 금액 일치 여부 검증 (Validation)
        let totalIvAmt = 0;
        let totalIvEstmAmt = 0;
        const tableData = Array.from(rows).map(row => {
            const cells = row.cells;
            const ivAmt = parseFloat(cells[6].innerText.replace(/,/g, '')) || 0;
            const ivEstmAmt = parseFloat(cells[8].innerText.replace(/,/g, '')) || 0;
            totalIvAmt += ivAmt;
            totalIvEstmAmt += ivEstmAmt;
            return {
                ivObj: cells[0].innerText,
                // ... 다른 데이터 수집
            };
        });

        const acquisitionCost = parseFloat(document.getElementById('acquisitionCost').value.replace(/,/g, ''));
        const appraisedValue = parseFloat(document.getElementById('appraisedValue').value.replace(/,/g, ''));

        if (totalIvAmt !== acquisitionCost) {
            alert(`취득원가의 합이 일치하지 않습니다.\n공제회값: ${formatNumber(acquisitionCost)}\n업로드값: ${formatNumber(totalIvAmt)}`);
            return;
        }
        if (totalIvEstmAmt !== appraisedValue) {
            alert(`평가금액의 합이 일치하지 않습니다.\n공제회값: ${formatNumber(appraisedValue)}\n업로드값: ${formatNumber(totalIvEstmAmt)}`);
            return;
        }

        if (confirm("편입자산 내역을 등록하시겠습니까?")) {
            // 실제 서버로 데이터를 전송하는 AJAX 로직
            console.log("등록될 데이터:", {
                fundCode,
                targetYear,
                targetQuarter,
                assets: tableData
            });
            alert("등록되었습니다.");
            // 성공 후 목록 페이지로 이동 또는 그리드 초기화
            location.href = '/finops/asset/list';
        }
    });
});