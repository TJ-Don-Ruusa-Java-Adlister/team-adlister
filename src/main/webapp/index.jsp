<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="jumbotron jumbotron-fluid parallax">
        <div class="container-fluid banner">
            <div class="text text-center">
                <h1>Welcome to <span class="logo-text">BADLISTER</span></h1>
                <h3>Look no further and let us help you find all the horrible ads around the globe!</h3>
            </div>
        </div>
    </div>

    <div class="container pt-4">
        <div class="card-group my-4">
            <div class="card text-center">
                <i class=" my-3 far fa-list-alt fa-7x card-img-top" style="color: #696969;"></i>
                <div class="card-body">
                    <h4 class="card-title">View Ads</h4>
                    <p class="card-text">Click the button to enter our ad catelog!</p>
                    <a href="/ads" class="btn btn-danger mx-auto">Go to Ads</a>
                </div>
            </div>
            <div class="card text-center">
                <i class=" my-3 fas fa-user-plus fa-7x card-img-top" style="color: #696969;"></i>
                <div class="card-body">
                    <h4 class="card-title">Register</h4>
                    <p class="card-text">Have a useless item you need out of your garage? Want to post an ad for it? Register for a FREE account by clicking the button!</p>
                    <a href="/register" class="btn btn-danger mx-auto">Register</a>
                </div>
            </div>
            <div class="card text-center">
                <i class=" my-3 far fa-keyboard fa-7x card-img-top" style="color: #696969;"></i>
                <div class="card-body">
                    <h4 class="card-title">Login</h4>
                    <p class="card-text">Already have an account? Click the button to login!</p>
                    <a href="/login" class="btn btn-danger mx-auto">Login</a>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
