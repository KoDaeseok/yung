<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>경찰공제회 - ${pageTitle}</title>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
    <c:import url="/header.do" />
    <div class="page-container">
        <c:import url="/lnb.do" />
        <main class="page-content">
            <div class="breadcrumb">
                <a href="/index.do"><i class="fa-solid fa-house"></i> 홈</a>
                <span>></span><span>세미나/미팅제안</span><span>></span><span><a href="/investtalk/list">제안 목록</a></span><span>></span><span>${pageTitle}</span>
            </div>
            <h1><i class="fa-solid fa-pen-to-square"></i> ${pageTitle}</h1>

            <form id="investtalk-form">
                <input type="hidden" name="type" value="${proposalType}">
                <table class="form-table">
                     <tbody>
                        <tr>
                            <th>제안기관</th>
                            <td><input type="text" value="KB자산운용" readonly></td>
                            <th>소속부서</th>
                            <td><input type="text" value="정보시스템부" readonly></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 구분</th>
                            <td colspan="3"><input type="text" class="short-input" value="${proposalType}" readonly></td>
                        </tr>
                        
                        <%-- 세미나 전용 입력 필드 --%>
                        <tr class="seminar-field" <c:if test="${proposalType != '세미나'}">style="display:none;"</c:if>>
                            <th><span class="required">*</span> 세미나 유형</th>
                            <td colspan="3">
                                <select name="seminarType" class="short-input">
                                    <option value="">선택</option>
                                    <option value="신규 투자 제안" ${proposal.seminarType == '신규 투자 제안' ? 'selected' : ''}>신규 투자 제안</option>
                                    <option value="시장 전망" ${proposal.seminarType == '시장 전망' ? 'selected' : ''}>시장 전망</option>
                                </select>
                            </td>
                        </tr>
                        
                        <%-- 미팅 전용 입력 필드 --%>
                        <tr class="meeting-field" <c:if test="${proposalType != '미팅'}">style="display:none;"</c:if>>
                            <th><span class="required">*</span> 미팅 유형</th>
                            <td colspan="3">
                                <select name="meetingType" class="short-input">
                                    <option value="">선택</option>
                                    <option value="기존 투자 관련" ${proposal.meetingType == '기존 투자 관련' ? 'selected' : ''}>기존 투자 관련</option>
                                    <option value="신규 제안" ${proposal.meetingType == '신규 제안' ? 'selected' : ''}>신규 제안</option>
                                </select>
                            </td>
                        </tr>
                        <tr class="meeting-field" <c:if test="${proposalType != '미팅'}">style="display:none;"</c:if>>
                            <th><span class="required">*</span> 관련 펀드</th>
                            <td colspan="3">
                                <div class="input-with-button">
                                    <input type="text" name="fundCode" class="short-input" placeholder="펀드코드" value="${proposal.fundCode}">
                                    <button type="button" class="btn-search"><i class="fa-solid fa-magnifying-glass"></i></button>
                                    <input type="text" name="fundName" class="wide-input" placeholder="펀드명" value="${proposal.fundName}" readonly>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th><span class="required">*</span> 담당팀</th>
                            <td>
                                <select name="team" class="short-input">
                                     <option value="">선택</option>
                                     <option value="대체투자1팀" ${proposal.team == '대체투자1팀' ? 'selected' : ''}>대체투자1팀</option>
                                     <option value="기업금융1팀" ${proposal.team == '기업금융1팀' ? 'selected' : ''}>기업금융1팀</option>
                                </select>
                            </td>
                            <th><span class="required">*</span> 담당자</th>
                            <td>
                                <select name="manager" class="short-input">
                                    <option value="">선택</option>
                                    <option value="김담당" ${proposal.manager == '김담당' ? 'selected' : ''}>김담당</option>
                                    <option value="이담당" ${proposal.manager == '이담당' ? 'selected' : ''}>이담당</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 주제</th>
                            <td colspan="3"><input type="text" name="title" value="${proposal.title}"></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 일자</th>
                            <td><input type="date" name="date" class="short-input" value="${proposal.date}"></td>
                            <th><span class="required">*</span> 시간</th>
                            <td>
                                <div class="time-range-input">
                                    <input type="text" name="startTime" placeholder="00:00" value="${proposal.startTime}">
                                    <span>~</span>
                                    <input type="text" name="endTime" placeholder="23:59" value="${proposal.endTime}">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 장소구분</th>
                            <td colspan="3">
                                <select name="locationType" class="short-input">
                                    <option value="내부" ${proposal.locationType == '내부' ? 'selected' : ''}>내부</option>
                                    <option value="외부" ${proposal.locationType == '외부' ? 'selected' : ''}>외부</option>
                                </select>
                            </td>
                        </tr>
                        <tr id="location-detail-row" <c:if test="${proposal.locationType != '외부'}">style="display:none;"</c:if>>
                            <th><span class="required">*</span> 장소</th>
                            <td colspan="3"><input type="text" name="location" value="${proposal.location}"></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 주요 내용</th>
                            <td colspan="3"><textarea name="content">${proposal.content}</textarea></td>
                        </tr>
                        
                        <%-- 세미나 전용 입력 필드 --%>
                        <tr class="seminar-field" <c:if test="${proposalType != '세미나'}">style="display:none;"</c:if>>
                            <th>발표자</th>
                            <td><input type="text" name="presenter" class="short-input" value="${proposal.presenter}"></td>
                            <th>연락처</th>
                            <td><input type="text" name="presenterContact" class="short-input" value="${proposal.presenterContact}"></td>
                        </tr>
                         <tr class="seminar-field" <c:if test="${proposalType != '세미나'}">style="display:none;"</c:if>>
                            <th>발표자 경력</th>
                            <td colspan="3"><textarea name="presenterBio">${proposal.presenterBio}</textarea></td>
                        </tr>

                        <tr>
                            <th>관련 자료</th>
                            <td colspan="3">
                                <div class="file-input-wrapper">
                                     <input type="text" readonly placeholder="파일을 첨부해주세요.">
                                     <label for="file-upload" class="btn btn-dark">파일찾기</label>
                                     <input type="file" id="file-upload" name="attachment" style="display: none;" multiple>
                                </div>
                                <div id="file-list-container" style="margin-top: 10px;">
                                    <%-- 기존 파일 목록 --%>
                                    <c:if test="${not empty proposal.files}">
                                        <c:forEach var="file" items="${proposal.files}">
                                            <div class="file-item">
                                                <a href="#" class="text-link">${file}</a>
                                                <button type="button" class="btn-delete-file">&times;</button>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="form-buttons">
                    <button type="submit" class="btn btn-primary"><i class="fa-solid fa-check"></i> ${isNew ? '등록' : '저장'}</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='/investtalk/list'"><i class="fa-solid fa-times"></i> 취소</button>
                </div>
            </form>
        </main>
    </div>
    <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
    <jsp:include page="/WEB-INF/jsp/popup/fundSearchPopup.jsp" />
    <script src="/js/auth.js"></script>
    <script src="/js/finops_popup.js"></script>
    <script src="/js/investtalk.js"></script>
</body>
</html>