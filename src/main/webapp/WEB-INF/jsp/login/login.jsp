<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login / Login Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <%--<link rel="stylesheet" type="text/css" href="css/styles.css">--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <%--<script type="text/javascript" src="js/script.js" defer></script>--%>
</head>
<body>
<header>
    <jsp:include page="../include/header.jsp"/>
    <%--<h1>Login Page</h1>--%>
    <%--<br>--%>
</header>
<main>
    <section>
        <h2>Login form</h2>
        <p>This is the Login form.</p>

        <%--<form method="post" action="login">--%>
        <form method="post" action="/login/j_security_check">
            <c:if test="${error}">
                <div style="color:red">Sign In Failed: Invalid username or password.</div>
            </c:if>

            <c:if test="${not empty loginMessage}">
                <span style='color:red'>${loginMessage}</span>
                <br>
            </c:if>
            <hr>

            <label>
                Username:
                <input type="text" name="username" value="" required>
            </label>
            <br>

            <label>
                Password:
                <input type="password" name="password" value="" required>
            </label>
            <br>

            <input type="submit" name="login" value="Login">
        </form>
    </section>
</main>
<footer>
    <br>
    <jsp:include page="../include/footer.jsp"/>
</footer>
<!-- Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
