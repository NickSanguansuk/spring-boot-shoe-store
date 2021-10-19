<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search / Detail Page</title>
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <%--<link rel="stylesheet" type="text/css" href="css/styles.css">--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/styles-search-detail.css">
    <!-- JavaScript -->
    <%--<script type="text/javascript" src="js/script.js" defer></script>--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/script-search-detail.js"
            defer></script>
</head>
<body>
<header>
    <jsp:include page="../include/header.jsp"/>
    <%--<h1>Search / Detail Page</h1>--%>
    <%--<br>--%>
</header>
<main>
    <section class="bg-light text-dark p-4 text-center my-section-container">
        <div class="container-fluid px-0">
            <div class="text-start">
                <p><small>HOME / ${subproduct.itemObject.gender} / ${subproduct.itemObject.category}</small></p>
            </div>
            <div class="row my-product-detail">
                <div class="col-12 col-md-5 col-lg-5">
                    <img class="img-fluid w-100 rounded <%--mb-2--%>"
                         src="${pageContext.request.contextPath}/resources/images/subproducts/${subproduct.id}/img1.jpg"
                         id="my-detail-main-image"
                         alt="">

                    <div class="row mx-0 mt-1">
                        <div class="col my-small-image-column p-0 me-1">
                            <img class="img-fluid w-100 rounded <%--mb-2--%> my-small-image"
                                 src="${pageContext.request.contextPath}/resources/images/subproducts/${subproduct.id}/img1.jpg"
                                 alt="">
                        </div>
                        <div class="col my-small-image-column p-0 me-1">
                            <img class="img-fluid w-100 rounded <%--mb-2--%> my-small-image"
                                 src="${pageContext.request.contextPath}/resources/images/subproducts/${subproduct.id}/img2.jpg"
                                 alt="">
                        </div>
                        <div class="col my-small-image-column p-0 me-1">
                            <img class="img-fluid w-100 rounded <%--mb-2--%> my-small-image"
                                 src="${pageContext.request.contextPath}/resources/images/subproducts/${subproduct.id}/img3.jpg"
                                 alt="">
                        </div>
                        <div class="col my-small-image-column p-0 me-1">
                            <img class="img-fluid w-100 rounded <%--mb-2--%> my-small-image"
                                 src="${pageContext.request.contextPath}/resources/images/subproducts/${subproduct.id}/img4.jpg"
                                 alt="">
                        </div>
                        <div class="col my-small-image-column p-0 me-1">
                            <img class="img-fluid w-100 rounded <%--mb-2--%> my-small-image"
                                 src="${pageContext.request.contextPath}/resources/images/subproducts/${subproduct.id}/img5.jpg"
                                 alt="">
                        </div>
                        <div class="col my-small-image-column p-0">
                            <img class="img-fluid w-100 rounded <%--mb-2--%> my-small-image"
                                 src="${pageContext.request.contextPath}/resources/images/subproducts/${subproduct.id}/img6.jpg"
                                 alt="">
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-7 col-lg-7">
                    <div class="text-start">
                        <p class="mb-4">[ ${subproduct.itemObject.starRating} ] (${subproduct.itemObject.reviewCount})</p>
                        <h2 class="h5 my-3"><b>${subproduct.itemObject.name}</b></h2>

                        <div class="d-flex justify-content-start mb-0">
                            <%--<p class="h5 my-3 me-4">$<b>${product.price}</b></p>--%>
                            <p class="h5 my-3 me-4">$<b><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${product.price}"/></b></p>
                            <c:if test="${product.availability < 10}">
                                <p class="h6 my-3 me-4" style="color: red;">Only ${product.availability} left in stock
                                    (more on the way).</p>
                            </c:if>
                        </div>

                        <div class="row mx-0 my-3">
                            <c:forEach items="${subproduct.itemObject.subproducts}" var="sub">
                                <div class="col-2 my-color-image-column p-0 me-1" style="max-width: 15%;">
                                    <a class="text-decoration-none" href="/search/detail?subId=${sub.id}">
                                        <img class="img-fluid w-100 rounded"
                                             src="${pageContext.request.contextPath}/resources/images/subproducts/${sub.id}/img1.jpg"
                                             alt="">
                                        <span class="my-hidden">Chosen Color</span>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>

                        <div class="row mx-0 my-3">
                            <c:forEach items="${subproduct.products}" var="pro">
                                <div class="col text-center px-0 py-1 mx-1 my-product-size">
                                    <a class="text-decoration-none"
                                       href="/search/detail?subId=${subproduct.id}&proId=${pro.id}">
                                        <c:choose>
                                            <c:when test="${pro.id == product.id}">
                                                <div style="width: 55px; background-color: lightgray; border-radius: 6px; border-style: solid;">
                                                    <span><b>${pro.size}</b></span>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div style="width: 55px; background-color: lightgray; border-radius: 6px;">
                                                    <span>${pro.size}</span>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                        <span class="my-hidden">Chosen Size</span>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>

                        <form class="my-5" method="post"
                              action="/search/detail?subId=${subproduct.id}&proId=${product.id}">
                            <div class="d-flex">
                                <div style="max-width: 80px;">
                                    <label class="sr-only form-label" for="my-quantity-to-cart">Password</label>
                                    <input class="form-control" type="number" id="my-quantity-to-cart" name="quantity"
                                           value="1" required>
                                </div>
                                <div class="ms-3">
                                    <button type="submit" class="btn btn-md btn-primary btn-block">Add To Cart</button>
                                </div>
                            </div>
                        </form>

                        <h3 class="h5 my-3">Product Details</h3>
                        <%--<div>--%>
                        <%--    <p>--%>
                        <%--        <object data="${pageContext.request.contextPath}/resources/texts/items/${subproduct.itemObject.id}/detailFile.txt"></object>--%>
                        <%--        <embed src="${pageContext.request.contextPath}/resources/texts/items/${subproduct.itemObject.id}/detailFile.txt">--%>
                        <%--        <embed src="${pageContext.request.contextPath}/resources/texts/items/1/detailFile.txt">--%>
                        <%--        <iframe src="${pageContext.request.contextPath}/resources/texts/items/1/detailFile.txt"></iframe>--%>
                        <%--    </p>--%>
                        <%--</div>--%>
                        <div>
                            <p>
                                <%
                                    String fileName = "/resources/texts/items/1/detailFile.txt";
                                    InputStream ins = application.getResourceAsStream(fileName);
                                    try {
                                        if (ins == null) {
                                            response.setStatus(response.SC_NOT_FOUND);
                                        } else {
                                            BufferedReader br = new BufferedReader((new InputStreamReader(ins)));
                                            String data;
                                            while ((data = br.readLine()) != null) {
                                                out.println(data + "<br>");
                                            }
                                        }
                                    } catch (IOException e) {
                                        out.println(e.getMessage());
                                    }
                                %>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%--<section>--%>
    <%--    <h1>Search Detail Page</h1>--%>
    <%--    <p>This page is displaying search details.</p>--%>

    <%--    <h3>Details of: ${user.email}</h3>--%>
    <%--    <table>--%>
    <%--        <tr>--%>
    <%--            <td>ID</td>--%>
    <%--            <td>${user.id}</td>--%>
    <%--        </tr>--%>
    <%--        <tr>--%>
    <%--            <td>First Name</td>--%>
    <%--            <td>${user.firstName}</td>--%>
    <%--        </tr>--%>
    <%--        <tr>--%>
    <%--            <td>Last Name</td>--%>
    <%--            <td>${user.lastName}</td>--%>
    <%--        </tr>--%>
    <%--        <tr>--%>
    <%--            <td>email</td>--%>
    <%--            <td>${user.email}</td>--%>
    <%--        </tr>--%>
    <%--        <tr>--%>
    <%--            <td>Password</td>--%>
    <%--            <td>${user.password}</td>--%>
    <%--        </tr>--%>
    <%--        <tr>--%>
    <%--            <td>Phone</td>--%>
    <%--            <td>${user.phone}</td>--%>
    <%--        </tr>--%>
    <%--        <tr>--%>
    <%--            <td>Address</td>--%>
    <%--            <td>${user.address}</td>--%>
    <%--        </tr>--%>

    <%--        <tr>--%>
    <%--            <td>City</td>--%>
    <%--            <td>${user.city}</td>--%>
    <%--        </tr>--%>
    <%--        <tr>--%>
    <%--            <td>State</td>--%>
    <%--            <td>${user.state}</td>--%>
    <%--        </tr>--%>
    <%--        <tr>--%>
    <%--            <td>Zip Code</td>--%>
    <%--            <td>${user.zipCode}</td>--%>
    <%--        </tr>--%>
    <%--        <tr>--%>
    <%--            <td>Roles</td>--%>
    <%--            <td>${user.userRoles}</td>--%>
    <%--        </tr>--%>
    <%--    </table>--%>
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
<%--<script>--%>
<%--    let mainImage = document.getElementById('my-detail-main-image');--%>
<%--    let smallImages = document.getElementsByClassName('my-small-image');--%>

<%--    for (let i = 0; i < smallImages.length; i++) {--%>
<%--        smallImages[i].onclick = function () {--%>
<%--            mainImage.src = smallImages[i].src;--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>
