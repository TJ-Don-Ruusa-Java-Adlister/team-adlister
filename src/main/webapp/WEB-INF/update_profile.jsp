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

<%--<jsp:include page="../WEB-INF/partials/navbar.jsp" />--%>

<%
    String id=request.getParameter("id");
    User user= DaoFactory.getUsersDao().getUserById(id);
%>
<div class="container">


    <div class="card text-center border-dark" style="width: 80%;">
        <div class="card-header">
            <ul class="nav nav-tabs card-header-tabs">

                <%--NEED TO WORK ON LINKS - GET CODE FOR GETADSBYUSER      --%>
                <li class="nav-item">
                    <a class="nav-link active" href="#">Edit Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/myads">VIEW MY ADS</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/ads">VIEW ALL ADS</a>
                </li>

            </ul>
        </div>
        <div class="card-body">
            <h5 class="card-title">
                Welcome, ${sessionScope.user.firstName} !
                <br>
                <br>
                Edit Form
            </h5>
            <p class="card-text">
            <form action="/profile/update" method="post">


                <input type="hidden" name="id" value="${sessionScope.user.id}"/>

                <table align="center">
                    <tr>
                        <td>Full Name</td>
                        <td>
                            <input type="hidden" name="firstName" value="${sessionScope.user.firstName}"/>
                            <input type="hidden" name="lastName" value="${sessionScope.user.lastName}"/>

                            <h1>${sessionScope.user.firstName} ${sessionScope.user.lastName}</h1>
                        </td>
                    </tr>
                    <tr>
                        <td>Username</td>
                        <td>
                            <input id="username" name="username" class="form-control" type="text" value="${sessionScope.user.username}">
                        </td>
                    </tr>

                    <tr>
                        <td>Email</td>
                        <td>
                            <input id="email" name="email" class="form-control" type="text" value="${sessionScope.user.email}">
                        </td>
                    </tr>
                    <tr>
                        <td>Phone</td>
                        <td>
                            <input id="phoneNo" name="phoneNo" class="form-control" type="text" value="${sessionScope.user.phoneNo}">
                        </td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td>
                            <input id="password" name="password" class="form-control" type="password" value="${sessionScope.user.password}" >
                        </td>
                    </tr>
                    <tr>
                        <td> Confirm your password </td>
                        <td>
                            <input id="confirm_password" name="confirm_password" class="form-control" type="password">
                        </td>
                    </tr>
                    <tr><td></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" class="card-link" value="update"> </input>
                        </td>
                        <td>
                            <input type="submit" class="card-link" value="reset"> </input>
                        </td>

                    </tr>
                </table>
            </form>
        </div>
    </div>








</div>
</body>
</html>