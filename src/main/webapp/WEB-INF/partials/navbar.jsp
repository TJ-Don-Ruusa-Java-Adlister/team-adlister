<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<nav class="navbar navbar-light bg-light">--%>
    <%--<div class="container-fluid">--%>
        <%--<!-- Brand and toggle get grouped for better mobile display -->--%>
        <%--<div class="navbar-header">--%>
            <%--<a class="navbar-brand" href="/ads">Badlister</a>--%>
        <%--</div>--%>
        <%--<form class="form-inline mr-auto pt-2" action="/ads" method="POST">--%>
            <%--<input class="form-control mr-sm-2" style="width: 500px !important;"  type="search" placeholder="Search Ads..." aria-label="Search" name="search">--%>
            <%--<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
        <%--</form>--%>
        <%--<c:choose>--%>
            <%--<c:when test="${sessionScope.user != null}">--%>
                <%--<a class="nav-item nav-link" href="/ads/create">Create an Ad</a>--%>
                <%--<a class="nav-item nav-link" href="/profile">Profile</a>--%>
                <%--<a class="nav-item nav-link" href="/logout">Logout</a>--%>
            <%--</c:when>--%>
            <%--<c:otherwise>--%>
                <%--<a class="nav-item nav-link" href="/register">Register</a>--%>
                <%--<a class="nav-item nav-link" href="/login">Login</a>--%>
            <%--</c:otherwise>--%>
        <%--</c:choose>--%>
    <%--</div>--%>
<%--</nav>--%>

<nav class="navbar navbar-expand-md navbar-light bg-light">
    <a class="navbar-brand" href="#">Badlister</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <c:choose>
                <c:when test="${sessionScope.user != null}">
                    <li class="nav-item"><a class="nav-link" href="/ads/create">Create an Ad</a></li>
                    <li class="nav-item"><a class="nav-link" href="/profile">Profile</a></li>
                    <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item"><a class="nav-link" href="/register">Register</a></li>
                    <li class="nav-item"><a class="nav-link" href="/login">Login</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search ads..." aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
