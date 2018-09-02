<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.apache.*" %>
<%@ page import="com.codeup.adlister.models.User" %>
<%@ page import="com.codeup.adlister.dao.MySQLUsersDao" %>
<%@ page import="com.codeup.adlister.dao.DaoFactory" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>

<html>

<head>

    <jsp:include page="../WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>

<jsp:include page="../WEB-INF/partials/navbar.jsp" />

<%
    String id=request.getParameter("id");
    User user= DaoFactory.getUsersDao().getUserById(id);
%>
<div class="container">

    <div class="row mt-4 py-2">
        <div class="col-1 mr-3">
            <i class="fas fa-user-edit fa-4x" style="color: #696969;"></i>
        </div>
        <div class="col">
            <h1>Update your Profile</h1>
        </div>
    </div>
    <hr>

<div class="row"></div>
    <div class="card text-center border-dark mx-auto" style="width: 60%;">
        <div class="card-header">
            <ul class="nav nav-tabs card-header-tabs">

                <li class="nav-item">
                    <a class="nav-link active" href="#">Edit Profile</a>
                </li>
                <li class="nav-item">
                    <a class="title-link nav-link" href="/profile/password">Change my Password</a>
                </li>


            </ul>
        </div>
        <div class="card-body">
            <h5 class="card-title">
                <br>
                Profile Info Form
            </h5>
            <p class="card-text">
            <form action="/profile/update" method="post">

                <input type="hidden" name="id" value="${sessionScope.user.id}"/>
                <input type="hidden" name="password" value="${sessionScope.user.password}">
                <input type="hidden" name="firstName" value="${sessionScope.user.firstName}"/>
                <input type="hidden" name="lastName" value="${sessionScope.user.lastName}"/>

                <table align="center" class="w-80">
                    <tr>
                        <td>Full Name: </td>
                        <td>  ${sessionScope.user.firstName} ${sessionScope.user.lastName}</td>
                    </tr>
                    <tr>
                        <td>Username: </td>
                        <td>
                            <input id="username" name="username" class="form-control" type="text" value="${sessionScope.user.username}">
                        </td>
                    </tr>

                    <tr>
                        <td>Email: </td>
                        <td>
                            <input id="email" name="email" class="form-control" type="text" value="${sessionScope.user.email}">
                        </td>
                    </tr>
                    <tr>
                        <td>Phone Number: </td>
                        <td>
                            <input id="phoneNo" name="phoneNo" class="form-control" type="text" value="${sessionScope.user.phoneNo}">
                        </td>
                    </tr>

                    <tr>
                        <td>
                        </td>
                        <td>
                        </td>

                    </tr>
                </table>
                <input type="submit" class="card-link btn btn-danger btn-sm" value="Submit"> </input>
                <a href="/profile" class="card-link btn btn-secondary btn-sm">Cancel</a>
            </form>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>