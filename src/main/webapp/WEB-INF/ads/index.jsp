
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
    <div class="row mt-4">
        <div class="col-1">
            <i class="far fa-list-alt fa-4x" style="color: #696969;"></i>
        </div>
        <div class="col">
            <c:choose>
                <c:when test="${search != null && category != null}">
                    <h1 class="pt-2">Ads matching "<c:out value="${search}" />" in <c:out value="${category}" /></h1>
                </c:when>
                <c:when test="${search != null}">
                    <h1 class="pt-2">Ads matching "<c:out value="${search}" />"</h1>
                </c:when>
                <c:when test="${category != null}">
                    <h1 class="pt-2">Ads in <c:out value="${category}" /></h1>
                </c:when>
                <c:otherwise>
                    <h1 class="pt-2">All Ads</h1>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <hr class="my-3">

    <%--added dynamic table to for-each loop--%>
    <table class="table-striped table-borderless table">
        <thead style="background-color: #696969; color: white;">
        <tr>
            <th class="w-25">Date Posted</th>
            <th class="w-25">Title</th>
            <th class="w-50">Description</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="ad" items="${ads}">
            <tr>
                <td>
                    <h5>
                        <c:out value="${ad.datePosted}" />
                    </h5>
                </td>
                <td>
                    <h5>
                        <a class="title-link" href="<%= response.encodeURL(request.getContextPath() + "/ads/ad?adId=") %>${ad.id}">
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

    <c:if test="${noOfResults == 0}">
        <small>No ads matching your search...</small>
    </c:if>
</div>

<jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>