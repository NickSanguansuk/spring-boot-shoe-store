<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login / Inbox Page</title>
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <%--<link rel="stylesheet" type="text/css" href="css/styles.css">--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/styles-login-inbox.css">
    <!-- JavaScript -->
    <%--<script type="text/javascript" src="js/script.js" defer></script>--%>
</head>
<body>
<header>
    <jsp:include page="../include/header.jsp"/>
    <%--<h1>Login / Inbox Page</h1>--%>
    <%--<br>--%>
</header>
<main>
    <section class="bg-light text-dark p-4 text-center my-section-container">
        <div class="container text-start">

            <div class="text-start">
                <h2 class="fs-5"><b>Your account: </b></h2>
            </div>
            <hr>

            <div class="row g-5 my-0">
                <div class="col-md-8">
                    <p class="fs-5"><b>Welcome, </b>${welcomeUserMessage}</p>
                    <p class="fs-6"><b>Account type: </b>${accountType}</p>
                </div>
                <div class="col-md-2">
                    <sec:authorize access="hasAuthority('USER')">
                        <a href="/login/edit-info" class="btn btn-primary btn-md active" role="button"
                           aria-pressed="true">
                            Edit User Information
                        </a>
                    </sec:authorize>
                </div>
                <div class="col-md-2">
                    <sec:authorize access="hasAuthority('ADMIN')">
                        <a href="/admin/protected" class="btn btn-primary btn-md active" role="button"
                           aria-pressed="true">
                            Go to Admin Page
                        </a>
                    </sec:authorize>
                </div>
            </div>

            <hr>

            <div class="row g-5 my-2">
                <div class="col-md-12">
                    <p class="fs-5"><b>Order History</b></p>
                </div>
                <div class="col-md-12">

                </div>
                <div class="col-md-12">

                </div>
            </div>

        </div>
    </section>
    <%--<section>--%>
    <%--    <sec:authorize access="hasAuthority('USER')">--%>
    <%--        <h2>User has USER authorization.</h2>--%>
    <%--        <a href="/index">---> Go to "index" Page</a>--%>
    <%--        <br>--%>
    <%--    </sec:authorize>--%>
    <%--    <sec:authorize access="hasAuthority('ADMIN')">--%>
    <%--        <h2>User has ADMIN authorization.</h2>--%>
    <%--        <a href="/admin/protected">---> Go to "admin/protected" Page</a>--%>
    <%--        <br>--%>
    <%--    </sec:authorize>--%>
    <%--</section>--%>
    <%--<section>--%>
    <%--    <br>--%>
    <%--    <a href="/login/logout">Logout</a>--%>
    <%--</section>--%>
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
