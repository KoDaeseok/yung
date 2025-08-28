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
                <span>></span><span>요청/리서치자료</span><span>></span><span>${pageTitle}</span>
            </div>
            <h1><i class="fa-solid fa-pen-to-square"></i> ${pageTitle}</h1>
            
            <form id="research-form">
                <table class="form-table">
                     <tbody>
                        <tr>
                            <th>제안기관</th>
                            <td><input type="text" class="short-input" value="KB자산운용" readonly></td>
                            <th>소속부서</th>
                            <td><input type="text" class="short-input" value="정보시스템부" readonly></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 자료유형</th>
                            <td colspan="3">
                                <select name="dataType" class="short-input">
                                    <option value="">선택</option>
                                    <option value="type1">국내외 주식</option>
                                    <option value="type2">국내외 채권</option>
                                    <option value="type3">대체투자</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 제목</th>
                            <td colspan="3"><input type="text" name="title"></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 작성자</th>
                            <td colspan="3"><input type="text" name="author" class="short-input"></td>
                        </tr>
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
                    <button type="button" class="btn btn-secondary" onclick="location.href='/dms/request/list'"><i class="fa-solid fa-times"></i> 취소</button>
                </div>
            </form>
        </main>
    </div>
    <c:import url="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>
    <script src="/js/dms.js"></script>
</body>
</html>