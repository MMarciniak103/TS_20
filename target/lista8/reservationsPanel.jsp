<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Resrvations</title>
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
<body data-spy="scroll" id="ranking-body">
<div id="home-ranking">

    <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top" role="navigation">
        <a href="" class="navbar-brand"><i class="fas fa-h-square fa-3x"></i></a>
        <h1>Reservations</h1>
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div id="navbar" class="navbar-collapse collapse">
            <ul class="navbar-nav ml-auto ">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto ">
                <li class="nav-item">
                    <a class="nav-link" href="metrics.jsp">Metrics</a>
                </li>
            </ul>
        </div><!--/.navbar-collapse -->
    </nav>

</div>

<div class="landing">
    <div class="home-wrapper">
        <div class="home-inner ranking-img">
        </div>
    </div>
</div>

<div class="container justify-content-center text-center">
    <div class="table-responsive">
        <table class="ranking">
            <thead class="">
            <tr>
                <th scope="col">Fist Name</th>
                <th scope="col">Last Name</th>
                <th scope="col">Email</th>
                <th scope="col">Start Date</th>
                <th scope="col">End Date</th>
                <th scope="col">Room Type</th>
                <th scope="col">Price</th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="reservation" items="${reservations}">

                <c:url var="deleteLink" value="AdminServlet">
                    <c:param name="command" value="DELETE"></c:param>
                    <c:param name="reservationId" value="${reservation.getId()}"></c:param>
                </c:url>

                <tr>
                    <td>
                            ${reservation.getUser().getFirstName()}
                    </td>
                    <td>
                            ${reservation.getUser().getLastName()}
                    </td>
                    <td>
                            ${reservation.getUser().getEmail()}
                    </td>
                    <td>
                            ${reservation.getStartDate()}
                    </td>
                    <td>
                            ${reservation.getEndDate()}
                    </td>
                    <td>
                            ${reservation.getRoomType()}
                    </td>
                    <td>
                            ${reservation.getPrice()}
                    </td>
                    <td>
                    <a href="${deleteLink}"
                       onclick="if(!(confirm('Are you sure if you want to cancel reservation?'))) return false">
                        <button type="button" class="btn btn-danger">Cancel</button>
                    </a></td>
                </tr>
            </c:forEach>
            <%--            <tr>--%>
            <%--                <td>Mach</td>--%>
            <%--                <td>24</td>--%>
            <%--                <td>258 eur</td>--%>
            <%--                <td>5</td>--%>
            <%--            </tr>--%>
            <%--            <tr>--%>
            <%--                <td>Piuro'e</td>--%>
            <%--                <td>15</td>--%>
            <%--                <td>130 eur</td>--%>
            <%--                <td>5</td>--%>
            <%--            </tr>--%>
            <%--            <tr>--%>
            <%--                <td>Makre</td>--%>
            <%--                <td>42</td>--%>
            <%--                <td>103 eur</td>--%>
            <%--                <td>4.5</td>--%>
            <%--            </tr>--%>
            <%--            <tr>--%>
            <%--                <td>Pantel</td>--%>
            <%--                <td>32</td>--%>
            <%--                <td>100 eur</td>--%>
            <%--                <td>4.5</td>--%>
            <%--            </tr>--%>
            <%--            <tr>--%>
            <%--                <td>Bono</td>--%>
            <%--                <td>52</td>--%>
            <%--                <td>84 eur</td>--%>
            <%--                <td>4</td>--%>
            <%--            </tr>--%>
            <%--            <tr>--%>
            <%--                <td>Minu</td>--%>
            <%--                <td>20</td>--%>
            <%--                <td>59 eur</td>--%>
            <%--                <td>4</td>--%>
            <%--            </tr>--%>
            <%--            <tr>--%>
            <%--                <td>Baladyn</td>--%>
            <%--                <td>43</td>--%>
            <%--                <td>67 eur</td>--%>
            <%--                <td>3</td>--%>
            <%--            </tr>--%>
            <%--            <tr>--%>
            <%--                <td>Polinek</td>--%>
            <%--                <td>32</td>--%>
            <%--                <td>70 eur</td>--%>
            <%--                <td>3</td>--%>
            <%--            </tr>--%>
            <%--            <tr>--%>
            <%--                <td>Monopod</td>--%>
            <%--                <td>83</td>--%>
            <%--                <td>32 eur</td>--%>
            <%--                <td>2.5</td>--%>
            <%--            </tr>--%>
            </tbody>
        </table>
    </div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

<script src="bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<script src="https://use.fontawesome.com/releases/v5.5.0/js/all.js"></script>

</body>
</html>
