<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="password-popup-modal" class="popup-modal-overlay" style="display: none;">
    <div class="popup-modal-content">
        <div class="login-card" style="width: 450px;">
            <span class="popup-modal-close">&times;</span>
            <div class="login-header">
                <h1>비밀번호 변경</h1>
            </div>
            <form class="login-form" id="password-change-form">
                <input type="hidden" id="password-change-userid">
                <div class="form-group">
                    <label for="current-password">현재 비밀번호</label>
                    <input type="password" id="current-password" name="currentPassword">
                </div>
                <div class="form-group">
                    <label for="new-password">새 비밀번호</label>
                    <input type="password" id="new-password" name="newPassword">
                </div>
                <div class="form-group">
                    <label for="new-password-confirm">새 비밀번호 확인</label>
                    <input type="password" id="new-password-confirm" name="newPasswordConfirm">
                </div>
                <button type="submit" class="btn btn-primary btn-block">변경하기</button>
            </form>
        </div>
    </div>
</div>