<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error 403 Page</title>
    <%--<link rel="stylesheet" type="text/css" href="css/styles.css">--%>
    <%--<script type="text/javascript" src="js/script.js" defer></script>--%>
</head>
<body>
<header>
    <h1>Error - 403 FORBIDDEN</h1>
</header>
<main>
    <section>
        <c:if test="${not empty message}">
            <p>${message}</p>
        </c:if>
        <c:if test="${not empty stackTrace}">
            <br/>
            <p>${stackTrace}</p>
        </c:if>
    </section>
    <section>
        <br>
        <a href="/">Go to Home Page</a>
        <br>
    </section>
</main>
<footer>

</footer>
</body>
</html>