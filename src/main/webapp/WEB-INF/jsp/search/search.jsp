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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
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
    <%--<section class="bg-light text-dark p-4 text-center">--%>
    <%--    <div class="container-xxl px-0">--%>
    <section class="bg-light text-dark p-4 text-center my-section-container">
        <div class="container-fluid px-0">
            <div class="text-start">
                <h2 class="fs-5"><b>Search results for: </b>${searchText}</h2>
            </div>
            <hr>

            <c:choose>
                <c:when test="${empty searchText}">
                    <p class="fs-4">No search parameter.</p>
                </c:when>
                <c:when test="${not empty searchText and empty subproducts}">
                    <p class="fs-4">No results found.</p>
                </c:when>
                <c:otherwise>
                    <div class="row g-4">
                        <c:forEach items="${subproducts}" var="subproduct">
                            <div class="col-6 col-md-4 col-xl-3">
                                <a class="text-decoration-none" href="/search/detail?id=${subproduct.id}">
                                    <div class="card bg-dark text-light">
                                        <div class="card-body text-center p-1">
                                            <img class="img-fluid rounded mb-2"
                                                 src="${pageContext.request.contextPath}/resources/images/subproducts/${subproduct.id}/${subproduct.image1}"
                                                 alt="">
                                            <div class="text-start px-2">
                                                <h3 class="fs-6 card-title mb-2">${subproduct.itemObject.name}</h3>
                                                <div class="d-flex justify-content-between mb-0">
                                                    <p class="card-text m-0">$${subproduct.products[1].price}</p>
                                                    <p class="card-text m-0">[ ${subproduct.itemObject.starRating} ]</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <span class="my-hidden">Searched Result</span>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </section>

    <%--<section>--%>
    <%--    <h2>Search bar</h2>--%>
    <%--    <p>This is the Search bar.</p>--%>

    <%--    <form>--%>
    <%--        <label>--%>
    <%--            Search (for email):--%>
    <%--            <input type="text" name="searchText" value="${searchText}">--%>
    <%--            <input type="submit" name="submit" value="Submit">--%>
    <%--        </label>--%>
    <%--    </form>--%>
    <%--    <br>--%>
    <%--    <c:choose>--%>
    <%--        <c:when test="${empty searchText}">--%>
    <%--            <h3>No search parameter.</h3>--%>
    <%--        </c:when>--%>
    <%--        <c:when test="${not empty searchText and empty users}">--%>
    <%--            <h3>No results found.</h3>--%>
    <%--        </c:when>--%>
    <%--        <c:otherwise>--%>
    <%--            &lt;%&ndash;<table border="1" cellpadding="3">&ndash;%&gt;--%>
    <%--            <table class="my-search-result-table">--%>
    <%--                <tr>--%>
    <%--                    <th><b>ID</b></th>--%>
    <%--                    <th><b>First Name</b></th>--%>
    <%--                    <th><b>Last Name</b></th>--%>
    <%--                    <th><b>Email</b></th>--%>
    <%--                    <th><b>Password</b></th>--%>
    <%--                    <th><b>Phone</b></th>--%>
    <%--                    <th><b>Address</b></th>--%>
    <%--                    <th><b>City</b></th>--%>
    <%--                    <th><b>State</b></th>--%>
    <%--                    <th><b>Zip Code</b></th>--%>
    <%--                    <th><b>Roles</b></th>--%>
    <%--                </tr>--%>

    <%--                <c:forEach items="${users}" var="user">--%>
    <%--                    <tr>--%>
    <%--                        <td>${user.id}</td>--%>
    <%--                        <td>${user.firstName}</td>--%>
    <%--                        <td>${user.lastName}</td>--%>
    <%--                        <td>${user.email}</td>--%>
    <%--                        <td>${user.password}</td>--%>
    <%--                        <td>${user.phone}</td>--%>
    <%--                        <td>${user.address}</td>--%>
    <%--                        <td>${user.city}</td>--%>
    <%--                        <td>${user.state}</td>--%>
    <%--                        <td>${user.zipCode}</td>--%>
    <%--                        <td>${user.userRoles}</td>--%>
    <%--                        <td><a href="/search/detail?id=${user.id}">Details</a></td>--%>
    <%--                    </tr>--%>
    <%--                </c:forEach>--%>
    <%--            </table>--%>
    <%--        </c:otherwise>--%>
    <%--    </c:choose>--%>
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
