<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>경찰공제회 - ${menuDetail.menuNm}</title>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
                <span>${menuDetail.menuNm}</span>
            </div>
            
            <h1><i class="fa-solid fa-circle-info"></i> ${menuDetail.menuNm}</h1>
            
            <form id="propvest-form">
                <div class="propvest-readonly-info">
                    <span>제안기관</span> <input type="text" value="KB자산운용" readonly>
                    <span>사업자번호</span> <input type="text" value="116-81-33085" readonly>
                    <span>제안자</span> <input type="text" value="정보시스템부" readonly>
                </div>

                <table class="form-table">
                    <tbody>
                        <tr>
                            <th><span class="required">*</span> 제안제목</th>
                            <td colspan="3"><input type="text" name="title" value="신규 부동산 투자 제안" readonly></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 담당팀</th>
                            <td><select name="chargeTeam" class="wide-select" disabled><option>팀선택</option></select></td>
                            <th><span class="required">*</span> 공제회 담당자</th>
                            <td><select name="pmaaManager" class="wide-select" disabled><option>담당자선택</option></select></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 투자분야</th>
                            <td><select name="investField" class="wide-select" disabled><option>부동산</option></select></td>
                            <th><span class="required">*</span> 유형</th>
                            <td><select name="investType" class="wide-select" disabled><option>대출</option></select></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 투자사업개요</th>
                            <td colspan="3"><textarea name="overview" readonly>- 서울 중심업무지구(CBD) 프라임 오피스 빌딩&#13;- 안정적인 임대 수익 및 자산 가치 상승 기대</textarea></td>
                        </tr>
                        <tr>
                            <th>투자제안서</th>
                            <td colspan="3">
                                <div class="file-input-wrapper">
                                    <input type="text" value="투자제안서.pdf" readonly>
                                    <label for="file-upload" class="btn btn-dark btn-disabled">파일찾기</label>
                                    <input type="file" id="file-upload" name="attachment" style="display: none;" disabled>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>투자국가</th>
                            <td>
                                <div class="input-with-icon">
                                    <input type="text" name="investCountry" value="대한민국" readonly>
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                            </td>
                            <th>제안통화</th>
                            <td>
                                <div class="input-with-icon">
                                    <input type="text" name="currency" value="KRW" readonly>
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                            </td>
                        </tr>
                         <tr>
                            <th>투자기간</th>
                            <td colspan="3"><input type="text" name="investPeriod" value="24년 1월 ~ 29년 12월" readonly></td>
                        </tr>
                        <tr>
                            <th>전체모집금액</th>
                            <td><input type="text" name="totalAmount" value="1,000,000,000" readonly></td>
                            <th>본회제안금액</th>
                            <td><input type="text" name="pmaaAmount" value="500,000,000" readonly></td>
                        </tr>
                        <tr>
                            <th>목표수익률</th>
                            <td colspan="3"><input type="text" name="targetReturn" value="7.5" readonly></td>
                        </tr>
                        <tr>
                            <th>제안미팅 예정일</th>
                            <td>
                                <div class="input-with-icon">
                                    <input type="text" name="meetingDate" id="meetingDatepicker" value="2025-09-01" readonly>
                                    <i id="datepicker-icon" class="fa-solid fa-calendar-days"></i>
                                </div>
                            </td>
                            <th>제안미팅예정시간</th>
                            <td>
                                <div class="time-range-input">
                                    <input type="text" name="meetingStartTime" value="14:00" readonly>
                                    <span>~</span>
                                    <input type="text" name="meetingEndTime" value="15:00" readonly>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="form-buttons">
                    <div id="view-mode-buttons">
                        <button type="button" class="btn btn-primary" id="edit-btn">
                            <i class="fa-solid fa-edit"></i> 수정
                        </button>
                        <button type="button" class="btn btn-outline" onclick="location.href='/propvest/list'">
                            <i class="fa-solid fa-list"></i> 목록
                        </button>
                    </div>
                    <div id="edit-mode-buttons" style="display: none;">
                        <button type="submit" class="btn btn-primary">
                            <i class="fa-solid fa-check"></i> 저장
                        </button>
                        <button type="button" class="btn btn-secondary" id="cancel-btn">
                            <i class="fa-solid fa-times"></i> 취소
                        </button>
                    </div>
                </div>
            </form>
        </main>
    </div>

    <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>
    <%-- 분리된 스크립트 파일 로드 --%>
    <script src="/js/propvest.js"></script> 
</body>
</html>