<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<form method="post">
    Khách hàng: <input name="user" value="${param.user}"/>
    Từ ngày: <input name="fromDate" value="${param.fromDate}" placeholder="dd/MM/yyyy"/>
    đến ngày: <input name="toDate" value="${param.toDate}" placeholder="dd/MM/yyyy"/>
    <button>Tìm kiếm</button>
</form>
<ul>
    <c:forEach items="${items}" var="item">
        <li>${item.account.fullname} - ${item.createdate}</li>
    </c:forEach>
</ul>