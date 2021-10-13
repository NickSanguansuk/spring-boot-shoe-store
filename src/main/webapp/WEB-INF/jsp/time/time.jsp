<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Time / (Time, Time-Submit) Page</title>
    <%--<link rel="stylesheet" type="text/css" href="css/styles.css">--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <%--<script type="text/javascript" src="js/script.js" defer></script>--%>
</head>
<body>
<header>
    <jsp:include page="../include/header.jsp"/>
    <h1>Time / (Time, Time-Submit) Page</h1>
    <br>
</header>
<main>
    <section>
        <h2>Time form</h2>
        <p>This is the Time form.</p>

        <form action="time-submit" method="get">
            <label>
                Full Date:
                <input type="text" name="fullDate">
                <br>
                Start Time:
                <input type="text" name="startTime">
                <br>
                End Time:
                <input type="text" name="endTime">
                <br>
                <input type="submit" name="submit" value="Submit">
            </label>
        </form>
    </section>
    <section>
        <h2>Submitted Time</h2>
        <table>
            <tr>
                <td>DateTime Start:</td>
                <td>${dateTimeStartDisplay}</td>
            </tr>
            <tr>
                <td>DateTime End:</td>
                <td>${dateTimeEndDisplay}</td>
            </tr>
        </table>
    </section>
</main>
<footer>
    <br>
    <jsp:include page="../include/footer.jsp"/>
</footer>
</body>
</html>
