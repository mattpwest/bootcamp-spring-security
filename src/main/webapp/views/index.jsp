<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

<head>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <link rel="stylesheet" href="/css/styles.css">

    <!-- Latest compiled and minified JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>

<body>

<%@ include file="nav.jspf"%>

<img src="/images/banner.jpg" class="banner"/>

<div class="container">
    <div class="row">
        <div class="col-md-8">
            <h1>Welcome to Comic Report!</h1>

            <p>
                Your daily source for all the greatest comic book statistics and analysis.
            </p>
        </div>

        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading"><h3>Buy Comics At 25% Off</h3></div>
                <div class="panel-body">
                    Help keep this site free by buying your comics from these sponsored links at a 25% discount:

                    <ul>
                        <li><a href="#">Comic Stock</a></li>
                        <li><a href="#">Outer Limits</a></li>
                        <li><a href="#">Wizards Comics</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>