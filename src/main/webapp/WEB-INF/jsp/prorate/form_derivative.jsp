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
                <a href="/"><i class="fa-solid fa-house"></i> 홈</a>
                <span>></span><span>금리제안</span><span>></span><span>${pageTitle}</span>
            </div>
            <h1><i class="fa-solid fa-pen-to-square"></i> ${pageTitle}</h1>
            
            <%-- 요청 정보 표시 테이블 --%>
            <div class="section-title" style="margin-top:20px;">
                <h2>요청내용</h2>
            </div>
            <table class="form-table">
                 <tbody>
                    <tr>
                        <th>요청일자</th>
                        <td><input type="text" value="2025-09-01" readonly></td>
                        <th>담당부서</th>
                        <td><input type="text" value="경찰공제회" readonly></td>
                    </tr>
                    <tr>
                        <th>담당팀</th>
                        <td><input type="text" value="주식투자팀" readonly></td>
                        <th>담당자</th>
                        <td><input type="text" value="김주식" readonly></td>
                    </tr>
                    <tr>
                        <th>요청명</th>
                        <td colspan="3"><input type="text" value="파생결합상품 금리요청" readonly></td>
                    </tr>
                </tbody>
            </table>

            <form>
                <div class="section-title" style="margin-top:20px;">
                    <h2>제안금리</h2>
                </div>
                <table class="form-table">
                    <tbody>
                        <tr>
                            <th><span class="required">*</span> 자산규모</th>
                            <td><input type="text" name="assetScale" class="short-input"></td>
                            <th><span class="required">*</span> 자기자본</th>
                            <td><input type="text" name="equityCapital" class="short-input"></td>
                        </tr>
                        <tr>
                            <th>신용등급</th>
                            <td colspan="3"><input type="text" name="creditRating" class="short-input"></td>
                        </tr>
                    </tbody>
                </table>
                <div class="content-container" style="margin-top:20px;">
                    <table class="data-table">
                         <thead>
                            <tr>
                                <th style="width:10%">유형</th>
                                <th style="width:auto">조건</th>
                                <th style="width:20%">투자기간</th>
                                <th style="width:20%"><span class="required">*</span> 금리</th>
                             </tr>
                        </thead>
                        <tbody>
                            <c:forEach begin="1" end="15" var="i">
                                 <tr>
                                    <td>유형${i}</td>
                                    <td style="text-align: left;">조건 예시 텍스트 ${i}</td>
                                     <td>투자기간 예시 ${i}</td>
                                    <td><input type="text" name="rate_${i}" style="width:100%; text-align:right;" placeholder="0.00 %"></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                     </table>
                </div>
                <div class="section-title" style="margin-top:20px;">
                    <h2>제안내용</h2>
                </div>
                 <table class="form-table">
                     <tbody>
                         <tr>
                            <th>기타</th>
                            <td><textarea name="etc" style="width:100%; height: 80px; resize: vertical;"></textarea></td>
                        </tr>
                        <tr>
                            <th>제안내용</th>
                            <td><textarea name="proposalContent" style="width:100%; height: 80px; resize: vertical;"></textarea></td>
                        </tr>
                    </tbody>
                </table>
                <div class="form-buttons">
                    <button type="submit" class="btn btn-primary"><i class="fa-solid fa-check"></i> ${isEdit ? '수정' : '등록'}</button>
                    <button type="button" class="btn btn-secondary" onclick="history.back()"><i class="fa-solid fa-times"></i> 취소</button>
                </div>
            </form>
        </main>
    </div>
    <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>
</body>
</html>