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
    <section class="fixed-top">
        <nav class="navbar navbar-expand-md bg-dark navbar-dark pb-1 my-navbar-1">
            <div class="container-fluid">
                <a class="navbar-brand pt-0 pb-0" href="/index">
                    <img class="d-inline-block align-middle img-fluid rounded-3"
                         src="${pageContext.request.contextPath}/resources/images/logo/feetfirst4.jpg"
                         alt="FeetFirst Logo" width="220" height="40">
                    <span class="my-hidden">FeetFirst</span>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#my-navbar-collapse-1"
                        aria-controls="my-nav-menu" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="my-navbar-collapse-1">
                    <form class="d-flex mx-3 w-100" method="post" action="/search/search">
                        <input class="form-control me-2" type="search" placeholder="Search for your favorite shoes"
                               aria-label="Search" name="searchText" value="${searchText}">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                    <ul class="navbar-nav ms-auto text-center">
                        <li class="nav-item dropdown mx-3">
                            <a class="nav-link dropdown-toggle" id="my-navbar-dropdown" href="#" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                <c:if test="${empty userFirstNameDisplay}">
                                    <span>Sign In / Register</span>
                                </c:if>
                                <c:if test="${not empty userFirstNameDisplay}">
                                    <span>Hi, ${userFirstNameDisplay}</span>
                                </c:if>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="my-navbar-dropdown">
                                <li><a class="dropdown-item" href="/login/inbox">Profile</a></li>
                                <li><a class="dropdown-item" href="/login/login">Sign In</a></li>
                                <li><a class="dropdown-item" href="/login/create-user">Register</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="/login/logout">Sign Out</a></li>
                            </ul>
                        </li>
                        <li class="navbar-item ms-2 me-3 text-center">
                            <a class="nav-link pt-0 pb-0" href="/cart/cart">
                                <i class="bi bi-cart3"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <nav class="navbar navbar-expand-md bg-dark navbar-dark pt-1 my-navbar-2">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#my-navbar-collapse-2"
                        aria-controls="my-nav-menu" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="my-navbar-collapse-2">
                    <ul class="navbar-nav mx-auto text-center">
                        <li class="navbar-item px-3">
                            <a class="nav-link my-nav-home" href="/index">Home</a>
                        </li>
                        <li class="navbar-item px-3">
                            <a class="nav-link my-nav-search" href="/search/search">Search</a>
                        </li>
                        <li class="navbar-item px-3">
                            <form method="post" action="/search/search">
                                <input type="hidden" name="searchText" value="men">
                                <a class="nav-link my-nav-men" href="#" onclick="this.parentNode.submit()">Men</a>
                            </form>
                            <%--<a class="nav-link my-nav-men" href="/nav/men">Men</a>--%>
                        </li>
                        <li class="navbar-item px-3">
                            <form method="post" action="/search/search">
                                <input type="hidden" name="searchText" value="women">
                                <a class="nav-link my-nav-men" href="#" onclick="this.parentNode.submit()">Women</a>
                            </form>
                            <%--<a class="nav-link my-nav-women" href="/nav/women">Women</a>--%>
                        </li>
                        <li class="navbar-item px-3">
                            <form method="post" action="/search/search">
                                <input type="hidden" name="searchText" value="kid">
                                <a class="nav-link my-nav-men" href="#" onclick="this.parentNode.submit()">Kids</a>
                            </form>
                            <%--<a class="nav-link my-nav-kids" href="/nav/kids">Kids</a>--%>
                        </li>
                        <li class="navbar-item px-3">
                            <a class="nav-link my-nav-contact" href="/nav/contact">Contact Us</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </section>
</main>
<footer>

</footer>
</body>
</html>
