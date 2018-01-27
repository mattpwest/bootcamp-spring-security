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

<img src="/images/banner_thin.jpg" class="banner"/>

<div class="container">
    <div class="row">
        <h1>Publishers Overview</h1>
    </div>

    <c:forEach items="${reports}" var="report">
    <div class="row">
        <div class="col-md-3">
            <h2>${report.publisher.longName}</h2>
        </div>

        <div class="col-md-2">
            <h2>${report.count} Heroes</h2>
        </div>
        <div class="col-md-2">
            <h2>
                <a href="<c:url value="/report/${report.publisher.id}"/>" class="btn btn-primary btn-filter">View All</a>
            </h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2 col-md-offset-3">
            <p>${report.female} Females</p>
        </div>
        <div class="col-md-2">
            <p><a href="<c:url value="/report/${report.publisher.id}/filter?gender=Female"/>" class="btn btn-xs btn-default btn-filter">View Females</a></p>
        </div>
    </div>

    <div class="row">
        <div class="col-md-2 col-md-offset-3">
            <p>${report.male} Males</p>
        </div>
        <div class="col-md-2">
            <p><a href="<c:url value="/report/${report.publisher.id}/filter?gender=Male"/>" class="btn btn-xs btn-default btn-filter">View Males</a></p>
        </div>
    </div>

    <div class="row">
        <div class="col-md-2 col-md-offset-3">
            <p>${report.other} Others</p>
        </div>
        <div class="col-md-2">
            <p><a href="<c:url value="/report/${report.publisher.id}/filter?gender=Other"/>" class="btn btn-xs btn-default btn-filter">View Others</a></p>
        </div>
    </div>
    </c:forEach>
</div>

</body>

</html>