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
<%--<br>--%>
<%--<a href="/profile" class="btn btn-default btn-return">Return to Profile</a>--%>
<%--<div class="form-container">--%>
    <%--<div class="input-container">--%>
        <%--<form action="/ads/edit" method="POST">--%>
            <%--<div class="form-group">--%>
                <%--<label for="userId">User ID</label>--%>
                <%--<input id="userId" name="userId" class="form-control" type="text" value="${sessionScope.user.id}">--%>
            <%--</div>--%>
            <%--<div class="form-group">--%>
                <%--<label for="title">Title</label>--%>
                <%--<input id="title" name="title" class="form-control" type="text" value="${ad.title}">--%>
                <%--<c:if test="${'title'}">--%>
                    <%--<span class="errors">${'title'}</span>--%>
                <%--</c:if>--%>
            <%--</div>--%>
            <%--<div class="form-group">--%>
                <%--<label for="description">Description</label>--%>
                <%--<input id="description" name="description" class="form-control" type="text" value="${ad.description}">--%>
                <%--<c:if test="${'description'}">--%>
                    <%--<span class="errors">${'description'}</span>--%>
                <%--</c:if>--%>
            <%--</div>--%>
            <%--<input type="hidden" name="id" value="${Ad.id}">--%>
            <%--<input type="submit" class="btn btn-primary btn-block">--%>
        <%--</form>--%>
    <%--</div>--%>
<%--</div>--%>

<div style="width:900px; margin-left: auto; margin-right: auto">

    <c:forEach var="ad" items="${ads}">
        <form action="/ads/edit" method="post">
            Title: <br>
            <input type="text" name="title" style="width: 200px"><br>
            Description: <br>
            <input type="text" name="description" style="width: 200px"><br>
            <%--Category: <br>--%>
            <%--<select name="category">--%>
                <%--<option value="other">Other</option>--%>
                <%--<option value="antiques">Antiques</option>--%>
                <%--<option value="appliances">Appliances</option>--%>
                <%--<option value="arts">Arts & Crafts</option>--%>
                <%--<option value="automobile">Automobile</option>--%>
                <%--<option value="beauty">Beauty</option>--%>
                <%--<option value="children">Children</option>--%>
                <%--<option value="computers">Computers</option>--%>
                <%--<option value="electronics">Electronics</option>--%>
                <%--<option value="furniture">Furniture</option>--%>
                <%--<option value="garden">Garden</option>--%>
                <%--<option value="toys">Toys & Games</option>--%>
                <%--<option value="video">Video Games</option>--%>
                <%--<option value="pets">Pets</option>--%>

            <%--</select>--%>
            <br>
            Date Posted: <br>
            <input type="datetime-local" name="date" style="width: 200px"><br>
            <input type="submit" value="Submit">
        </form>



        <%--<div class="col-md-6">--%>
            <%--<tr><td>--%>
                <%--<h2>${ad.title}</h2>--%>
                <%--<p>${ad.description}</p>--%>
            <%--</td></tr>--%>
        <%--</div>--%>
    </c:forEach>

</div>




<script>
    function checkErrorMessages() {
        console.log(document.getElementsByClassName("errors"));
        if (document.getElementsByClassName("errors").length > 0) {
            document.getElementsByClassName("form-container")[0].style.height = "47%";
        }
    }
    window.onload = checkErrorMessages();
</script>
</body>
</html>
