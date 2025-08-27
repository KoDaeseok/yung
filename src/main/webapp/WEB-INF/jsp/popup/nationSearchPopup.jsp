<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 국가 검색 팝업 모달 --%>
<div id="nation-search-modal" class="search-modal-overlay" style="display: none;">
    <div class="search-modal-content">
        <div class="search-modal-header">
            <h2>국가 검색</h2>
            <button type="button" class="modal-close-btn">&times;</button>
        </div>
        <div class="search-modal-body">
            <div class="search-bar">
                <select name="search-condition" style="width: 100px;">
                    <option value="natKorNm">국가명</option>
                    <option value="natC">국가코드</option>
                </select>
                <input type="text" placeholder="검색어를 입력하세요">
                <button type="button" class="btn btn-dark">조회</button>
            </div>
            
            <table class="results-table">
                <thead>
                    <tr>
                        <th style="width: 25%;">국가코드</th>
                        <th style="width: 45%;">국가한글명</th>
                        <th style="width: 30%;">국가영문명</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- nation_popup.js를 통해 동적으로 채워집니다 --%>
                </tbody>
            </table>

            <div class="search-modal-footer">
                 <div class="pagination-wrapper">
                    <div class="pagination">
                         <%-- nation_popup.js를 통해 동적으로 채워집니다 --%>
                    </div>
                </div>
                 <div class="item-counter">
                    <%-- nation_popup.js를 통해 동적으로 채워집니다 --%>
                </div>
            </div>
        </div>
    </div>
</div>