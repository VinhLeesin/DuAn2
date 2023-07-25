<%@ page pageEncoding="utf-8" %>
<div class="container mt-3">
    <form action="/admin/category/create" method="post" enctype="multipart/form-data">
        <h3>ADD Category</h3>
        <div class="row mt-2">
            <div class="col-4">ID:</div>
            <div class="col-8">
                <input name="id" type="text"/>
                <%--                <form:errors cssClass="text-danger" path="name"/>--%>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-4">Name:</div>
            <div class="col-8">
                <input name="name" type="text"/>
                <%--                <form:errors cssClass="text-danger" path="name"/>--%>
            </div>
        </div>
        <a href="/admin/category/index" class="btn btn-secondary">Quay lại</a>
        <button type="submit">ADD</button>
    </form>
</div>
