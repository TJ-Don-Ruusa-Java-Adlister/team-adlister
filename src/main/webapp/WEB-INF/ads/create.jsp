<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
    <%--////////adding user ID--%>
    <div style="text-align: center; margin-top: 50px">
        <h1>New Ad for ${sessionScope.user.firstName}</h1>
    </div>
    <form action="/ads/create" method="post">
        <div class="form-group">
            <br>
            <hr>
            <div class="row">
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">
                                <label >Check a box to select a category for your ad. You may select up to 3 categories.</label>
                            </h5>
                            <ul class="list-unstyled card-text" >
                                <li >
                                    <label style="width: 200px" class="checkbox-inline"><input type="checkbox" name="category" value="2"> Antiques</label>
                                    <label style="width: 200px" class="checkbox-inline"><input type="checkbox" name="category" value="3"> Appliances</label>
                                    <label style="width: 200px" class="checkbox-inline"><input type="checkbox" name="category" value="4"> Arts & Crafts</label>
                                    <label style="width: 200px" class="checkbox-inline"><input type="checkbox" name="category" value="5"> Automobile</label>
                                    <label style="width: 200px" class="checkbox-inline"><input type="checkbox" name="category" value="6"> Beauty</label>
                                    <label style="width: 200px" class="checkbox-inline"><input type="checkbox" name="category" value="7"> Children</label>
                                    <label style="width: 200px" class="checkbox-inline"><input type="checkbox" name="category" value="8"> Computers</label>


                                    <label style="width: 200px" class="checkbox-inline"><input type="checkbox" name="category" value="9"> Electronics</label>
                                    <label style="width: 200px" class="checkbox-inline"><input type="checkbox" name="category" value="10"> Furniture</label>
                                    <label style="width: 200px" class="checkbox-inline"><input type="checkbox" name="category" value="11"> Garden</label>
                                    <label style="width: 200px" class="checkbox-inline"><input type="checkbox" name="category" value="12"> Toys & Games</label>
                                    <label style="width: 200px" class="checkbox-inline"><input type="checkbox" name="category" value="13"> Video Games</label>
                                    <label style="width: 200px" class="checkbox-inline"><input type="checkbox" name="category" value="14"> Pets</label>
                                    <label style="width: 200px" class="checkbox-inline"><input type="checkbox" name="category" value="1"> Other</label>
                                </li>

                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Create your ad here.</h5>
                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                            <div class="form-group">
                                <label for="title">Title</label>
                                <input id="title" name="title" class="form-control" type="text">
                            </div>
                            <div class="form-group">
                                <label for="description">Description</label>
                                <textarea id="description" name="description" class="form-control" type="text"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="date_posted">Date Posted</label>
                                <input id="date_posted" name="date_posted" class="form-control-sm" type="text"/>
                            </div>
                            <input type="submit" class="btn btn-block btn-primary">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
    <jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
