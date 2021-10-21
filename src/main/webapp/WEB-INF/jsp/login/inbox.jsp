<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                <div class="col-md-8  mt-2">
                    <p class="fs-5"><b>Welcome, </b>${welcomeUserMessage}</p>
                    <p class="fs-6"><b>Account type: </b>${accountType}</p>
                    <br>
                    <table>
                        <tr>
                            <td><span class="fs-6 mx-3">Name: </span></td>
                            <td><span class="fs-6 mx-3">${userForInbox.firstName} ${userForInbox.lastName}</span></td>
                        </tr>
                        <tr>
                            <td><span class="fs-6 mx-3">Email: </span></td>
                            <td><span class="fs-6 mx-3">${userForInbox.email}</span></td>
                        </tr>
                        <tr>
                            <td><span class="fs-6 mx-3">Phone: </span></td>
                            <td>
                                <c:set var="phoneFormat" value="${userForInbox.phone}"/>
                                <span class="fs-6 mx-3">(${fn:substring(phoneFormat, 0, 3)}) ${fn:substring(phoneFormat, 3, 6)}-${fn:substring(phoneFormat, 6, fn:length(phoneFormat))}</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="align-top"><span class="fs-6 mx-3">Address: </span></td>
                            <td>
                                <span class="fs-6 mx-3">${userForInbox.address}<br></span>
                                <span class="fs-6 mx-3">${userForInbox.city}, ${userForInbox.state}<br></span>
                                <span class="fs-6 mx-3">${userForInbox.zipCode}<br></span>

                            </td>
                        </tr>
                    </table>
                </div>
                <div class="col-md-2  mt-2">
                    <sec:authorize access="hasAuthority('USER')">
                        <a href="/login/edit-info" class="btn btn-primary btn-md active" role="button"
                           aria-pressed="true">
                            Edit User Information
                        </a>
                    </sec:authorize>
                </div>
                <div class="col-md-2  mt-2">
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
                <div class="col-md-12 mt-2">
                    <p class="fs-5"><b>Order History</b></p>
                </div>
                <div class="col-md-12 mt-2">

                    <div class="row mt-1">
                        <%--<c:set var="orders" value="userForInbox.orders"></c:set>--%>
                        <c:forEach items="${orderList}" var="order">

                            <c:set var="total" value="0"/>
                            <c:forEach items="${order.orderDetails}" var="orderDetail">
                                <c:set var="total"
                                       value="${total + orderDetail.quantityOrdered * orderDetail.productObject.price * 1.1025}"/>
                            </c:forEach>

                            <div class="col-12 mb-4">
                                <div class="row border border-secondary">
                                    <div class="col-2">
                                        <p class="font-weight-bold mb-0"><b>Ordered Date</b></p>
                                        <p>
                                            <fmt:parseDate value="${order.orderedDate}" pattern="yyyy-MM-dd'T'HH:mm"
                                                           var="parsedDateTime" type="both"/>
                                            <fmt:formatDate value="${parsedDateTime}"
                                                            pattern="yyyy-MM-dd, HH:mm:ss"/>
                                        </p>
                                    </div>
                                    <div class="col-2">
                                        <p class="font-weight-bold mb-0"><b>Shipped Date</b></p>
                                        <p>
                                            <fmt:parseDate value="${order.shippedDate}" pattern="yyyy-MM-dd'T'HH:mm"
                                                           var="parsedDateTime" type="both"/>
                                            <fmt:formatDate value="${parsedDateTime}"
                                                            pattern="yyyy-MM-dd, HH:mm:ss"/>
                                        </p>
                                    </div>
                                    <div class="col-2">
                                        <p class="font-weight-bold mb-0"><b>Status</b></p>
                                        <p>${order.status}</p>
                                    </div>
                                    <div class="col-4">

                                    </div>
                                    <div class="col-2 text-end">
                                        <p class="font-weight-bold mb-0"><b>Total</b></p>
                                        <p><fmt:formatNumber type="currency" value="${total}"/></p>
                                    </div>

                                    <hr class="m-0">

                                    <c:forEach items="${order.orderDetails}" var="orderDetail">
                                        <div class="col-12">
                                            <div class="row">

                                                <div class="col-2 text-start p-1">
                                                    <img class="img-fluid"
                                                         src="${pageContext.request.contextPath}/resources/images/subproducts/${orderDetail.productObject.subproductObject.id}/img1.jpg"
                                                         width="140px" height="auto" alt="">
                                                </div>
                                                <div class="col-6">
                                                    <p class="mb-0">${orderDetail.productObject.subproductObject.itemObject.name}</p>
                                                    <p class="mb-3"><small>Size: ${orderDetail.productObject.size}</small></p>
                                                </div>
                                                <div class="col-1">

                                                    <c:if test="${orderDetail.alreadyReviewed == false}">
                                                        <a href="#" class="btn btn-warning btn-sm active mt-1" role="button" aria-pressed="true">
                                                            <span>Review Product</span>
                                                        </a>
                                                    </c:if>

                                                </div>
                                                <div class="col-1 text-center">
                                                    <small>$<fmt:formatNumber type="number" maxFractionDigits="2"
                                                                              minFractionDigits="2"
                                                                              value="${orderDetail.productObject.price}"/></small>

                                                </div>
                                                <div class="col-1 text-center">
                                                    <p>${orderDetail.quantityOrdered}</p>
                                                </div>
                                                <div class="col-1 text-end">
                                                    <c:set var="sum"
                                                           value="${orderDetail.quantityOrdered * orderDetail.productObject.price}"/>
                                                    <p><fmt:formatNumber type="currency" value="${sum}"/></p>
                                                    <p>Tax: <fmt:formatNumber type="currency" value="${sum * 0.1025}"/></p>
                                                </div>
                                            </div>
                                        </div>
                                        <c:set var="total" value="${total + sum}"/>
                                    </c:forEach>

                                </div>
                            </div>

                        </c:forEach>
                    </div>
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
