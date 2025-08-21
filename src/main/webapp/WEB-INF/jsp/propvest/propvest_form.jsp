<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>경찰공제회 - ${menuDetail.menuNm}</title>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <%-- jQuery UI 라이브러리 추가 (달력 기능) --%>
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
            
            <h1><i class="fa-solid fa-pen-to-square"></i> ${menuDetail.menuNm}</h1>
            
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
                            <td colspan="3">
                                <input type="text" name="title" style="width: 100%;">
                            </td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 담당팀</th>
                            <td>
                                <select name="chargeTeam" class="wide-select"><option>선택</option></select>
                            </td>
                            <th><span class="required">*</span> 공제회 담당자</th>
                            <td>
                                <select name="pmaaManager" class="wide-select"><option>선택</option></select>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 투자분야</th>
                            <td>
                                <select name="investField" class="wide-select"><option>선택</option></select>
                            </td>
                            <th><span class="required">*</span> 유형</th>
                            <td>
                                <select name="investType" class="wide-select"><option>선택</option></select>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 투자사업개요</th>
                            <td colspan="3">
                                <textarea name="overview" style="width: 100%; height: 120px; resize: vertical;"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>투자제안서</th>
                            <td colspan="3">
                                <div class="file-input-wrapper">
                                    <input type="text" readonly placeholder="파일을 첨부해주세요.">
                                    <label for="file-upload" class="btn btn-dark">파일찾기</label>
                                    <input type="file" id="file-upload" name="attachment" style="display: none;">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>투자국가</th>
                            <td>
                                <div class="input-with-icon">
                                    <input type="text" name="investCountry">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                            </td>
                            <th>제안통화</th>
                            <td>
                                <div class="input-with-icon">
                                    <input type="text" name="currency">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>투자기간</th>
                            <td colspan="3">
                                <input type="text" name="investPeriod" placeholder="예) 18년 1월 ~ 18년 3월">
                            </td>
                        </tr>
                        <tr>
                            <th>전체모집금액</th>
                            <td><input type="text" name="totalAmount" placeholder="(단위 : 일/제안통화) 기준"></td>
                            <th>본회제안금액</th>
                            <td><input type="text" name="pmaaAmount" placeholder="(단위 : 일/제안통화) 기준"></td>
                        </tr>
                        <tr>
                            <th>목표수익률</th>
                            <td colspan="3"><input type="text" name="targetReturn" placeholder="(단위 : %)"></td>
                        </tr>
                        <tr>
                            <th>제안미팅 예정일</th>
                            <td>
                                <div class="input-with-icon">
                                    <input type="text" name="meetingDate" id="meetingDatepicker">
                                    <i id="datepicker-icon" class="fa-solid fa-calendar-days"></i>
                                </div>
                            </td>
                            <th>제안미팅예정시간</th>
                            <td>
                                <div class="time-range-input">
                                    <input type="text" name="meetingStartTime" placeholder="00:00">
                                    <span>~</span>
                                    <input type="text" name="meetingEndTime" placeholder="23:59">
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="form-buttons">
                    <button type="submit" class="btn btn-primary"><i class="fa-solid fa-check"></i> 등록</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='/propvest/list'"><i class="fa-solid fa-times"></i> 취소</button>
                </div>
            </form>
        </main>
    </div>

    <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>

    <%-- 달력(Datepicker) 기능 활성화 스크립트 --%>
    <script>
        $(function() {
            // datepicker 초기화
            $("#meetingDatepicker").datepicker({
                dateFormat: "yy-mm-dd" // 날짜 형식 설정
            });

            // 아이콘 클릭 시 datepicker 열기
            $("#datepicker-icon").on("click", function() {
                $("#meetingDatepicker").datepicker("show");
            });
        });
    </script>
</body>
</html>