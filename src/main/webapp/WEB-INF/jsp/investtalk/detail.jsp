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
            <h1><i class="fa-solid fa-circle-info"></i> ${pageTitle}</h1>

            <form id="investtalk-detail-form">
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
                            <td colspan="3"><input type="text" class="short-input" value="${proposal.type}" readonly></td>
                        </tr>
                        <c:if test="${proposal.type == '세미나'}">
                            <tr>
                                <th><span class="required">*</span> 세미나 유형</th>
                                <td colspan="3"><input type="text" value="${proposal.seminarType}" readonly></td>
                            </tr>
                        </c:if>
                        <c:if test="${proposal.type == '미팅'}">
                             <tr>
                                <th><span class="required">*</span> 미팅 유형</th>
                                <td colspan="3"><input type="text" value="${proposal.meetingType}" readonly></td>
                            </tr>
                            <tr>
                                <th><span class="required">*</span> 관련 펀드</th>
                                <td colspan="3"><input type="text" value="${proposal.fundName} (${proposal.fundCode})" readonly></td>
                            </tr>
                        </c:if>
                        <tr>
                            <th><span class="required">*</span> 담당팀</th>
                            <td><input type="text" class="short-input" value="${proposal.team}" readonly></td>
                            <th><span class="required">*</span> 담당자</th>
                            <td><input type="text" class="short-input" value="${proposal.manager}" readonly></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 주제</th>
                            <td colspan="3"><input type="text" value="${proposal.title}" readonly></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 일시</th>
                            <td colspan="3"><input type="text" value="${proposal.date} ${proposal.startTime} ~ ${proposal.endTime}" readonly></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 장소</th>
                            <td colspan="3"><input type="text" value="${proposal.locationType == '외부' ? proposal.location : '경찰공제회 내부'}" readonly></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 주요 내용</th>
                            <td colspan="3"><textarea readonly>${proposal.content}</textarea></td>
                        </tr>
                        <c:if test="${proposal.type == '세미나'}">
                            <tr>
                                <th>발표자</th>
                                <td><input type="text" class="short-input" value="${proposal.presenter}" readonly></td>
                                <th>연락처</th>
                                <td><input type="text" class="short-input" value="${proposal.presenterContact}" readonly></td>
                            </tr>
                            <tr>
                                <th>발표자 경력</th>
                                <td colspan="3"><textarea readonly>${proposal.presenterBio}</textarea></td>
                            </tr>
                        </c:if>
                        <tr>
                            <th>관련 자료</th>
                            <td colspan="3">
                                <c:forEach var="file" items="${proposal.files}">
                                    <div class="file-item">
                                        <a href="#" class="text-link"><i class="fa-solid fa-download"></i> ${file}</a>
                                    </div>
                                </c:forEach>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="button-container">
                    <a href="/investtalk/form?id=${proposal.id}&type=${proposal.type}" class="btn btn-primary"><i class="fa-solid fa-edit"></i> 수정</a>
                    <button type="button" class="btn btn-outline" id="delete-btn"><i class="fa-solid fa-trash"></i> 삭제</button>
                    <a href="/investtalk/list" class="btn btn-outline"><i class="fa-solid fa-list"></i> 목록</a>
                </div>
            </form>
        </main>
    </div>
    <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>
    <script src="/js/investtalk.js"></script>
</body>
</html>