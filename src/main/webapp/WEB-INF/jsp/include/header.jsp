<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header Page</title>
    <%--<link rel="stylesheet" type="text/css" href="css/styles.css">--%>
    <%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css">--%>
    <%--<script type="text/javascript" src="js/script.js" defer></script>--%>
</head>
<body>
<header>

</header>
<main>
    <section>
        <h2>Header Page Topic</h2>
        <p>This is the Header Page.</p>
        <nav role="navigation" aria-label="Main Menu">
            <ul class="nav-bar">
                <li><a href="/">Home</a></li>
                <li><a href="/">Men</a></li>
                <li><a href="/">Women</a></li>
                <li><a href="/">Kids</a></li>
                <li><a href="/">Contact Us</a></li>
            </ul>
            <form>
                <input type="search" name="search-bar" placeholder="Search for your favorite shoes">
                <input type="submit" name="submit" value="Go!">
            </form>
        </nav>
    </section>
</main>
<footer>

</footer>
</body>
</html>
