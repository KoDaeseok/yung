<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>경찰공제회 - ${pageTitle}</title>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="page-container">
        <%-- 사이드바 --%>
        <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

        <main class="page-content">
            <div class="breadcrumb">
                <c:forEach var="crumb" items="${breadcrumbs}" varStatus="status">
                    <c:if test="${not status.first}">
                        <span>></span>
                    </c:if>
                    <c:choose>
                        <c:when test="${not empty crumb.url}">
                            <a href="${crumb.url}">
                                <c:if test="${status.first}"><i class="fa-solid fa-house"></i></c:if>
                                ${crumb.label}
                            </a>
                        </c:when>
                        <c:otherwise>
                            <span>${crumb.label}</span>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
            
            <h1><i class="fa-solid fa-pen-to-square"></i> ${pageTitle}</h1>
            
            <form id="suggestion-form">
                <table class="form-table">
                    <tbody>
                        <tr>
                            <th>고객사</th>
                            <td><input type="text" value="KB자산운용" class="short-input" readonly></td>
                            <th>담당부서</th>
                            <td><input type="text" value="정보시스템부" class="short-input" readonly></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 공제회 담당팀</th>
                            <td>
                                <select name="pmaaTeam" class="short-input">
                                    <option value="">선택</option>
                                    <option value="team1">투자전략팀</option>
                                    <option value="team2">채권투자팀</option>
                                    <option value="team3">주식투자팀</option>
                                    <option value="team4">기업투자팀</option>
                                    <option value="team5">인프라투자팀</option>
                                    <option value="team6">사업투자팀</option>
                                    <option value="team7">투자심사팀</option>
                                    <option value="team8">리스크관리팀</option>
                                </select>
                            </td>
                            <th><span class="required">*</span> 공개여부</th>
                            <td>
                                <input type="radio" id="public" name="visibility" value="public" checked>
                                <label for="public" style="margin-right: 15px;">공개</label>
                                <input type="radio" id="private" name="visibility" value="private">
                                <label for="private">비공개</label>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 제목</th>
                            <td colspan="3">
                                <input type="text" name="title" style="width: 100%;">
                            </td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 내용</th>
                            <td colspan="3">
                                <textarea name="content" style="width: 100%; height: 200px; padding: 8px; border: 1px solid var(--border-color-default); border-radius: var(--border-radius-tiny); font-family: inherit; font-size: 14px; resize: vertical;"></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="form-buttons">
                    <button type="submit" class="btn btn-primary"><i class="fa-solid fa-check"></i> 등록</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='/suggestion'"><i class="fa-solid fa-times"></i> 취소</button>
                </div>
            </form>
        </main>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>