<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container mt-3">
    <table class="table">
        <thead>
        <tr>
            <th>Mã</th>
            <th>Tên nhóm</th>
            <th></th>
        </tr>
        </thead>
        <c:forEach items="${items}" var="item">
            <tr>
                <td>${item.id}</td>
                <td>${item.name}</td>
                <td>
                    <a class="btn btn-sm btn-secondary"
                       href="/admin/category/update/${item.id}">Chỉnh sửa</a>
                    <a class="btn btn-sm btn-danger"
                       href="/admin/category/delete/${item.id}">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="/admin/category/viewAdd">ADD Category</a>
</div>