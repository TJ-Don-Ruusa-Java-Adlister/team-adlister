<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../partials/head.jsp">
        <jsp:param name="title" value="Edit Your Ad" />
    </jsp:include>
</head>
<body>
    <jsp:include page="../partials/navbar.jsp" />
    <h1>Edit Your Ad</h1>

    <div style="width:900px; margin-left: auto; margin-right: auto">
        <form action="/ads/edit" method="POST">
            <div class="form-group">
                <div class="row">
                    <div class="col-3"></div>
                    <div class="col-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Edit your Ad</h5>
                                <p class="card-text">Here you can edit the title and/or description of your ad. Categories cannot be changed.</p>
                                <div class="form-group">
                                    <label for="title">Title</label>
                                    <input type="hidden" name="id" value="${ad.id}">
                                    <input id="title" name="title" class="form-control" type="text" value="${ad.title}">
                                </div>
                                <div class="form-group">
                                    <label for="description">Description</label>
                                    <textarea id="description" name="description" class="form-control" type="text">${ad.description}</textarea>
                                </div>
                                <div class="form-group">
                                    <label for="date_posted">Date Posted: ${ad.datePosted}</label>
                                    <input id="date_posted" type="hidden" name="date_posted" class="form-control-sm" value="${ad.datePosted}">
                                </div>
                                <input type="submit" class="btn btn-block btn-danger">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-3"></div>
            </div>
        </form>
    </div>
    <jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
