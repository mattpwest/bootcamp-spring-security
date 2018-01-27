<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
        <h1>Publisher: ${publisher.longName}</h1>

        <c:if test="${filter != null}">
            <p>Filtered for: ${filter} <a href="<c:url value="/report/${publisher.id}"/>" class="btn btn-default btn-xs">Clear Filter</a></p>
        </c:if>

        <table class="table table-striped">
            <thead>
            <tr>
                <th>Name</th>
                <th>Gender</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${heroes}" var="hero">
                <tr>
                    <td>${hero.name}</td>
                    <td>${hero.gender}</td>
                    <td>
                        <form:form method="delete" action="/superheroes/${hero.id}">
                            <button value="submit" class="btn btn-xs btn-danger">Delete</button>
                        </form:form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <a href="<c:url value="/superheroes/add/${publisher.id}"/>" class="btn btn-primary">Add</a>
    </div>
</div>

</body>

</html>