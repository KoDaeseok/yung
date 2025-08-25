<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>경찰공제회 - 오류</title>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
    <c:import url="/header.do" />
    <div class="error-container">
        <div class="error-content">
            <i class="fa-solid fa-circle-exclamation"></i>
            <%-- JavaScript가 내용을 채울 수 있도록 id를 지정합니다. --%>
            <h1 id="errorTitle"></h1>
            <p id="errorMessage"></p>
            <a href="/" class="btn btn-primary">메인으로 돌아가기</a>
        </div>
    </div>
    <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />

    <script>
        // 페이지가 로드되면 바로 스크립트를 실행합니다.
        document.addEventListener('DOMContentLoaded', function() {
            // Controller에서 전달한 statusCode를 JavaScript 변수로 받습니다.
            const statusCode = Number("${statusCode}");

            const titleElement = document.getElementById('errorTitle');
            const messageElement = document.getElementById('errorMessage');

            let errorTitle = "오류가 발생했습니다.";
            let errorMessage = "서비스 이용에 불편을 드려 죄송합니다.<br>잠시 후 다시 시도해 주시기 바랍니다.";

            if (statusCode === 400) {
                errorTitle = "잘못된 요청입니다.";
                errorMessage = "요청의 형식이 올바르지 않습니다.<br>입력하신 내용을 다시 확인해 주세요.";
            } else if (statusCode === 401) {
                errorTitle = "인증이 필요합니다.";
                errorMessage = "이 페이지에 접근하려면 로그인이 필요합니다.<br>로그인 후 다시 시도해 주세요.";
            } else if (statusCode === 403) {
                errorTitle = "접근이 거부되었습니다.";
                errorMessage = "이 페이지에 접근할 수 있는 권한이 없습니다.<br>관리자에게 문의해 주시기 바랍니다.";
            } else if (statusCode === 404) {
                errorTitle = "페이지를 찾을 수 없습니다.";
                errorMessage = "요청하신 페이지가 존재하지 않거나, 사용할 수 없는 페이지입니다.<br>입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.";
            } else if (statusCode === 500) {
                errorTitle = "서버 내부 오류가 발생했습니다.";
                errorMessage = "서비스 처리 중 오류가 발생했습니다.<br>관리자에게 문의해 주시기 바랍니다.";
            } else if (statusCode === 503) {
                errorTitle = "서비스를 사용할 수 없습니다.";
                errorMessage = "서버 점검 중이거나 트래픽이 많아 현재 서비스를 이용할 수 없습니다.<br>잠시 후 다시 시도해 주세요.";
            }

            // 결정된 메시지를 HTML 요소에 삽입합니다.
            titleElement.innerHTML = errorTitle;
            messageElement.innerHTML = errorMessage;
        });
    </script>
</body>
</html>