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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
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

    <section class="bg-dark text-light p-2 text-center my-section-container">
        <div class="container-fluid px-0">
            <div class="my-section-header">
                <h2 class="my-white-header mt-2">Trending</h2>
                <p>Most Wanted Styles</p>
            </div>
            <div class="row g-2">
                <div class="col-md-4">
                    <div class="card bg-light">
                        <div class="card-body text-center">
                            <img class="img-fluid rounded"
                                 src="${pageContext.request.contextPath}/resources/images/index/most-favorite.webp"
                                 alt="Most Favorite">
                            <h3 class="card-title text-dark text-start mt-2 my-img-title">Most Favorite</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-light">
                        <div class="card-body text-center">
                            <img class="img-fluid rounded"
                                 src="${pageContext.request.contextPath}/resources/images/index/top-trending.webp"
                                 alt="Top Trending">
                            <h3 class="card-title text-dark text-start mt-2 my-img-title">Top Trending</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-light">
                        <div class="card-body text-center">
                            <img class="img-fluid rounded"
                                 src="${pageContext.request.contextPath}/resources/images/index/new-arrivals.webp"
                                 alt="New Arrivals">
                            <h3 class="card-title text-dark text-start mt-2 my-img-title">New Arrivals</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="bg-light text-dark p-2 text-center my-section-container my-brands-section">
        <div class="container-fluid px-0">
            <div class="my-section-header">
                <h2 class="my-black-header mt-2">Shop By Brand</h2>
                <p>Select Your Favorite Brands</p>
            </div>
            <div class="row text-center g-2 g-md-4">
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <a class="pt-0 pb-0" href="/">
                        <img class="img-fluid rounded"
                             src="${pageContext.request.contextPath}/resources/images/logo/nike.jpg"
                             alt="Nike">
                        <span class="my-hidden">Nike</span>
                    </a>
                </div>
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <a class="pt-0 pb-0" href="/">
                        <img class="img-fluid rounded"
                             src="${pageContext.request.contextPath}/resources/images/logo/jordan.jpg"
                             alt="Jordan">
                        <span class="my-hidden">Jordan</span>
                    </a>
                </div>
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <a class="pt-0 pb-0" href="/">
                        <img class="img-fluid rounded"
                             src="${pageContext.request.contextPath}/resources/images/logo/adidas.jpg"
                             alt="Adidas">
                        <span class="my-hidden">Adidas</span>
                    </a>
                </div>
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <a class="pt-0 pb-0" href="/">
                        <img class="img-fluid rounded"
                             src="${pageContext.request.contextPath}/resources/images/logo/puma.jpg"
                             alt="Puma">
                        <span class="my-hidden">Puma</span>
                    </a>
                </div>
                <%--</div>--%>
                <%--<div class="row text-center g-2 g-md-4 pt-4">--%>
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <a class="pt-0 pb-0" href="/">
                        <img class="img-fluid rounded"
                             src="${pageContext.request.contextPath}/resources/images/logo/newbalance.jpg"
                             alt="New Balance">
                        <span class="my-hidden">New Balance</span>
                    </a>
                </div>
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <a class="pt-0 pb-0" href="/">
                        <img class="img-fluid rounded"
                             src="${pageContext.request.contextPath}/resources/images/logo/crocs.jpg"
                             alt="Crocs">
                        <span class="my-hidden">Crocs</span>
                    </a>
                </div>
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <a class="pt-0 pb-0" href="/">
                        <img class="img-fluid rounded"
                             src="${pageContext.request.contextPath}/resources/images/logo/converse.jpg"
                             alt="Converse">
                        <span class="my-hidden">Converse</span>
                    </a>
                </div>
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <a class="pt-0 pb-0" href="/">
                        <img class="img-fluid rounded"
                             src="${pageContext.request.contextPath}/resources/images/logo/reebok.jpg"
                             alt="Reebok">
                        <span class="my-hidden">Reebok</span>
                    </a>
                </div>
                <%--</div>--%>
                <%--<div class="row text-center g-2 g-md-4 pt-4">--%>
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <a class="pt-0 pb-0" href="/">
                        <img class="img-fluid rounded"
                             src="${pageContext.request.contextPath}/resources/images/logo/thenorthface.jpg"
                             alt="The North Face">
                        <span class="my-hidden">The North Face</span>
                    </a>
                </div>
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <a class="pt-0 pb-0" href="/">
                        <img class="img-fluid rounded"
                             src="${pageContext.request.contextPath}/resources/images/logo/champion.jpg"
                             alt="Champion">
                        <span class="my-hidden">Champion</span>
                    </a>
                </div>
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <a class="pt-0 pb-0" href="/">
                        <img class="img-fluid rounded"
                             src="${pageContext.request.contextPath}/resources/images/logo/newera.jpg"
                             alt="New Era">
                        <span class="my-hidden">New Era</span>
                    </a>
                </div>
                <div class="col-6 col-md-3 col-xl-2 px-5 py-2 my-brands">
                    <a class="pt-0 pb-0" href="/">
                        <img class="img-fluid rounded"
                             src="${pageContext.request.contextPath}/resources/images/logo/timberland.jpg"
                             alt="Timberland">
                        <span class="my-hidden">Timberland</span>
                    </a>
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
