
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />


<div class="container">
    <h1>Here Are all the ads!</h1>

    <c:if test="${requestScope.search != null}">
        <h3>Search term: <c:out value="${search}" /></h3>
    </c:if>
    <%--added dynamic table to for-each loop--%>
    <table class="table-striped table-bordered table-hover table" style="width: 80%; margin: 0 auto;">
        <thead class="thead-dark ">
        <tr>
            <h3>
                <th scope="col">Ad id</th>
                <th scope="col">Title</th>
                <th scope="col">Description</th>
            </h3>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="ad" items="${ads}">
            <tr>
                <th scope="row">
                    <h5>
                        <c:out value="${ad.id}" />
                    </h5>
                </th>
                <td>
                    <h5>
                        <a href="<%= response.encodeURL(request.getContextPath() + "/ads/ad?adId=") %>${ad.id}">
                            <c:out value="${ad.title}" />
                        </a>
                    </h5>
                </td>
                <td>
                    <h5>
                        <c:out value="${ad.description}" />
                    </h5>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>