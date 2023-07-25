<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" %>

<div class="container mt-3">
    <form action="/admin/product/create" method="post">
        <h3>Thêm sản phẩm</h3>
        <div class="row">
            <div class="col-4">Tên sản phẩm:</div>
            <div class="col-8">
                <input name="name" type="text" placeholder="Tên sản phẩm"/>
                <%--                <form:errors cssClass="text-danger" path="name"/>--%>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-4">Nhóm sản phẩm:</div>
            <div class="col-8">
                <select name="category" >
                    <c:forEach items="${category}" var="category">
                        <option value="${category.id}">${category.name}</option>
                    </c:forEach>

                </select>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-4">Giá sản phẩm:</div>
            <div class="col-8">
                <input name="price" type="text" placeholder="Giá sản phẩm"/>
                <%--                <form:errors path="price" cssClass="text-danger"/>--%>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-4">Ngày Nhập:</div>
            <div class="col-8">
                <input name="date" type="text" placeholder="Ngày nhập"/>
                <%--                <form:errors path="price" cssClass="text-danger"/>--%>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-4">Ảnh:</div>
            <div class="col-8">
                <input name="image"  type="file"  placeholder="Ảnh"/>
            </div>
        </div>
        <a href="/admin/product/index" class="btn btn-secondary">Quay lại</a>
        <button class="btn btn-primary" type="submit">ADD</button>
    </form>
</div>

