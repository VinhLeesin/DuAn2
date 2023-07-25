<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="container mt-3">
<form:form action="/admin/category/index" modelAttribute="item">
        <h3>Update Category</h3>
        <div class="row mt-2">
            <div class="col-4">ID:</div>
            <div class="col-8">
                <form:input path="id" placeholder="Category Id?" readonly="true"/>
                <%--                <form:errors cssClass="text-danger" path="name"/>--%>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-4">Name:</div>
            <div class="col-8">
                <form:input path="name" placeholder="Category Name?"/>
                <%--                <form:errors cssClass="text-danger" path="name"/>--%>
            </div>
        </div>
        <a href="/admin/category/index" class="btn btn-secondary">Quay lại</a>
    <button formaction="/admin/category/create">Update</button>
</form:form>
</div>
