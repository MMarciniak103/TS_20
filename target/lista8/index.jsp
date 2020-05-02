<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap-4.1.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
</head>
<body data-spy="scroll">
<div id="home">

    <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top" role="navigation">
        <a href="" class="navbar-brand"><i class="fas fa-h-square fa-3x"></i></a>
        <h1>Hotel ranking</h1>
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                aria-expanded="false" aria-controls="navbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div id="navbar" class="navbar-collapse collapse">
            <ul class="navbar-nav ml-auto ">
                <li class="nav-item">
                    <a class="nav-link" href="#home">Home</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto ">
                <li class="nav-item">
                    <a class="nav-link" href="ranking.jsp">Ranking</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto ">
                <li class="nav-item">
                    <a class="nav-link" href="reservation-form.jsp">Reservation</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto ">
                <li class="nav-item">
                    <a class="nav-link" href="#info">Info</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto ">
                <li class="nav-item">
                    <a class="nav-link" href="login-admin.jsp">Admin Login</a>
                </li>
            </ul>
        </div><!--/.navbar-collapse -->
    </nav>


    <div class="landing">
        <div class="home-wrap">
            <div class="home-inner">
            </div>
        </div>
    </div>

    <div id="top-info" class="text-center">
        <c:if test="${error !=null}">
            <p class="error-label" style="color: red">${error}</p>
        </c:if>
        <h1>Hotel ranking</h1>
        <p>One of the best rankings, that you can find, associated with hospitality industry</p>
        <a class="btn btn-outline-light btn-lg" href="ranking.jsp">Check ranking &raquo;</a>
    </div>
</div>


<div id="info" class="offset">
    <footer>
        <div class="row justify-content-center">
            <div class="col-md-5 text-center">
                <i class="fas fa-h-square fa-3x"></i>
                <h1> The ranking includes all officially recognized hotels</h1>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-5 text-center">
                <i class="far fa-star fa-2x"></i>
                <p>Updated based on monthly reports<br>
                    We have access for information about each hotel. Hotels are sorted by number of stars that
                    are awarded by specialized testers.</p>
                <i class="far fa-star fa-2x"></i>
                <p>The number of stars consists of the average of all ratings, price and location of the hotel.</p>
            </div>
        </div>
    </footer>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

<script src="bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<script src="https://use.fontawesome.com/releases/v5.5.0/js/all.js"></script>

</body>
</html>
