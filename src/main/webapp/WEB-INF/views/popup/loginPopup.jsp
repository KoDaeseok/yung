<!-- views/popup/loginPopup.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 로그인 팝업 모달 --%>
<div id="login-popup-modal" class="popup-modal-overlay" style="display: none;">
    <div class="popup-modal-content">
        <div class="login-card">
            <%-- 닫기 버튼을 login-card 안으로 이동 --%>
            <span class="popup-modal-close">&times;</span>
            
            <div class="login-header">
                <h1>로그인</h1>
                <p>처음 방문하신 분은 아이디 요청 후<br>로그인하시기 바랍니다.</p>
            </div>
            <form class="login-form" id="login-form">
                <div class="form-group">
                    <label for="popup-username">아이디</label>
                    <input type="text" id="popup-username" name="username">
                    <div class="error-message" id="username-error"></div>
                </div>
                <div class="form-group">
                    <label for="popup-password">비밀번호</label>
                    <input type="password" id="popup-password" name="password">
                    <div class="error-message" id="password-error"></div>
                </div>
                <!-- <button type="submit" class="btn-login">로그인</button> -->
                <button type="submit" class="btn btn-primary btn-block">로그인</button>
            </form>
            <div class="login-options">
                <div class="checkbox-group">
                    <input type="checkbox" id="remember-id">
                    <label for="remember-id">아이디저장</label>
                </div>
                <a href="/signup">회원가입</a>
            </div>
        </div>
    </div>
</div>