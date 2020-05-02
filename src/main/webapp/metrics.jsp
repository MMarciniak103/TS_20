<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Metryki</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap-4.1.3-dist/css/bootstrap.min.css">
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="css/form.css">
    <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
</head>
<body id="form-body">


<div class="container">
    <form action="MetricsServlet" method="post">

        <h1 class="text-center"> Metric data</h1>
        <div class="form-group text-center">
            <label>Mean price for a room</label>
            <input type="number" class="form-control text-center" name="roomMeanPrice">
        </div>

        <div class="form-group text-center">
            <label>Total number of rooms</label>
            <input type="text" class="form-control text-center" name="roomsCount">
        </div>

        <div class="form-group text-center">
            <label>Number of rooms occupied</label>
            <input type="text" class="form-control text-center" name="roomsOccupied">
        </div>

        <div class="form-group text-center">
            <label>Number of days analyzed</label>
            <input type="text" class="form-control text-center" name="daysCount">
        </div>

        <div class="form-group text-center">
            <label>Metric type</label>
            <select class="form-control text-center select picker" name="metricsList">
                <option>RevPAR</option>
                <option>TRevPAR</option>
                <option>RevPOR</option>
            </select>
        </div>
        <div class="text-center">
            <input class="btn btn-primary" type="submit" value="Send">
        </div>
    </form>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

<script src="bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<script src="https://use.fontawesome.com/releases/v5.5.0/js/all.js"></script>

</body>
</html>