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

    <h2 class="dispay-2">${ad.title}</h2>
    <small>Created by ${user.username} on ${ad.date}</small>




    <%--Scripts--%>
    <jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
