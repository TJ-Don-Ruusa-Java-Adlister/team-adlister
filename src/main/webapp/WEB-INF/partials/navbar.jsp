<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <form class="form-inline my-2 my-lg-0" action="/ads" method="POST">
            <input class="form-control mr-sm-2" type="search" name="search" placeholder="Search ads..." aria-label="Search" style="width: 500px;">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
