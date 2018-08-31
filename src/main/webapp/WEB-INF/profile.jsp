<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">

</div>

<div class="container">



    <%--added Table to list adds after logging in --%>
    <c:if test="${requestScope.search != null}">
        <h3>Search term: <c:out value="${search}" /></h3>
    </c:if>

    <h1>Welcome, ${sessionScope.user.firstName}!</h1>
    <hr>
    <br>
    <table class="table-striped table-bordered table-hover table" style="width: 80%; margin: 0 auto;">
        <thead class="thead-dark " >

        <tr>
            <th colspan="4"><h1>Our Current Ads Listings</h1>
            </th>
        </tr>



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
                    <form action="ads/delete" method="get">
                        <a href="${pageContext.request.contextPath}/ads/delete?id=${user_ads.id}">Delete</a>
                    </form>
                    <form action="ads/edit" method="get">
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
