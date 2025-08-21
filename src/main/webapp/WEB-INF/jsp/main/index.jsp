<%--
  Class Name : index.jsp
  Description : 메인화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2025.08.19  이정민       최초 생성
 
    author   : 이정민
    since    : 2025.08.19
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
	<script src="<c:url value='/'/>js/ui.js"></script>

<title>경찰공제회 정보교류시스템</title>
</head>
<body>
<noscript><p>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</p></noscript>
	
	<form:form modelAttribute="mainVO" id="listForm" name="listForm" method="get">
		<div id="table">
        		<table width="100%" border="0" cellpadding="0" cellspacing="0" summary="첨부파일 아이디, 기관코드, 파일내용, 생성일시, 책임자사용자ID, 최종 변경자 사용자ID">
        			<caption style="visibility:hidden">첨부파일 아이디, 기관코드, 파일내용, 생성일시, 책임자사용자ID, 최종 변경자 사용자ID</caption>
        			<colgroup>
        				<col width="100"/>
        				<col width="40"/>
        				<col width="150"/>
        				<col width="80"/>
        				<col width="?"/>
        				<col width="60"/>
        			</colgroup>
        			<tr>
        				<th align="center">첨부파일 아이디</th>
        				<th align="center">기관코드</th>
        				<th align="center">파일내용</th>
        				<th align="center">생성일시</th>
        				<th align="center">책임자사용자ID</th>
        				<th align="center">최종 변경자 사용자ID</th>
        			</tr>
        			<c:forEach var="result" items="${voList}" varStatus="status">
            			<tr>
            				<td align="center" class="listtd"><c:out value="${result.atchFileId}"/></td>
            				<td align="center" class="listtd"><c:out value="${result.orgC}"/></td>
            				<td align="left" class="listtd"><c:out value="${result.fileBusiTc}"/></td>
            				<td align="center" class="listtd"><c:out value="${result.crtDt}"/></td>
            				<td align="center" class="listtd"><c:out value="${result.dutyMnUsid}"/></td>
            				<td align="center" class="listtd"><c:out value="${result.lastChngMnUsid}"/></td>
            			</tr>
        			</c:forEach>
        		</table>
        	</div>
	</form:form>
</body>
</html>