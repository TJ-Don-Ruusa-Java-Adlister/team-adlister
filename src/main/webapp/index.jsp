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
    <div class="parallax">

        <div class="banner">
            <div class="text text-center">
                <h1>WELCOME TO BADLISTER</h1>
                <h3>Look no further and let us help you find all the horrible ads around the globe!</h3>
            </div>
        </div>


    </div>

    <div class="container pt-4">
        <div class="row">
            <div class="col-md-6">
                <p>
                    Start viewing our ads by our users around the world!
                </p>
                <div>
                    <form action="/ads">
                        <input type="submit" value="View Ads" />
                    </form>
                </div>
            </div>
            <div class="col-md-6" id="register">
                <p>
                    Want to make and post your ad here?
                    <br>
                    Getting started is never been easier!
                    <br>
                    Sign up now to start making your ads today!
                </p>
                <div>
                    <form action="/register">
                        <input type="submit" value="Register" />
                    </form>
                </div>
                <div>
                    <p>
                        Already a member with us?<br>
                        Login in now to continue your work!
                    </p>
                    <form action="/login">
                        <input type="submit" value="Login" />
                    </form>
                </div>
            </div>
        </div>

    </div>
</body>
</html>
