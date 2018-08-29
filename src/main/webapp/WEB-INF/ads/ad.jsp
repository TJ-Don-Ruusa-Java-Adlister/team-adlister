<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="${ad.title}" />
    </jsp:include>
</head>
<body>
<%--Navbar--%>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="row"></div>
<h4 class="display-4">${ad.title}</h4>
<small class="text-muted">Created by ${user.username} on ${ad.datePosted}</small>

<p>${ad.description}</p>

<form action="/ads" method="GET">
    <button type="submit" class="btn btn-secondary">Back to Ads</button>
</form>

<%--Scripts--%>
<jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
