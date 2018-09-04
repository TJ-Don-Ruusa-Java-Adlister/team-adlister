<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar sticky-top navbar-expand-md navbar-dark bg-dark">
    <a class="navbar-brand" href="/">BADLISTER</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <c:choose>
                <c:when test="${sessionScope.user != null}">
                    <%--<li class="nav-item"><a class="nav-link" href="/ads/create">Create an Ad</a></li>--%>
                    <%--<li class="nav-item"><a class="nav-link" href="/profile/update">Edit Profile</a></li>--%>
                    <%--<li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>--%>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-user" style="color: #ED0034;text-shadow: 1px 1px #2f1100;"></i>
                        ${sessionScope.user.username}
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="/profile">View Profile</a>
                            <a class="dropdown-item" href="/profile/update">Edit Profile</a>
                            <a class="dropdown-item" href="/ads/create">Create an Ad</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/logout">Logout</a>
                        </div>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item"><a class="nav-link" href="/register">Register</a></li>
                    <li class="nav-item"><a class="nav-link" href="/login">Login</a></li>
                </c:otherwise>
            </c:choose>
            <li class="nav-item"><a class="nav-link" href="/ads">View Ads</a></li>
        </ul>
        <form class="form-inline my-2 my-lg-0 ml-auto" action="/ads" method="POST">
            <div class="input-group">
                <div class="input-group-btn search-panel">
                    <button type="button" class="btn btn-outline-danger dropdown-toggle" data-toggle="dropdown">
                        <span id="search_category">All Categories</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li><a class="dropdown-item" href="#all">All Categories</a></li>
                        <li><a class="dropdown-item" href="#2">Antiques</a></li>
                        <li><a class="dropdown-item" href="#3">Appliances</a></li>
                        <li><a class="dropdown-item" href="#4">Arts and Craft</a></li>
                        <li><a class="dropdown-item" href="#5">Automobile</a></li>
                        <li><a class="dropdown-item" href="#6">Beauty</a></li>
                        <li><a class="dropdown-item" href="#7">Children</a></li>
                        <li><a class="dropdown-item" href="#8">Computers</a></li>
                        <li><a class="dropdown-item" href="#9">Electronics</a></li>
                        <li><a class="dropdown-item" href="#10">Furniture</a></li>
                        <li><a class="dropdown-item" href="#11">Garden</a></li>
                        <li><a class="dropdown-item" href="#14">Pets & Animals</a></li>
                        <li><a class="dropdown-item" href="#12">Toys and Games</a></li>
                        <li><a class="dropdown-item" href="#13">Video Games</a></li>
                        <li><a class="dropdown-item" href="#1">Other</a></li>
                    </ul>
                </div>
                <input type="hidden" name="category" value="all" id="search_param">
                <input type="text" class="form-control" name="search" placeholder="Search ads..." style="width: 350px;">
                <span class="input-group-btn">
                    <button class="btn btn-danger" type="submit"><span class="glyphicon glyphicon-search">Search</span></button>
                </span>
            </div>
        </form>
    </div>
</nav>
