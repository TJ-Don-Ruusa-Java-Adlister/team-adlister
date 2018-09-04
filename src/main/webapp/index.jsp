<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Home | Badlister" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="jumbotron jumbotron-fluid parallax">
        <div class="container-fluid banner">
            <div class="text text-center">
                <h1>Welcome to <span class="logo-text">BADLISTER</span></h1>
                <p>The premier selling platform for finally parting with that ceramic hippo you got for Christmas.</p>
            </div>
        </div>
    </div>

    <div class="container pt-1 my-5">
        <div class="card-group">
            <div class="card text-center">
                <i class=" my-3 far fa-list-alt fa-7x card-img-top" style="color: #696969;"></i>
                <div class="card-body">
                    <a href="/ads" class="btn btn-danger btn-lg mx-auto mb-3">Go to Ads</a>
                    <p class="card-text">Click the button to enter our ad catelog!</p>
                </div>
            </div>
            <div class="card text-center">
                <i class=" my-3 fas fa-user-plus fa-7x card-img-top" style="color: #696969;"></i>
                <div class="card-body">
                    <a href="/register" class="btn btn-danger btn-lg mx-auto mb-3">Register</a>
                    <p class="card-text">Have a useless item you need out of your garage? Want to post an ad for it? Register for a FREE account by clicking the button!</p>
                </div>
            </div>
            <div class="card text-center">
                <i class=" my-3 far fa-keyboard fa-7x card-img-top" style="color: #696969;"></i>
                <div class="card-body">
                    <a href="/login" class="btn btn-danger btn-lg mx-auto mb-3">Login</a>
                    <p class="card-text">Already have an account? Click the button to login!</p>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid mt-5" style="background-color: #2b2b2b">
        <div class="row">
            <div class="col-12">
                <h2 class="text-center pt-4" style="color: white;">
                    <i class="fas fa-quote-left fa-3x mx-4" style="color: white;"></i>
                    See what our users are saying!
                    <i class="fas fa-quote-right fa-3x mx-4" style="color: white;"></i>
                </h2>
            </div>
        </div>
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active p-4">
                    <h5>Bob Bobberson said:</h5>
                    <blockquote class="blockquote">"I was amazed at how quickly I was able to sell my FisherPrice piano! Would highly recommend using Badlister."</blockquote>
                </div>
                <div class="carousel-item p-4">
                    <h5>John Smitherson said:</h5>
                    <blockquote class="blockquote">"Clearing out my parents' garage has never been easier!"</blockquote>
                </div>
                <div class="carousel-item p-4">
                    <h5>Larry Cucumberson said:</h5>
                    <blockquote class="blockquote">"Whenever I need a new hairbrush, I just log on to my Badlister profile and find one!"</blockquote>
                </div>
                <div class="carousel-item p-4">
                    <h5>Bruce Waynerson said:</h5>
                    <blockquote class="blockquote">"I was in need of replacement parents. Badlister came through!"</blockquote>
                </div>
                <div class="carousel-item p-4">
                    <h5>Lydia Englisherson said:</h5>
                    <blockquote class="blockquote">"Badlister gave me a wonderful husband! 5/5."</blockquote>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <hr>
                <hr>
                <h1 class="my-4 text-center">Meet the Developers</h1>
                <hr>
                <hr>
            </div>
        </div>
        <div class="card-group mt-3 mb-5 dev-profiles">
            <div class="card text-center">
                <div class="card-img-top">
                    <img src="images/DonPho.jpg" class="rounded-circle" alt="">
                </div>
                <div class="card-body">
                    <h4 class="card-title">Don Pho</h4>
                    <p class="dev-desc">My experience in the fast food industry has prepared me to quickly adapt to many situation and become a supportive team-player with my quick-thinking and responsiveness. As I got exposed to more software languages, I was able to understand the fundamentals of the language and at the same time, make time to read a book without compromising the task at hand.</p>
                    <br>
                </div>
                <div class="card-footer">
                    <a href="https://www.linkedin.com/in/donpho/" class="btn btn-outline-danger mx-auto">Contact</a>
                </div>
            </div>
            <div class="card text-center">
                <div class="card-img-top">
                    <img src="images/RuusaBolton.jpg" class="rounded-circle" alt="">
                </div>
                <div class="card-body">
                    <h4 class="card-title">Ruusa Bolton</h4>
                    <p class="dev-desc">In my travels I have come across a common theme - the need for information and how that information is shared. It is inherent in us as people to want to know - I want to be part of spreading the message through the artistry of web development. I am excited to see where this leg of the journey takes me.</p>
                    <br>
                </div>
                <div class="card-footer">
                    <a href="https://www.linkedin.com/in/ruusapbolton/" class="btn btn-outline-danger mx-auto">Contact</a>
                </div>
            </div>
            <div class="card text-center">
                <div class="card-img-top">
                    <img src="images/TJEnglish.jpg" class="rounded-circle" alt="">
                </div>
                <div class="card-body">
                    <h4 class="card-title">TJ English</h4>
                    <p class="dev-desc">I am a purpose-driven developer with an ever-expanding fascination for creating something from nothing. As a former microbiologist, I have grown in my ability to thrive in a team environment, and I have cultivated effective analytical & problem-solving skills. My desire is to contribute to a team that addresses a real problem by providing a real solution.</p>
                    <br>
                </div>
                <div class="card-footer">
                    <a href="https://www.linkedin.com/in/tenglishjr/" class="btn btn-outline-danger mx-auto">Contact</a>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
