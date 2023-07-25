<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="container mt-3">
    <form:form action="/admin/account/index" modelAttribute="item" enctype="multipart/form-data">
        <h3>Update Account</h3>
        <div class="row mt-2">
            <div class="col-4">Username:</div>
            <div class="col-8">
                <form:input path="username" placeholder="Account Ussername?"/>
                    <%--                <form:errors cssClass="text-danger" path="name"/>--%>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-4">Password:</div>
            <div class="col-8">
                <form:input path="password" placeholder="Account Password?"/>
                    <%--                <form:errors cssClass="text-danger" path="name"/>--%>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-4">Fullname:</div>
            <div class="col-8">
                <form:input path="fullname" placeholder="Account Fullname?"/>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-4">Email:</div>
            <div class="col-8">
                <form:input path="email" placeholder="Product Price?"/>
                    <%--                <form:errors path="price" cssClass="text-danger"/>--%>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-4">Admin</div>
            <div class="col-8">
                <form:radiobutton path="admin" value="false" label="User"/>
                <form:radiobutton path="admin" value="true" label="Admin"/>
                    <%--                <form:errors path="price" cssClass="text-danger"/>--%>
            </div>
        </div>
        <a href="/admin/account/index" class="btn btn-secondary">Quay lại</a>
        <button class="btn btn-primary" formaction="/admin/account/create">Update</button>
    </form:form>
</div>