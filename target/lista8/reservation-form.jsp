<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Reservation</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap-4.1.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/metricPanel.css">
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="css/form.css">
    <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
</head>
<body id="form-body">


<div class="container">

    <c:if test="${error !=null}">
        <p class="error-label" style="color: red">${error}</p>
    </c:if>

    <form action="ReservationServlet" method="post">

        <h1 class="text-center"> Reservation data</h1>
        <div class="form-group text-center">
            <label>First Name:</label>
            <input type="text" class="form-control text-center" name="firstName">
        </div>

        <div class="form-group text-center">
            <label>Last Name:</label>
            <input type="text" class="form-control text-center" name="lastName">
        </div>

        <div class="form-group text-center">
            <label>Email:</label>
            <input type="text" class="form-control text-center" name="email">
        </div>

        <div class="form-group text-center">
            <label>Booking period</label>
            <br>
            <label>From:</label>
            <input type="date" class="date-input form-control text-center" name="dateFrom">
            <label>To:</label>
            <input type="date" class="date-input form-control text-center" name="dateTo">
        </div>

        <div class="form-group text-center">
            <label>Metric type</label>
            <select class="form-control text-center select picker" name="roomType">
                <option>Exclusive</option>
                <option>Normal</option>
                <option>Budget</option>
            </select>
        </div>
        <div class="text-center">
            <input class="btn btn-primary" type="submit" value="Send">
        </div>
    </form>

    <form action="AdminServlet" method="get">
    <div class="text-center">
        <input class="btn btn-primary" type="submit" value="Admin Panel">
    </div>
    </form>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.5.0/js/all.js"></script>
<%--<script src="${pageContext.request.contextPath}/js/main.js"></script>--%>
<%--<script>--%>
<%--    function loadAdminPanel() {--%>
<%--        $.ajax('AdminServlet', {--%>
<%--            type: 'GET'--%>
<%--        });--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>