<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login / Inbox Page</title>
    <%--<link rel="stylesheet" type="text/css" href="css/styles.css">--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <%--<script type="text/javascript" src="js/script.js" defer></script>--%>
</head>
<body>
<header>
    <jsp:include page="../include/header.jsp"/>
    <h1>Login / Inbox Page</h1>
    <br>
</header>
<main>
    <section>
        <h2>Your Inbox section</h2>
        <p>This is your Inbox section.</p>

        <h3>Welcome ${welcomeUserMessage}</h3>
    </section>
    <section>
        <sec:authorize access="hasAuthority('USER')">
            <h2>User has USER authorization.</h2>
            <a href="../index">---> Go to "index" Page</a>
            <br>
        </sec:authorize>
        <sec:authorize access="hasAuthority('ADMIN')">
            <h2>User has ADMIN authorization.</h2>
            <a href="../admin/protected">---> Go to "admin/protected" Page</a>
            <br>
        </sec:authorize>
    </section>
    <section>
        <br>
        <a href="logout">Logout</a>
    </section>
</main>
<footer>
    <br>
    <jsp:include page="../include/footer.jsp"/>
</footer>
</body>
</html>
