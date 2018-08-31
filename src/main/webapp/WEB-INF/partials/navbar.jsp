<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar fixed-top navbar-expand-md navbar-light bg-light">
    <a class="navbar-brand" href="/">Badlister</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item"><a class="nav-link" href="/ads">View Ads</a></li>
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
            <div class="input-group">
                <div class="input-group-btn search-panel">
                    <button type="button" class="btn btn-outline-success dropdown-toggle" data-toggle="dropdown">
                        <span id="search_category">All Categories</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li><a class="badge badge-light" href="#all">All Categories</a></li>
                        <li><a class="badge badge-light" href="#2">Antiques</a></li>
                        <li><a class="badge badge-light" href="#3">Appliances</a></li>
                        <li><a class="badge badge-light" href="#4">Arts and Craft</a></li>
                        <li><a class="badge badge-light" href="#5">Automobile</a></li>
                        <li><a class="badge badge-light" href="#6">Beauty</a></li>
                        <li><a class="badge badge-light" href="#7">Children</a></li>
                        <li><a class="badge badge-light" href="#8">Computers</a></li>
                        <li><a class="badge badge-light" href="#9">Electronics</a></li>
                        <li><a class="badge badge-light" href="#10">Furniture</a></li>
                        <li><a class="badge badge-light" href="#11">Garden</a></li>
                        <li><a class="badge badge-light" href="#14">Pets & Animals</a></li>
                        <li><a class="badge badge-light" href="#12">Toys and Games</a></li>
                        <li><a class="badge badge-light" href="#13">Video Games</a></li>
                        <li><a class="badge badge-light" href="#1">Other</a></li>
                    </ul>
                </div>
                <input type="hidden" name="category" value="all" id="search_param">
                <input type="text" class="form-control" name="search" placeholder="Search ads..." style="width: 500px;">
                <span class="input-group-btn">
                    <button class="btn btn-success" type="submit"><span class="glyphicon glyphicon-search">Search</span></button>
                </span>
            </div>
        </form>
    </div>
</nav>
