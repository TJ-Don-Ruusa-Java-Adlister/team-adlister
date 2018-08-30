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

    <%--added Table to list adds after logging in --%>
    <div>
        <table class="table-striped table-bordered table-hover table" style="width: 80%; margin: 0 auto;">
            <thead class="thead-dark ">
            <tr>
                <h3>
                    <th scope="col">Ad id</th>
                    <th scope="col">Title</th>
                    <th scope="col">Description</th>
                    <th scope="col"></th>
                </h3>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user_ads" items="${user_ads}">
                <tr>
                    <th scope="row">
                        <h5>
                            <c:out value="${user_ads.id}" />
                        </h5>
                    </th>
                    <td>
                        <h5>
                            <a href="<%= response.encodeURL(request.getContextPath() + "/ads/ad?adId=") %>${user_ads.id}">
                                <c:out value="${user_ads.title}" />
                            </a>
                        </h5>
                    </td>
                    <td>
                        <h5>
                            <c:out value="${user_ads.description}" />
                        </h5>
                    </td>
                    <td>
                        <form action="ads/delete" method="post">
                            <a href="${pageContext.request.contextPath}/ads/delete?id=${user_ads.id}">Delete</a>
                        </form>
                        <form action="ads/edit" method="post">
                            <a name="edit" href="${pageContext.request.contextPath}/ads/edit?id=${user_ads.id}">Edit</a>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>

    <jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
