<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<div class="container mt-3">
    <table class="table">
        <thead>
        <tr>
            <th>Username</th>
            <th>Password</th>
            <th>FullName</th>
            <th>Email</th>
            <th>Admin</th>
        </tr>
        </thead>
        <c:forEach items="${items}" var="item">
            <tr>
                <td>${item.username}</td>
                <td>${item.password}</td>
                <td>${item.fullname}</td>
                <td>${item.email}</td>
                <td>${item.admin ? "admin" : "user"}</td>
                <td>
                    <a class="btn btn-sm btn-secondary"
                       href="/admin/account/update/${item.username}">Chỉnh sửa</a>
                    <a class="btn btn-sm btn-danger"
                       href="/admin/account/delete/${item.username}">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="/admin/account/viewAdd">Thêm sản phẩm</a>
</div>