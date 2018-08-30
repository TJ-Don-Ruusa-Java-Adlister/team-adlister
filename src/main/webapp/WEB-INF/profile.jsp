<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
    </div>

    <c:forEach var="user_ads" items="${user_ads}">
        <div class="col-md-6">
            <h2><c:out value="${user_ads.title}" /></h2>
            <p><c:out value="${user_ads.description}" /></p>
        </div>
    </c:forEach>

    <jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
