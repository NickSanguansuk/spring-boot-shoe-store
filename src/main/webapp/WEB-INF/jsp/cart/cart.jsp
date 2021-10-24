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
                        <th class="fs-6">Product</th>
                        <th class="fs-6" style="text-align: center;">Quantity</th>
                        <th class="fs-6">Subtotal</th>
                    </tr>

                    <c:set var="subtotal" value="0"></c:set>
                    <c:set var="sum" value="0"></c:set>
                    <c:forEach items="${cartItems}" var="cartItem">
                        <tr>
                            <td>
                                <div class="text-start my-cart-info">

                                    <form method="get" action="/search/detail">
                                        <input type="hidden" name="subId"
                                               value="${cartItem.productObjectCart.subproductObject.id}">
                                        <input type="hidden" name="proId" value="${cartItem.productObjectCart.id}">
                                        <a href="#" onclick="this.parentNode.submit()">
                                            <img src="${pageContext.request.contextPath}/resources/images/subproducts/${cartItem.productObjectCart.subproductObject.id}/img1.jpg"
                                                 alt="">

                                        </a>
                                        <span class="my-hidden">Cart item image</span>
                                    </form>

                                    <div>
                                        <p class="mb-0">${cartItem.productObjectCart.subproductObject.itemObject.name}</p>
                                        <p class="mb-3"><small>Size: ${cartItem.productObjectCart.size}</small></p>
                                        <p>
                                            $<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2"
                                                               value="${cartItem.productObjectCart.price}"/>
                                        </p>
                                        <form method="post" action="/cart/remove">
                                            <input type="hidden" name="proId" value="${cartItem.productObjectCart.id}">
                                            <a href="#" onclick="this.parentNode.submit()">Remove</a>
                                        </form>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <label class="sr-only form-label" for="my-each-product-quantity">Quantity of each
                                    Product</label>
                                <input type="number" id="my-each-product-quantity" value="${cartItem.quantity}">
                            </td>
                            <c:set var="sum" value="${cartItem.productObjectCart.price * cartItem.quantity}"/>
                            <c:set var="subtotal" value="${subtotal + sum}"/>
                            <td>
                                $<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2"
                                                   value="${sum}"/>
                                    <%--$<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${cartItem.productObjectCart.price * cartItem.quantity}"/>--%>
                            </td>
                        </tr>
                    </c:forEach>
                </table>

                <div class="my-total-price">
                    <table>
                        <tr>
                            <td><b>Subtotal</b></td>
                            <td>$<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2"
                                                   value="${subtotal}"/></td>
                        </tr>
                        <tr>
                            <td><b>Tax</b></td>
                            <td>$<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2"
                                                   value="${subtotal * 0.1025}"/></td>
                        </tr>
                        <tr>
                            <td><b>Total</b></td>
                            <td>$<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2"
                                                   value="${subtotal * 1.1025}"/></td>
                        </tr>
                    </table>
                </div>
            </div>

            <form method="post" action="/cart/cart">
                <div class="text-end">
                    <button type="submit" class="btn btn-lg btn-primary btn-block">Proceed to Checkout</button>
                </div>
                <div class="text-end mt-2">
                    <c:if test="${not empty checkoutMessages}">
                        <span style='color:green'>${checkoutMessages}</span>
                        <br>
                    </c:if>
                    <c:if test="${not empty checkoutErrorMessages}">
                        <span style='color:red'>${checkoutErrorMessages}</span>
                        <br>
                    </c:if>
                </div>
            </form>
            // Debugging

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
