<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.apache.*" %>

<html>

<head>

    <jsp:include page="../WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>

    <jsp:include page="../WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Welcome, ${sessionScope.user.first_name} ! </h1>
        Your user ID is ${sessionScope.user.id}. <br>
        <h1>Please fill in your information.</h1>
        <form action="/profile/update" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text" value="${sessionScope.user.username}">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" type="text" value="${sessionScope.user.email}" placeholder="e.g. mary@mary.com">
            </div>
            <label for="phone_no">Phone Number</label>
            <input id="phone_no" name="phone_no" class="form-control" type="text" value="${sessionScope.user.phone_no}" placeholder="e.g. 555-555-5555">

            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password" value="${sessionScope.user.password}" >
            </div>
            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password">
            </div>
            <input type="submit" class="btn btn-primary btn-block">
        </form>
    </div>
</body>
</html>
