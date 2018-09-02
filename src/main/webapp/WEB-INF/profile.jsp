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

    <div class="row mt-4">
        <div class="col-1">
            <i class="fas fa-user fa-4x pt-2" style="color: #696969;"></i>
        </div>
        <div class="col">
            <h1>Profile</h1>
            <h6>Welcome, ${sessionScope.user.firstName}!</h6>
        </div>
    </div>
    <hr>

    <div class="row">
        <div class="col-4 d-flex align-self-center">
            <h2>My Information</h2>
        </div>
        <table class="col-8 mt-3 w-80 table table-sm table-borderless">
            <tbody>
                <tr>
                    <td>Full Name: ${sessionScope.user.firstName} ${sessionScope.user.lastName}</td>
                    <td>Username: ${sessionScope.user.username}</td>
                </tr>
                <tr>
                    <td>Phone Number: ${sessionScope.user.phoneNo}</td>
                    <td>Email: ${sessionScope.user.email}</td>
                </tr>
            </tbody>
        </table>
    </div>
    <hr>
    <hr class="mb-0">
    <br>
    <c:if test="${sessionScope.profileEdited != null}">
        <div class="alert alert-info" role="alert">${sessionScope.profileEdited}</div>
    </c:if>
    <c:if test="${sessionScope.deleted != null}">
        <div class="alert alert-info" role="alert">${sessionScope.deleted}</div>
    </c:if>
    <c:if test="${sessionScope.edited != null}">
        <div class="alert alert-info" role="alert">${sessionScope.edited}</div>
    </c:if>
    <h2 class="mb-3 mt-0">My Ads</h2>
    <table class="table-striped table-borderless table">
        <thead style="background-color: #696969; color: white;">
        <tr>
            <h3>
                <th scope="col">Date Posted</th>
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
                        <c:out value="${user_ads.datePosted}" />
                    </h5>
                </th>
                <td>
                    <h5>
                        <a class="title-link" href="<%= response.encodeURL(request.getContextPath() + "/ads/ad?adId=") %>${user_ads.id}">
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
                    <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#modal${user_ads.id}">
                        Delete
                    </button>
                    <form class="mt-2" action="ads/edit" method="get">
                        <a class="btn btn-secondary btn-sm" name="edit" href="${pageContext.request.contextPath}/ads/edit?id=${user_ads.id}">Edit</a>
                    </form>
                </td>
            </tr>

            <div class="modal fade" id="modal${user_ads.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Delete Ad</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Are you sure you wish to delete "${user_ads.title}"?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <form action="ads/delete" method="get">
                                <a class="btn btn-danger" href="${pageContext.request.contextPath}/ads/delete?id=${user_ads.id}">Delete</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        </tbody>
    </table>

    <c:if test="${noOfAds == 0}">
        <small class="mx-auto">You haven't posted any ads yet!</small>
    </c:if>

</div>
<jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
