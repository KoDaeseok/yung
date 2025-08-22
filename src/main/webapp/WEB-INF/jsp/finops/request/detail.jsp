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
            <h1><i class="fa-solid fa-circle-info"></i> ${menuDetail.menuNm}</h1>

            <form id="finops-form" onsubmit="return false;">
                <table class="form-table">
                    <tbody>
                        <tr>
                            <th><span class="required">*</span> 펀드</th>
                            <td colspan="3">
                                <div class="input-with-button">
                                    <input type="text" name="fundCode" class="short-input" value="${request.fundCode}" readonly>
                                    <button type="button" class="btn-search" disabled><i class="fa-solid fa-magnifying-glass"></i></button>
                                    <input type="text" name="fundName" class="wide-input" value="${request.fundName}" readonly>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 보고구분</th>
                            <td>
                                <select name="reportType" class="short-input" disabled>
                                    <option <c:if test="${request.reportType == '주주총회'}">selected</c:if>>주주총회</option>
                                    <option <c:if test="${request.reportType == '기타 보고'}">selected</c:if>>기타 보고</option>
                                </select>
                            </td>
                            <th><span class="required">*</span> 일자</th>
                            <td><input type="date" name="date" class="short-input" value="${request.date}" readonly></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 제목</th>
                            <td colspan="3"><input type="text" name="title" value="${request.title}" readonly></td>
                        </tr>
                        <tr>
                            <th>주요내용</th>
                            <td colspan="3"><textarea name="content" style="width: 100%; height: 120px; resize: vertical;" readonly>${request.content}</textarea></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 첨부파일</th>
                            <td colspan="3">
                                <%-- 수정 시 새로운 파일을 첨부하는 영역 --%>
                                <div id="file-add-wrapper" style="display:none;">
                                    <div class="file-input-wrapper">
                                        <input type="text" readonly placeholder="파일을 첨부해주세요.">
                                        <label for="file-upload" class="btn btn-dark">파일찾기</label>
                                        <input type="file" id="file-upload" name="attachment" style="display: none;">
                                    </div>
                                </div>
                                <%-- 기존 파일 목록이 표시되는 영역 --%>
                                <div id="file-list-container">
                                    <c:if test="${not empty request.fileName}">
                                        <div class="file-item">
                                            <a href="#" class="text-link">${request.fileName}</a>
                                            <button type="button" class="btn-delete-file" style="display:none;">&times;</button>
                                        </div>
                                    </c:if>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="button-container" id="view-mode-buttons">
                    <button type="button" class="btn btn-primary" id="edit-btn"><i class="fa-solid fa-edit"></i> 수정</button>
                    <button type="button" class="btn btn-outline" onclick="location.href='/finops/request/list'"><i class="fa-solid fa-list"></i> 목록</button>
                </div>
                <div class="form-buttons" id="edit-mode-buttons" style="display: none;">
                    <button type="submit" class="btn btn-primary"><i class="fa-solid fa-check"></i> 저장</button>
                    <button type="button" class="btn btn-secondary" id="cancel-btn"><i class="fa-solid fa-times"></i> 취소</button>
                </div>
            </form>
        </main>
    </div>
    <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>
    <script src="/js/finops.js"></script>
</body>
</html>