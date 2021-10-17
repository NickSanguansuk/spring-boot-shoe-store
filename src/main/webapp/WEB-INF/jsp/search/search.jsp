<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search / Search Page</title>
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <%--<link rel="stylesheet" type="text/css" href="css/styles.css">--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/styles-search-search.css">
    <!-- JavaScript -->
    <%--<script type="text/javascript" src="js/script.js" defer></script>--%>
</head>
<body>
<header>
    <jsp:include page="../include/header.jsp"/>
    <%--<h1>Search / Search Page</h1>--%>
    <%--<br>--%>
</header>
<main>
    <section>
        <h2>Search bar</h2>
        <p>This is the Search bar.</p>

        <form>
            <label>
                Search (for email):
                <input type="text" name="searchText" value="${searchText}">
                <input type="submit" name="submit" value="Submit">
            </label>
        </form>
        <br>
        <c:choose>
            <c:when test="${empty searchText}">
                <h3>No search parameter.</h3>
            </c:when>
            <c:when test="${not empty searchText and empty users}">
                <h3>No results found.</h3>
            </c:when>
            <c:otherwise>
                <%--<table border="1" cellpadding="3">--%>
                <table class="my-search-result-table">
                    <tr>
                        <th><b>ID</b></th>
                        <th><b>First Name</b></th>
                        <th><b>Last Name</b></th>
                        <th><b>Email</b></th>
                        <th><b>Password</b></th>
                        <th><b>Phone</b></th>
                        <th><b>Address</b></th>
                        <th><b>City</b></th>
                        <th><b>State</b></th>
                        <th><b>Zip Code</b></th>
                        <th><b>Roles</b></th>
                    </tr>

                    <c:forEach items="${users}" var="user">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <td>${user.email}</td>
                            <td>${user.password}</td>
                            <td>${user.phone}</td>
                            <td>${user.address}</td>
                            <td>${user.city}</td>
                            <td>${user.state}</td>
                            <td>${user.zipCode}</td>
                            <td>${user.userRoles}</td>
                            <td><a href="/search/detail?id=${user.id}">Details</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
    </section>
    <section>
        <h2>Search for Products</h2>
        <p>These are the products you looking for.</p>


    </section>
</main>
<footer>
    <%--<br>--%>
    <jsp:include page="../include/footer.jsp"/>
</footer>
<!-- JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
