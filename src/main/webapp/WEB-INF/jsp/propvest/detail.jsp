<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>경찰공제회 - ${pageTitle}</title>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.3/jquery-ui.min.js"></script>
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
                <span>${pageTitle}</span>
            </div>

            <h1><i class="fa-solid fa-circle-info"></i> ${pageTitle}</h1>

            <form id="propvest-form" onsubmit="return false;">
                <div class="propvest-readonly-info">
                    <span>제안기관</span> <input type="text" name="prpOrg" value="KB자산운용" readonly>
                    <span>사업자번호</span> <input type="text" name="bsNo" value="116-81-33085" readonly>
                    <span>제안자</span> <input type="text" name="prpsNm" value="정보시스템부" readonly>
                </div>

                <table class="form-table">
                    <tbody>
                        <tr>
                            <th><span class="required">*</span> 제안제목</th>
                            <td colspan="3"><input type="text" name="prpRprtTit" value="${propvest.prpRprtTit}" readonly></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 투자개요</th>
                            <td colspan="3"><input type="text" name="ivObj" value="${propvest.ivObj}" readonly></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 공제회 담당팀</th>
                            <td>
                                <select name="oprTeamTc" class="wide-select" disabled>
                                    <option value="104010" ${propvest.oprTeamTc == '104010' ? 'selected' : ''}>대체투자1팀</option>
                                    <option value="103010" ${propvest.oprTeamTc == '103010' ? 'selected' : ''}>기업금융1팀</option>
                                </select>
                            </td>
                            <th><span class="required">*</span> 공제회 담당자</th>
                            <td>
                                <select name="acmn" class="wide-select" disabled>
                                     <option value="manager1" ${propvest.acmn == 'manager1' ? 'selected' : ''}>김담당</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 투자분야</th>
                            <td>
                                <select id="ivFld" name="ivFld" class="wide-select" disabled>
                                    <option value="C12" ${propvest.ivFld == 'C12' ? 'selected' : ''}>국내부동산</option>
                                    <option value="C22" ${propvest.ivFld == 'C22' ? 'selected' : ''}>해외부동산</option>
                                </select>
                            </td>
                            <th><span class="required">*</span> 유형</th>
                            <td>
                                <select name="ivKindTc" class="wide-select" disabled>
                                    <option value="C12_1" ${propvest.ivKindTc == 'C12_1' ? 'selected' : ''}>오피스</option>
                                    <option value="C12_2" ${propvest.ivKindTc == 'C12_2' ? 'selected' : ''}>상업시설</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 투자내용</th>
                            <td colspan="3"><textarea name="ivCntn" style="height: 120px; resize: vertical; width: 100%;" readonly>${propvest.ivCntn}</textarea></td>
                        </tr>
                        <tr>
                            <th>투자제안서</th>
                            <td colspan="3">
                                <div id="file-add-wrapper" style="display:none; margin-bottom:10px;">
                                    <div class="file-input-wrapper">
                                        <input type="text" readonly placeholder="파일을 추가해주세요.">
                                        <label for="file-upload" class="btn btn-dark">파일찾기</label>
                                        <input type="file" id="file-upload" name="attachment" style="display: none;" multiple>
                                    </div>
                                </div>
                                <div id="file-list-container">
                                    <div class="file-item">
                                        <a href="#" class="text-link">${propvest.fileName}</a>
                                        <button type="button" class="btn-delete-file" style="display:none;">&times;</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr class="investment-details">
                            <th><span class="required">*</span> 투자지역</th>
                            <td>
                                <select id="ivZoneTc" name="ivZoneTc" class="short-input" disabled>
                                    <option value="01" ${propvest.ivZoneTc == '01' ? 'selected' : ''}>국내</option>
                                    <option value="02" ${propvest.ivZoneTc == '02' ? 'selected' : ''}>해외</option>
                                </select>
                            </td>
                            <th><span class="required">*</span> 투자국가</th>
                            <td>
                                <div class="input-with-button">
                                    <input type="text" id="ivNat" name="ivNat" class="short-input" style="width:100px;" value="${propvest.ivNat}" readonly placeholder="국가코드">
                                    <button type="button" class="btn-nation-search btn-search" disabled><i class="fa-solid fa-magnifying-glass"></i></button>
                                    <input type="text" id="ivNatNm" name="ivNatNm" class="wide-input" value="${propvest.ivNatNm}" readonly placeholder="국가명">
                                </div>
                            </td>
                        </tr>
                        <tr class="investment-details">
                            <th><span class="required">*</span> 제안통화</th>
                            <td>
                                <div class="input-with-button">
                                    <input type="text" id="ivPrpCur" name="ivPrpCur" class="short-input" style="width: 80px;" value="${propvest.ivPrpCur}" readonly>
                                    <button type="button" class="btn-currency-search btn-search" disabled><i class="fa-solid fa-magnifying-glass"></i></button>
                                    <input type="text" id="ivPrpCurNm" name="ivPrpCurNm" class="wide-input" value="${propvest.ivPrpCurNm}" readonly>
                                </div>
                            </td>
                            <th><span class="required">*</span> 투자기간</th>
                            <td>
                                <input type="text" id="ivTrm" name="ivTrm" class="wide-input" value="${propvest.ivTrm}" readonly>
                            </td>
                        </tr>
                        <tr class="investment-details">
                            <th>전체모집금액</th>
                            <td><input type="text" name="totalAmount" value="${propvest.totalAmount}" class="short-input" readonly></td>
                            <th><span class="required">*</span> 본회제안금액</th>
                            <td><input type="text" name="pmaaAmount" value="${propvest.pmaaAmount}" class="short-input" readonly></td>
                        </tr>
                        <tr class="investment-details">
                            <th><span class="required">*</span> 목표수익률(IRR)</th>
                            <td><input type="text" name="targetReturn" value="${propvest.targetReturn}" class="short-input" readonly></td>
                            <th>목표수익률(배당)</th>
                            <td><input type="text" name="dividendReturn" value="${propvest.dividendReturn}" class="short-input" readonly></td>
                        </tr>
                        <tr class="investment-details meeting-details">
                            <th>제안미팅 예정일</th>
                            <td>
                                <input type="date" name="meetingDate" id="metSchdDate" class="short-input" value="${propvest.meetingDate}" readonly>
                            </td>
                            <th>제안미팅 예정시간</th>
                            <td>
                                <div class="time-range-input">
                                    <input type="text" name="meetingStartTime" value="${propvest.meetingStartTime}" placeholder="00:00" readonly>
                                    <span>~</span>
                                    <input type="text" name="meetingEndTime" value="${propvest.meetingEndTime}" placeholder="23:59" readonly>
                                </div>
                            </td>
                        </tr>
                        <tr class="tr-manager" style="display:none;">
                            <th><span class="required">*</span> 담당 운용역</th>
                            <td colspan="3"><input type="text" name="chrgOprMn" readonly></td>
                        </tr>
                        <tr class="tr-manager" style="display:none;">
                            <th><span class="required">*</span> 담당 운용역 경력</th>
                            <td colspan="3"><textarea name="chrgOprMnCarr" style="width: 100%; height: 80px; resize: vertical;" readonly></textarea></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 제안사 담당자</th>
                            <td colspan="3"><input type="text" name="prcoChmnNm" value="${propvest.prcoChmnNm}" class="short-input" readonly></td>
                        </tr>
                    </tbody>
                </table>

                <div id="button-group-wrapper">
                    <div class="button-container" id="view-mode-buttons">
                        <button type="button" class="btn btn-primary" id="edit-btn"><i class="fa-solid fa-edit"></i> 수정</button>
                        <button type="button" class="btn btn-outline" id="delete-btn"><i class="fa-solid fa-trash"></i> 삭제</button>
                        <button type="button" class="btn btn-outline" onclick="location.href='/propvest/list'"><i class="fa-solid fa-list"></i> 목록</button>
                    </div>
                    <div class="form-buttons" id="edit-mode-buttons" style="display: none;">
                        <button type="submit" class="btn btn-primary"><i class="fa-solid fa-check"></i> 저장</button>
                        <button type="button" class="btn btn-secondary" id="cancel-btn"><i class="fa-solid fa-times"></i> 취소</button>
                    </div>
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
