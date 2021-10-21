<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <%--<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
          integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <%--<link rel="stylesheet" type="text/css" href="css/styles.css">--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles-index.css">
    <!-- JavaScript -->
    <%--<script type="text/javascript" src="js/script.js" defer></script>--%>
</head>
<body>
<header>
    <jsp:include page="include/header.jsp"/>
    <%--<h1>Home Page</h1>--%>
    <%--<br>--%>
</header>
<main>
    <%--<section class="bg-light text-dark p-2 text-center">--%>
    <%--    <div class="container-xxl px-0">--%>
    <section class="bg-light text-dark p-2 text-center my-section-container">
        <div class="container-fluid px-0">
            <div class="d-sm-flex align-items-center justify-content-between">
                <%--<div>--%>
                <%--    <h2>Welcome to FeetFirst Shoe Store</h2>--%>
                <%--</div>--%>
                <img class="img-fluid rounded w-100"
                     src="${pageContext.request.contextPath}/resources/images/index/banner.gif"
                     alt="banner">
            </div>
        </div>
    </section>

    <%--<section class="bg-dark text-light p-2 text-center">--%>
    <%--    <div class="container-xxl px-0">--%>
    <section class="bg-dark text-light p-2 text-center my-section-container">
        <div class="container-fluid px-0">
            <div class="my-section-header">
                <h2 class="my-white-header mt-2">Trending</h2>
                <p>Most Wanted Styles</p>
            </div>
            <div class="row g-2">
                <div class="col-md-4">
                    <div class="card bg-light my-box-shadow">
                        <div class="card-body text-center">
                            <img class="img-fluid w-100 rounded"
                                 src="${pageContext.request.contextPath}/resources/images/index/most-favorite.webp"
                                 alt="Most Favorite">
                            <h3 class="card-title text-dark text-start mt-2 my-img-title">Most Favorite</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-light my-box-shadow">
                        <div class="card-body text-center">
                            <img class="img-fluid w-100 rounded"
                                 src="${pageContext.request.contextPath}/resources/images/index/top-trending.webp"
                                 alt="Top Trending">
                            <h3 class="card-title text-dark text-start mt-2 my-img-title">Top Trending</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-light my-box-shadow">
                        <div class="card-body text-center">
                            <img class="img-fluid w-100 rounded"
                                 src="${pageContext.request.contextPath}/resources/images/index/new-arrivals.webp"
                                 alt="New Arrivals">
                            <h3 class="card-title text-dark text-start mt-2 my-img-title">New Arrivals</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%--<section class="bg-light text-dark p-2 text-center my-brands-section">--%>
    <%--    <div class="container-xxl px-0">--%>
    <section class="bg-light text-dark p-2 text-center my-section-container my-brands-section">
        <div class="container-fluid px-0">
            <div class="my-section-header">
                <h2 class="my-black-header mt-2">Shop By Brand</h2>
                <p>Select Your Favorite Brands</p>
            </div>
            <div class="row text-center g-2 g-md-4">
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <form method="post" action="/search/search">
                        <input type="hidden" name="searchText" value="nike">
                        <a class="pt-0 pb-0" href="#" onclick="this.parentNode.submit()">
                            <img class="img-fluid w-100 rounded my-box-shadow"
                                 src="${pageContext.request.contextPath}/resources/images/logo/nike.jpg"
                                 alt="nike">
                            <span class="my-hidden">nike</span>
                        </a>
                    </form>
                </div>
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <form method="post" action="/search/search">
                        <input type="hidden" name="searchText" value="jordan">
                        <a class="pt-0 pb-0" href="#" onclick="this.parentNode.submit()">
                            <img class="img-fluid w-100 rounded my-box-shadow"
                                 src="${pageContext.request.contextPath}/resources/images/logo/jordan.jpg"
                                 alt="jordan">
                            <span class="my-hidden">jordan</span>
                        </a>
                    </form>
                </div>
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <form method="post" action="/search/search">
                        <input type="hidden" name="searchText" value="adidas">
                        <a class="pt-0 pb-0" href="#" onclick="this.parentNode.submit()">
                            <img class="img-fluid w-100 rounded my-box-shadow"
                                 src="${pageContext.request.contextPath}/resources/images/logo/adidas.jpg"
                                 alt="adidas">
                            <span class="my-hidden">adidas</span>
                        </a>
                    </form>
                </div>
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <form method="post" action="/search/search">
                        <input type="hidden" name="searchText" value="puma">
                        <a class="pt-0 pb-0" href="#" onclick="this.parentNode.submit()">
                            <img class="img-fluid w-100 rounded my-box-shadow"
                                 src="${pageContext.request.contextPath}/resources/images/logo/puma.jpg"
                                 alt="puma">
                            <span class="my-hidden">puma</span>
                        </a>
                    </form>
                </div>
                <%--</div>--%>
                <%--<div class="row text-center g-2 g-md-4 pt-4">--%>
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <form method="post" action="/search/search">
                        <input type="hidden" name="searchText" value="new balance">
                        <a class="pt-0 pb-0" href="#" onclick="this.parentNode.submit()">
                            <img class="img-fluid w-100 rounded my-box-shadow"
                                 src="${pageContext.request.contextPath}/resources/images/logo/newbalance.jpg"
                                 alt="new balance">
                            <span class="my-hidden">new balance</span>
                        </a>
                    </form>
                </div>
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <form method="post" action="/search/search">
                        <input type="hidden" name="searchText" value="crocs">
                        <a class="pt-0 pb-0" href="#" onclick="this.parentNode.submit()">
                            <img class="img-fluid w-100 rounded my-box-shadow"
                                 src="${pageContext.request.contextPath}/resources/images/logo/crocs.jpg"
                                 alt="crocs">
                            <span class="my-hidden">crocs</span>
                        </a>
                    </form>
                </div>
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <form method="post" action="/search/search">
                        <input type="hidden" name="searchText" value="converse">
                        <a class="pt-0 pb-0" href="#" onclick="this.parentNode.submit()">
                            <img class="img-fluid w-100 rounded my-box-shadow"
                                 src="${pageContext.request.contextPath}/resources/images/logo/converse.jpg"
                                 alt="converse">
                            <span class="my-hidden">converse</span>
                        </a>
                    </form>
                </div>
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <form method="post" action="/search/search">
                        <input type="hidden" name="searchText" value="reebok">
                        <a class="pt-0 pb-0" href="#" onclick="this.parentNode.submit()">
                            <img class="img-fluid w-100 rounded my-box-shadow"
                                 src="${pageContext.request.contextPath}/resources/images/logo/reebok.jpg"
                                 alt="reebok">
                            <span class="my-hidden">reebok</span>
                        </a>
                    </form>
                </div>
                <%--</div>--%>
                <%--<div class="row text-center g-2 g-md-4 pt-4">--%>
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <form method="post" action="/search/search">
                        <input type="hidden" name="searchText" value="the north face">
                        <a class="pt-0 pb-0" href="#" onclick="this.parentNode.submit()">
                            <img class="img-fluid w-100 rounded my-box-shadow"
                                 src="${pageContext.request.contextPath}/resources/images/logo/thenorthface.jpg"
                                 alt="the north face">
                            <span class="my-hidden">the north face</span>
                        </a>
                    </form>
                </div>
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <form method="post" action="/search/search">
                        <input type="hidden" name="searchText" value="champion">
                        <a class="pt-0 pb-0" href="#" onclick="this.parentNode.submit()">
                            <img class="img-fluid w-100 rounded my-box-shadow"
                                 src="${pageContext.request.contextPath}/resources/images/logo/champion.jpg"
                                 alt="champion">
                            <span class="my-hidden">champion</span>
                        </a>
                    </form>
                </div>
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <form method="post" action="/search/search">
                        <input type="hidden" name="searchText" value="new era">
                        <a class="pt-0 pb-0" href="#" onclick="this.parentNode.submit()">
                            <img class="img-fluid w-100 rounded my-box-shadow"
                                 src="${pageContext.request.contextPath}/resources/images/logo/newera.jpg"
                                 alt="new era">
                            <span class="my-hidden">new era</span>
                        </a>
                    </form>
                </div>
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <form method="post" action="/search/search">
                        <input type="hidden" name="searchText" value="timberland">
                        <a class="pt-0 pb-0" href="#" onclick="this.parentNode.submit()">
                            <img class="img-fluid w-100 rounded my-box-shadow"
                                 src="${pageContext.request.contextPath}/resources/images/logo/timberland.jpg"
                                 alt="Timberland">
                            <span class="my-hidden">Timberland</span>
                        </a>
                    </form>
                </div>
            </div>
        </div>
    </section>
</main>
<footer>
    <%--<br>--%>
    <jsp:include page="include/footer.jsp"/>
</footer>
<!-- JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
