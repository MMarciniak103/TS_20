<%--
  Created by IntelliJ IDEA.
  User: Michał
  Date: 2020-04-08
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Metric score</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap-4.1.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/metricPanel.css">
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>

</head>
<body class="text-center">


<div class="info-container">
    <c:if test="${error !=null}">
        <p class="error-label">${error}</p>
    </c:if>

    <h1>Reservation Info</h1>
    <p class="score-text">Fist Name : ${reservationData.user.getFirstName()}</p>
    <p class="score-text">Last Name : ${reservationData.user.getLastName()}</p>
    <p class="score-text">Email : ${reservationData.user.getEmail()}</p>
    <p class="score-text">From : ${reservationData.getStartDate()}</p>
    <p class="score-text">To : ${reservationData.getEndDate()}</p>
    <p class="score-text">Room Type : ${reservationData.getRoomType()}</p>
    <p class="score-text">Price : ${reservationData.getPrice()}</p>
    <br>
    <p class="score-text session-text">Session total price: ${totalPrice}</p>

</div>

<div class="btn-container">
    <div >
        <a class="btn btn-outline-light btn-lg " href="reservation-form.jsp">Go Back</a>
    </div>
    <div>
        <a class="btn btn-outline-light btn-lg" href="ranking.jsp">Ranking</a>
    </div>
    <div>
        <a class="btn btn-outline-light btn-lg" href="index.jsp">Home</a>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

<script src="bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<script src="https://use.fontawesome.com/releases/v5.5.0/js/all.js"></script>

</body>
</html>
