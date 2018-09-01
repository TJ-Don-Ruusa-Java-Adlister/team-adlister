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
                        <a class="nav-link active" href="#">Change Password</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/profile/update">Edit Profile</a>
                    </li>
                    <%--<li class="nav-item">--%>
                    <%--<a class="nav-link" href="/ads">VIEW ALL ADS</a>--%>
                    <%--</li>--%>

                </ul>
            </div>
            <div class="card-body">
                <h5 class="card-title">
                    Welcome, ${sessionScope.user.firstName} !
                    <br>
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
