<!-- jsp/propvest/form.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>경찰공제회 - 신규 투자제안</title>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
    <c:import url="/header.do" />

    <div class="page-container">
        <c:import url="/lnb.do" />

        <main class="page-content">
            <div class="breadcrumb">
                <a href="/"><i class="fa-solid fa-house"></i> 홈</a>
                <span>></span>
                <span>투자제안</span>
                <span>></span>
                <span>신규 투자제안</span>
            </div>

            <h1><i class="fa-solid fa-pen-to-square"></i> 신규 투자제안</h1>

            <form id="propvest-form" onsubmit="return false;">
                <div class="propvest-readonly-info">
                    <span>제안기관</span> <input type="text" id="prpOrg" name="prpOrg" readonly>
                    <span>사업자번호</span> <input type="text" id="bsNo" name="bsNo" readonly>
                    <span>제안자</span> <input type="text" id="prpsMnNm" name="prpsNm" readonly>
                </div>

                <table class="form-table">
                    <tbody>
                        <tr>
                            <th><span class="required">*</span> 제안제목</th>
                            <td colspan="3"><input type="text" id="prpRprtTit" name="prpRprtTit" style="width: 100%;"></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 투자개요</th>
                            <td colspan="3"><input type="text" id="ivObj" name="ivObj" style="width: 100%;"></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 공제회 담당팀</th>
                            <td><select id="oprTeamTc" name="oprTeamTc" class="wide-select"><option value="">선택</option></select></td>
                            <th><span class="required">*</span> 공제회 담당자</th>
                            <td><select id="acmn" name="acmn" class="wide-select"><option value="">선택</option></select></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 투자분야</th>
                            <td><select id="ivFld" name="ivFld" class="wide-select"><option value="">선택</option></select></td>
                            <th><span class="required">*</span> 유형</th>
                            <td><select id="ivKindTc" name="ivKindTc" class="wide-select"><option value="">선택</option></select></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 투자내용</th>
                            <td colspan="3"><textarea id="ivCntn" name="ivCntn" style="width: 100%; height: 120px; resize: vertical;"></textarea></td>
                        </tr>
                        <tr>
                            <th>투자제안서</th>
                            <td colspan="3">
                                <div class="file-input-wrapper">
                                    <input type="text" id="fileName" readonly placeholder="파일을 첨부해주세요.">
                                    <label for="file-upload" class="btn btn-dark">파일찾기</label>
                                    <input type="file" id="file-upload" name="attachment" style="display: none;">
                                </div>
                            </td>
                        </tr>
                        
                        <%-- 투자 상세 정보 (투자 분야에 따라 숨김/표시) --%>
                        <tr class="investment-details">
                            <th><span class="required">*</span> 투자지역</th>
                            <td>
                                <%-- '국내', '해외' 옵션이 포함된 select 태그 --%>
                                <select id="ivZoneTc" name="ivZoneTc" class="short-input">
                                    <option value="">선택</option>
                                    <option value="01">국내</option>
                                    <option value="02">해외</option>
                                </select>
                            </td>
                            <th><span class="required">*</span> 투자국가</th>
                            <td>
                                <div class="input-with-button">
                                    <input type="text" id="ivNat" name="ivNat" class="short-input" style="width:100px;" readonly placeholder="국가코드">
                                    <button type="button" class="btn-nation-search btn-search"><i class="fa-solid fa-magnifying-glass"></i></button>
                                    <input type="text" id="ivNatNm" name="ivNatNm" class="wide-input" readonly placeholder="국가명">
                                </div>
                            </td>
                        </tr>
                        <tr class="investment-details">
                            <th><span class="required">*</span> 제안통화</th>
                            <td>
                                <div class="input-with-button">
                                    <input type="text" id="ivPrpCur" name="ivPrpCur" class="short-input" style="width: 80px;" readonly>
                                    <button type="button" class="btn-currency-search btn-search"><i class="fa-solid fa-magnifying-glass"></i></button>
                                    <input type="text" id="ivPrpCurNm" name="ivPrpCurNm" class="wide-input" readonly>
                                </div>
                            </td>
                            <th><span class="required">*</span> 투자기간</th>
                            <td>
                                <input type="text" id="ivTrm" name="ivTrm" class="wide-input" placeholder="예) 25년 1월 ~ 28년 12월">
                            </td>
                        </tr>
                        <tr class="investment-details">
                            <th>전체모집금액</th>
                            <td><input type="text" id="totRcrtAmt" name="totalAmount" class="short-input" placeholder="(단위 : 제안통화)"></td>
                            <th><span class="required">*</span> 본회제안금액</th>
                            <td><input type="text" id="ivPrpAmt" name="pmaaAmount" class="short-input" placeholder="(단위 : 제안통화)"></td>
                        </tr>
                        <tr class="investment-details">
                            <th><span class="required">*</span> 목표수익률(IRR)</th>
                            <td><input type="text" id="objPrrt" name="targetReturn" class="short-input" placeholder="(단위 : %)"></td>
                            <th>목표수익률(배당)</th>
                            <td><input type="text" id="objAlotPrrt" name="dividendReturn" class="short-input" placeholder="(단위 : %)"></td>
                        </tr>
                        <tr class="investment-details meeting-details">
                            <th>제안미팅 예정일</th>
                            <td>
                                <input type="date" name="meetingDate" id="metSchdDate" class="short-input">
                            </td>
                            <th>제안미팅 예정시간</th>
                            <td>
                                <div class="time-range-input">
                                    <input type="text" id="metStrtTm" name="meetingStartTime" placeholder="00:00">
                                    <span>~</span>
                                    <input type="text" id="metEndTm" name="meetingEndTime" placeholder="23:59">
                                </div>
                            </td>
                        </tr>
                        
                        <%-- 담당 운용역 정보 (주식 분야 선택 시 표시) --%>
                        <tr class="tr-manager" style="display:none;">
                            <th><span class="required">*</span> 담당 운용역</th>
                            <td colspan="3"><input type="text" name="chrgOprMn" style="width: 100%;"></td>
                        </tr>
                        <tr class="tr-manager" style="display:none;">
                            <th><span class="required">*</span> 담당 운용역 경력</th>
                            <td colspan="3"><textarea name="chrgOprMnCarr" style="width: 100%; height: 80px; resize: vertical;"></textarea></td>
                        </tr>
                        
                        <tr>
                            <th><span class="required">*</span> 제안사 담당자</th>
                            <td colspan="3"><input type="text" id="prcoChmnNm" name="prcoChmnNm" class="short-input"></td>
                        </tr>
                    </tbody>
                </table>

                <div class="form-buttons">
                    <button type="submit" id="btn_reg" class="btn btn-primary"><i class="fa-solid fa-check"></i> 등록</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='/propvest/list'"><i class="fa-solid fa-times"></i> 취소</button>
                </div>
            </form>
        </main>
    </div>

    <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/propvest.js"></script>
    <jsp:include page="/WEB-INF/jsp/popup/currencySearchPopup.jsp" />
    <jsp:include page="/WEB-INF/jsp/popup/nationSearchPopup.jsp" />
    <script src="/js/popup/currency_popup.js"></script>
    <script src="/js/popup/nation_popup.js"></script>
</body>
</html>