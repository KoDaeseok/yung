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
            <h1><i class="fa-solid fa-id-badge"></i> 업무담당자 상세</h1>

            <form id="manager-form-detail">
                <table class="form-table">
                    <tbody>
                        <tr>
                            <th><span class="required">*</span> 펀드</th>
                            <td colspan="3">
                                <div class="input-with-button">
                                    <input type="text" name="fundCode" class="short-input" value="${manager.fundCode}" readonly>
                                    <input type="text" name="fundName" class="wide-input" value="${manager.fundName}" readonly>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 기관구분</th>
                            <td><input type="text" class="short-input" value="${manager.orgType}" readonly></td>
                            <th><span class="required">*</span> 역할구분</th>
                            <td><input type="text" class="short-input" value="${manager.roleType}" readonly></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 이름</th>
                            <td><input type="text" class="short-input" value="${manager.managerName}" readonly></td>
                            <th><span class="required">*</span> 직위</th>
                            <td><input type="text" class="short-input" value="${manager.position}" readonly></td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td colspan="3"><input type="text" value="${manager.emailId}@${manager.emailDomain}" readonly></td>
                        </tr>
                        <tr>
                            <th>휴대폰</th>
                            <td><input type="text" class="short-input" value="${manager.mobile1}-${manager.mobile2}-${manager.mobile3}" readonly></td>
                            <th>전화번호(내선)</th>
                            <td><input type="text" class="short-input" value="${manager.phone1}-${manager.phone2}-${manager.phone3}" readonly></td>
                        </tr>
                        <tr>
                            <th>담당업무</th>
                            <td colspan="3"><input type="text" value="${manager.task}" readonly></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 담당기간</th>
                            <td colspan="3">
                                <div class="date-range">
                                    <input type="date" class="short-input" value="${manager.startDate}" readonly>
                                    <span>~</span>
                                    <input type="date" class="short-input" value="${manager.endDate}" readonly>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="button-container">
                    <button type="button" class="btn btn-primary" onclick="location.href='/finops/manager/form?id=${manager.id}'"><i class="fa-solid fa-edit"></i> 수정</button>
                    <button type="button" class="btn btn-outline" id="delete-btn"><i class="fa-solid fa-trash"></i> 삭제</button>
                    <button type="button" class="btn btn-outline" onclick="location.href='/finops/manager/list'"><i class="fa-solid fa-list"></i> 목록</button>
                </div>
            </form>
        </main>
    </div>
    <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>
    <script src="/js/finops_manager.js"></script>
</body>
</html>