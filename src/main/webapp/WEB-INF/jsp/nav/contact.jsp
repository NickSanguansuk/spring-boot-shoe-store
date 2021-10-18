<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nav / Contact Page</title>
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link href='https://api.mapbox.com/mapbox-gl-js/v2.3.1/mapbox-gl.css' rel='stylesheet'>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <%--<link rel="stylesheet" type="text/css" href="css/styles.css">--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/styles-nav-contact.css">
    <!-- JavaScript -->
    <%--<script type="text/javascript" src="js/script.js" defer></script>--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/script.js" defer></script>
</head>
<body>
<header>
    <jsp:include page="../include/header.jsp"/>
</header>
<main>
    <section class="bg-light text-dark p-4 text-center my-section-container">
        <div class="container">
            <div class="row g-4">
                <div class="col-md-4">
                    <h2 class="text-center fs-3 m-4">Contact Us</h2>
                    <div class="my-contact-contactInfo">
                        <div class="my-contact-box">
                            <div class="my-contact-icon"><i class="fa fa-map" aria-hidden="true"></i></div>
                            <div class="my-contact-text m-4 mt-3 align-items-start">
                                <h3 class="fs-5">Address</h3>
                                <p>1242 N Milwaukee Ave, <br>Chicago, IL 60640</p>
                            </div>
                        </div>
                        <div class="my-contact-box">
                            <div class="my-contact-icon"><i class="fa fa-phone" aria-hidden="true"></i></div>
                            <div class="my-contact-text m-4 mt-3 align-items-start">
                                <h3 class="fs-5">Phone</h3>
                                <p>(773) 969-2788</p>
                            </div>
                        </div>
                        <div class="my-contact-box">
                            <div class="my-contact-icon"><i class="fa fa-envelope" aria-hidden="true"></i></div>
                            <div class="my-contact-text m-4 mt-3 align-items-start">
                                <h3 class="fs-5">Email</h3>
                                <p>Info@FeetFirstShoeStore.com</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md">
                    <%--<div id='map' style='width: 400px; height: 300px;'></div>--%>
                    <div id="map"></div>
                </div>
            </div>
        </div>
    </section>
    <%--<section class="bg-light text-dark p-2 text-center my-section-container">--%>
    <%--    <div class="container">--%>
    <%--        <div class="my-test-background-image">--%>
    <%--            <p>Testing here.</p>--%>
    <%--            <br>--%>
    <%--            <br>--%>
    <%--            <br>--%>
    <%--            <br>--%>
    <%--            <br>--%>
    <%--        </div>--%>
    <%--    </div>--%>
    <%--</section>--%>
</main>
<footer>
    <jsp:include page="../include/footer.jsp"/>
</footer>
<!-- JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src='https://api.mapbox.com/mapbox-gl-js/v2.3.1/mapbox-gl.js'></script>
<%--<script>--%>
<%--    mapboxgl.accessToken = 'pk.eyJ1Ijoid3Nhbmd1YW5zdWsiLCJhIjoiY2t1djJ0MWZpNjRvcTJubzh3Nnd4aTR6aSJ9.uGCOx8LfekPAPWHwAyNn4g';--%>
<%--    var map = new mapboxgl.Map({--%>
<%--        container: 'map',--%>
<%--        style: 'mapbox://styles/mapbox/streets-v11'--%>
<%--    });--%>
<%--</script>--%>
</body>
</html>
