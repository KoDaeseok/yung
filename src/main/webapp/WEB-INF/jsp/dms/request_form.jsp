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
                <span>></span><span>요청/리서치자료</span><span>></span><a href="/dms/request/list">자료요청 목록</a><span>></span><span>${pageTitle}</span>
            </div>
            <h1><i class="fa-solid fa-pen-to-square"></i> ${pageTitle}</h1>

            <div class="section-title" style="margin-top:20px;">
                <h2>요청 정보</h2>
            </div>
            <table class="form-table">
                <tbody>
                    <tr>
                        <th>요청명</th>
                        <td colspan="3"><input type="text" value="${request.title}" readonly></td>
                    </tr>
                    <tr>
                        <th>요청부서</th>
                        <td><input type="text" value="${request.requestDept}" readonly></td>
                        <th>등록번호</th>
                        <td><input type="text" value="${request.regNum}" readonly></td>
                    </tr>
                </tbody>
            </table>
            
            <form id="request-response-form" style="margin-top: 40px;">
                 <div class="section-title">
                    <h2>자료 등록</h2>
                </div>
                 <table class="form-table">
                     <tbody>
                        <tr>
                            <th><span class="required">*</span> 제공자료</th>
                            <td colspan="3">
                                <div class="file-input-wrapper">
                                     <input type="text" readonly placeholder="파일을 첨부해주세요.">
                                     <label for="file-upload" class="btn btn-dark">파일찾기</label>
                                     <input type="file" id="file-upload" name="attachment" style="display: none;" multiple>
                                </div>
                                <div id="file-list-container" style="margin-top: 10px;"></div>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="form-buttons">
                    <button type="submit" class="btn btn-primary"><i class="fa-solid fa-check"></i> 등록</button>
                    <button type="button" class="btn btn-secondary" onclick="history.back()"><i class="fa-solid fa-times"></i> 취소</button>
                </div>
            </form>
        </main>
    </div>
    <c:import url="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>
    <script src="/js/dms.js"></script>
</body>
</html>