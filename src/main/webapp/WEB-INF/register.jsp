<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="partials/navbar.jsp" />
    <div class="container">
    <%--Displays an error if any of the forms/form values are invalid--%>
        <c:if test="${error != null}">
            <div class="alert alert-danger" role="alert">${error}</div>
            <hr class="mb-5">
        </c:if>

    <%--Registration form--%>
        <div class="card border-dark mx-auto my-5" style="width: 32rem;">
            <div class="card-header text-center">
                <h1 class="pt-2 ml-2"><i class="fas fa-user-plus" style="color: #696969;"></i> Register</h1>
            </div>
            <div class="card-body">
                <form action="/register" method="post">
                    <div class="form-group">
                        <label for="firstName"><span style="color: #d81700; font-weight: bold">* </span>First Name</label>
                        <input id="firstName" name="firstName" class="form-control" type="text" value="${sessionScope.firstName}" placeholder="e.g. Bill">
                    </div>
                    <div class="form-group">
                        <label for="lastName"><span style="color: #d81700; font-weight: bold">* </span>Last Name</label>
                        <input id="lastName" name="lastName" class="form-control" type="text" value="${sessionScope.lastName}" placeholder="e.g. Johnson">
                    </div>
                    <div class="form-group">
                        <label for="username"><span style="color: #d81700; font-weight: bold">* </span>Username</label>
                        <input id="username" name="username" class="form-control" type="text" value="${sessionScope.username}" placeholder="e.g. billyjohn123">
                    </div>
                    <div class="form-group">
                        <label for="phoneNo"><span style="color: #d81700; font-weight: bold">* </span>Phone Number</label>
                        <input id="phoneNo" name="phoneNo" class="form-control" type="text" value="${sessionScope.phoneNo}" placeholder="e.g. 5551114444">
                    </div>
                    <div class="form-group">
                        <label for="email"><span style="color: #d81700; font-weight: bold">* </span>Email</label>
                        <input id="email" name="email" class="form-control" type="text" value="${sessionScope.email}" placeholder="e.g. billy@bob.com">
                    </div>
                    <div class="form-group">
                        <label for="password"><span style="color: #d81700; font-weight: bold">* </span>Password</label>
                        <input id="password" name="password" class="form-control" type="password" value="${sessionScope.password}" placeholder="eightcharacters">
                    </div>
                    <div class="form-group">
                        <label for="confirm_password"><span style="color: #d81700; font-weight: bold">* </span>Confirm Password</label>
                        <input id="confirm_password" name="confirm_password" class="form-control" type="password">
                    </div>
                    <input type="submit" class="btn btn-danger btn-block">
                </form>
            </div>
        </div>
    </div>

<%--JavaScript(s)--%>
    <jsp:include page="partials/scripts.jsp" />
</body>
</html>
