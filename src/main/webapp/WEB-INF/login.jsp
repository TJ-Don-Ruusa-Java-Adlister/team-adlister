<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <c:if test="${sessionScope.loggedOut != null}">
            <div class="my-3 alert alert-info" role="alert">${sessionScope.loggedOut}</div>
            <hr>
        </c:if>
        <c:if test="${sessionScope.registered != null}">
            <div class="my-3 alert alert-success" role="alert">${sessionScope.registered}</div>
            <hr>
        </c:if>
        <c:if test="${sessionScope.error != null}">
            <div class="my-3 alert alert-danger" role="alert">${sessionScope.error}</div>
            <hr>
        </c:if>

        <div class="card border-dark mx-auto mt-5 text-center" style="width: 24rem;">
            <div class="card-header">
                <h1 class="pt-2 ml-2"><i class="far fa-keyboard" style="color: #696969;"></i> Login</h1>
            </div>
            <div class="card-body">
                <form action="/login" method="POST">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input id="username" name="username" class="form-control" type="text" value="${sessionScope.tempUsername}">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input id="password" name="password" class="form-control" type="password">
                    </div>
                    <input type="submit" class="btn btn-danger btn-block" value="Log In">
                </form>
            </div>
        </div>

    </div>
    <jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
