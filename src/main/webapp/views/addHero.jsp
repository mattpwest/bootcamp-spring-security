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
        <h2>Add Hero</h2>

        <form:form method="post" action="/superheroes/add/${publisher.id}" modelAttribute="form">
            <div class="form-group">
                <label for="name">Name</label>
                <form:input path="name" cssClass="form-control" id="name"/>
            </div>

            <div class="form-group">
                <label for="gender">Gender</label><br/>
                <c:forEach var="gender" items="${genders}">
                    <label>
                        <form:radiobutton id="gender" path="gender" value="${gender}" />
                        ${gender.name()}
                    </label></br>
                </c:forEach>
            </div>

            <c:if test="${hasErrors}">
            <div class="form-group">
                <div class="alert alert-danger" role="alert">
                    <form:errors path="*"/>
                </div>
            </div>
            </c:if>

            <button type="submit" class="btn btn-primary">Save</button>
        </form:form>
    </div>
</div>

</body>

</html>