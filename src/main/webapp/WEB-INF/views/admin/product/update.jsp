<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container mt-3">
    <form action="/admin/product/create" method="post">
        <h3>Sửa sản phẩm</h3>
        <div class="row">
            <div class="col-4">ID sản phẩm:</div>
            <div class="col-8">
                <input name="id" type="text" value="${item.id}" placeholder="Id sản phẩm"/>
                <%--                <form:errors cssClass="text-danger" path="name"/>--%>
            </div>
        </div>
        <div class="row">
            <div class="col-4">Tên sản phẩm:</div>
            <div class="col-8">
                <input name="name" type="text" value="${item.name}" placeholder="Tên sản phẩm"/>
                <%--                <form:errors cssClass="text-danger" path="name"/>--%>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-4">Nhóm sản phẩm:</div>
            <div class="col-8">
                <select name="category">
                    <c:forEach items="${category}" var="category">
                        <option value="${category.id}">${category.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-4">Giá sản phẩm:</div>
            <div class="col-8">
                <input name="price" type="text" value="${item.price}" placeholder="Giá sản phẩm"/>
                <%--                <form:errors path="price" cssClass="text-danger"/>--%>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-4">Ngày Nhập:</div>
            <div class="col-8">
                <input name="date" type="text" value="${item.date}" placeholder="yyyy/MM/dd"/>
                <%--                <form:errors path="price" cssClass="text-danger"/>--%>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-4">Ảnh:</div>
            <div class="col-8">
                <input name="image" type="file" value="${item.image}" placeholder="Ảnh"/>
            </div>
        </div>
        <a href="/admin/product/index" class="btn btn-secondary">Quay lại</a>
        <button class="btn btn-primary" formaction="/admin/product/create">Update</button>
    </form>
</div>