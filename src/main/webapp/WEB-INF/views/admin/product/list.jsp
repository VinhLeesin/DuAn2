<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<div class="container mt-3">
    <table class="table">
        <thead>
        <tr>
            <th>Mã</th>
            <th>Dòng sản phẩm</th>
            <th>Tên sản phẩm</th>
            <th>Giá sản phẩm</th>
            <th>Ngày Nhâp</th>
            <th>Ảnh</th>
            <th>Action</th>
        </tr>
        </thead>
        <c:forEach items="${items}" var="item">
            <tr>
                <td>${item.id}</td>
                <td>${item.category.name}</td>
                <td>${item.name}</td>
                <td>${item.price}</td>
                <td>${item.date}</td>
                <td><img src="/static/images/${item.image}" width="60px" height="60px"/></td>
                <td>
                    <a class="btn btn-sm btn-secondary"
                       href="/admin/product/update/${item.id}">Chỉnh sửa</a>
                    <a class="btn btn-sm btn-danger"
                       href="/admin/product/delete/${item.id}">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="/admin/product/viewAdd">Thêm sản phẩm</a>
</div>