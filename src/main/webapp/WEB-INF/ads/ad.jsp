<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="${ad.title}" />
    </jsp:include>
    <link rel="stylesheet" href="/css/sidebar.css">
</head>
<body>
<%--Navbar--%>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <div class="mt-4" ">
            <c:if test="${sessionScope.created != null}">
                <div class="alert alert-success" role="alert">${sessionScope.created}</div>
            </c:if>
            <h1>${ad.title}</h1>
            <small class="text-muted" style="font-size: 10px;">Created by ${user.username} on ${ad.datePosted}</small>
        </div>
        <hr>
        <div class="row mt-5">
            <div class="col-12">
                <p>${ad.description}</p>
                <form action="/ads" method="GET">
                    <button class="btn btn-secondary btn-sm disabled" disabled>Message User</button>
                    <button type="submit" class="btn btn-secondary btn-sm">Back to Ads</button>
                </form>
            </div>
        </div>
    </div>
</div>

<%--Scripts--%>
<jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
