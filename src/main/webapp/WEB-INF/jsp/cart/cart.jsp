<%@ page import="com.company.shoe_store.data.entity.CartItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart / Cart Page</title>
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <%--<link rel="stylesheet" type="text/css" href="css/styles.css">--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/styles-cart-cart.css">
    <!-- JavaScript -->
    <%--<script type="text/javascript" src="js/script.js" defer></script>--%>
</head>
<body>
<header>
    <jsp:include page="../include/header.jsp"/>
</header>
<main>
    <section class="bg-light text-dark p-4 text-center my-section-container">
        <div class="container-fluid px-0">

            <div class="text-start">
                <h2 class="fs-5"><b>Shopping cart: </b></h2>
            </div>
            <hr>

            <div class="my-cart-page">
                <table>
                    <tr>
                        <th class="fs-5">Product</th>
                        <th class="fs-5" style="text-align: center;">Quantity</th>
                        <th class="fs-5">Subtotal</th>
                    </tr>

                    <%!
                        Double subtotal = 0.0;
                        Double subtotalEachProduct = 0.0;
                    %>
                    <c:forEach items="${cartItems}" var="cartItem">
                        <%--<c:set var="subproduct" scope="session" value="${cartItem.productObject.subproductObject}"/>--%>
                        <tr>
                            <td>
                                <div class="text-start my-cart-info">
                                    <img src="${pageContext.request.contextPath}/resources/images/subproducts/${cartItem.productObjectCart.subproductObject.id}/img1.jpg"
                                         alt="">
                                    <div>
                                        <p>${cartItem.productObjectCart.subproductObject.itemObject.name}</p>
                                        <small>$<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${cartItem.productObjectCart.price}"/></small>
                                        <br>
                                        <a href="">Remove</a>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <label class="sr-only form-label" for="my-each-product-quantity">Quantity of each
                                    Product</label>
                                <input type="number" id="my-each-product-quantity" value="${cartItem.quantity}">
                            </td>
                            <td>
                                $<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${cartItem.getProductObjectCart().getPrice() * cartItem.getQuantity()}"/>





                            </td>
                        </tr>
                    </c:forEach>
                </table>

                <div class="my-total-price">
                    <table>
                        <tr>
                            <td><b>Subtotal</b></td>
                            <td>$<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${subtotal}"/></td>
                        </tr>
                        <tr>
                            <td><b>Tax</b></td>
                            <td>$<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${subtotal * 0.1025}"/></td>
                        </tr>
                        <tr>
                            <td><b>Total</b></td>
                            <td>$<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${subtotal * 1.1025}"/></td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="text-end">
                <button type="submit" class="btn btn-lg btn-primary btn-block">Proceed to Checkout</button>
            </div>

        </div>
    </section>
</main>
<footer>
    <jsp:include page="../include/footer.jsp"/>
</footer>
<!-- JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
