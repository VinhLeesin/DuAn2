<%@ page pageEncoding="utf-8" %>
<div class="container mt-3">
    <form action="/admin/account/create" method="post" enctype="multipart/form-data">
        <h3>ADD Account</h3>
        <div class="row mt-2">
            <div class="col-4">Username:</div>
            <div class="col-8">
                <input name="username" type="text"/>
                <%--                <form:errors cssClass="text-danger" path="name"/>--%>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-4">Password:</div>
            <div class="col-8">
                <input name="password" type="password"/>
                <%--                <form:errors cssClass="text-danger" path="name"/>--%>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-4">Fullname:</div>
            <div class="col-8">
                <input name="fullname" type="text"/>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-4">Email:</div>
            <div class="col-8">
                <input name="email" type="email"/>
                <%--                <form:errors path="price" cssClass="text-danger"/>--%>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-4">Admin</div>
            <div class="col-8">
                <input type="radio" name="admin" value="true"/>User
                <input type="radio" name="admin" value="false"/>Admin
                <%--                <form:errors path="price" cssClass="text-danger"/>--%>
            </div>
        </div>
        <a href="/admin/account/index" class="btn btn-secondary">Quay lại</a>
        <button type="submit">ADD</button>
    </form>
</div>
