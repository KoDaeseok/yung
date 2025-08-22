<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>경찰공제회 - ${menuDetail.menuNm}</title>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
    <c:import url="/header.do" />
    <div class="page-container">
        <c:import url="/lnb.do" />
        <main class="page-content">
            <div class="breadcrumb">
                <a href="/"><i class="fa-solid fa-house"></i> 홈</a>
                <span>></span><span>운용관리</span><span>></span><span>${menuDetail.menuNm}</span>
            </div>
            <h1><i class="fa-solid fa-pen-to-square"></i> ${menuDetail.menuNm}</h1>

            <form>
                <%-- 상단 정보 입력 테이블 --%>
                <table class="form-table">
                     <tbody>
                        <tr>
                            <th><span class="required">*</span> 펀드</th>
                            <td colspan="3">
                                <div class="input-with-button">
                                    <input type="text" name="fundCode" class="short-input" placeholder="펀드코드">
                                    <button type="button" class="btn-search"><i class="fa-solid fa-magnifying-glass"></i></button>
                                    <input type="text" name="fundName" class="wide-input" placeholder="펀드명" readonly>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>재간접 펀드</th>
                            <td>
                                <select name="reInvestFund" class="short-input">
                                    <option>선택</option>
                                </select>
                            </td>
                             <th><span class="required">*</span> 대상분기</th>
                            <td>
                                <div style="display: flex; align-items: center; gap: 5px;">
                                    <input type="text" name="targetYear" style="width: 80px;" placeholder="YYYY">
                                    <span>년</span>
                                    <select name="targetQuarter" style="width: 80px;" class="short-input">
                                        <option value="">선택</option>
                                        <option value="1">1분기</option>
                                        <option value="2">2분기</option>
                                        <option value="3">3분기</option>
                                        <option value="4">4분기</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>취득원가</th>
                            <td><input type="text" name="acquisitionCost" class="short-input" readonly value="0"></td>
                            <th>평가금액</th>
                            <td><input type="text" name="appraisedValue" class="short-input" readonly value="0"></td>
                        </tr>
                    </tbody>
                </table>

                <%-- 엑셀 업로드/다운로드 및 등록 버튼 --%>
                <div class="button-container" style="margin-top: 20px; margin-bottom: 10px; justify-content: space-between;">
                    <div>
                         <p style="font-size: 13px; color: #888;">※ 엑셀업로드는 "양식 다운로드" 버튼을 통해 양식을 먼저 내려받으신 후 해당 양식을 통해 업로드하셔야 합니다.</p>
                    </div>
                    <div>
                        <button type="button" class="btn btn-outline" id="btn_down"><i class="fa-solid fa-download"></i> 양식 다운로드</button>
                        <label for="excel-upload" class="btn btn-outline"><i class="fa-solid fa-upload"></i> 엑셀 업로드</label>
                        <input type="file" id="excel-upload" style="display: none;" accept=".xls, .xlsx">
                         <button type="submit" class="btn btn-primary"><i class="fa-solid fa-check"></i> 등록</button>
                         <button type="button" class="btn btn-secondary" onclick="location.href='/finops/asset/list'"><i class="fa-solid fa-times"></i> 취소</button>
                    </div>
                </div>

                <%-- 업로드된 데이터 표시 테이블 (컬럼 너비 수정) --%>
                <div class="content-container" style="margin-top: 20px;">
                     <h4 style="margin-bottom: 10px;">편입자산 세부내역</h4>
                     <table class="data-table">
                        <thead>
                            <tr>
                                <th style="width: 15%;">투자명(기업명)</th>
                                <th style="width: 25%;">투자개요</th>
                                <th style="width: 10%;">투자대상국</th>
                                <th style="width: 8%;">투자방식</th>
                                <th style="width: 8%;">금리유형</th>
                                <th style="width: 8%;">투자상태</th>
                                <th style="width: 8%;">취득원가</th>
                                <th style="width: 8%;">평가금액</th>
                                <th style="width: 5%;">Gross TVPI</th>
                                <th style="width: 5%;">Gross IRR(%)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%-- 엑셀 업로드 시 이 영역에 데이터가 동적으로 채워집니다. --%>
                            <tr>
                                <td colspan="10" class="no-data"><div class="no-data-content" style="height: 250px;">업로드할 데이터가 없습니다.</div></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
           </form>
        </main>
    </div>
    <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>

    <%-- 펀드 검색 팝업 파일 포함 --%>
    <jsp:include page="/WEB-INF/jsp/popup/fundSearchPopup.jsp" />
    <script src="/js/finops_popup.js"></script>
</body>
</html>