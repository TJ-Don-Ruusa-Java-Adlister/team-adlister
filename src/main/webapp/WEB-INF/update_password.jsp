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

        <div class="card text-center border-dark mx-auto" style="width: 60%;">
            <div class="card-header">
                <ul class="nav nav-tabs card-header-tabs">

                    <%--NEED TO WORK ON LINKS - GET CODE FOR GETADSBYUSER      --%>
                    <li class="nav-item">
                        <a class="nav-link title-link" href="/profile/update">Edit Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Change Password</a>
                    </li>
                    <%--<li class="nav-item">--%>
                    <%--<a class="nav-link" href="/ads">VIEW ALL ADS</a>--%>
                    <%--</li>--%>

                </ul>
            </div>
            <div class="card-body">
                <h5 class="card-title">
                    <br>
                    Password Change Form
                </h5>
                <p class="card-text">
                <form action="/profile/password" method="post">

                <input type="hidden" name="id" value="${sessionScope.user.id}">
                <input type="hidden" name="firstName" value="${sessionScope.user.firstName}">
                <input type="hidden" name="lastName" value="${sessionScope.user.lastName}">
                <input type="hidden" name="email" value="${sessionScope.user.email}">
                <input type="hidden" name="phoneNo" value="${sessionScope.user.phoneNo}">
                <input type="hidden" name="phoneNo" value="${sessionScope.user.tempPassword}">
                <table align="center" class="w-80">
                        <tr>
                            <td>New Password:  </td>
                            <td>
                                <input id="password" name="password" class="form-control" type="password" value="${sessionScope.user.password}" >
                            </td>
                        </tr>
                        <tr>
                            <td> Confirm your password:  </td>
                            <td>
                                <input id="confirm_password" name="confirm_password" class="form-control" type="password">
                            </td>
                        </tr>
                        <tr><td></td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                        <input type="submit" class="card-link btn btn-sm btn-danger" value="Submit">
                        <input type="submit" class="card-link btn btn-sm btn-secondary" value="Cancel">
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
