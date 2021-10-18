<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login / Edit-Info Page</title>
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <%--<link rel="stylesheet" type="text/css" href="css/styles.css">--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/styles-login-edit-info.css">
    <!-- JavaScript -->
    <%--<script type="text/javascript" src="js/script.js" defer></script>--%>
</head>
<body>
<header>
    <jsp:include page="../include/header.jsp"/>
    <%--<h1>Login / Create-User Page</h1>--%>
    <%--<br>--%>
</header>
<main>
    <section class="bg-light text-dark p-4 text-center my-section-container">
        <div class="container">
            <form method="post" action="/login/edit-info" style="max-width: 600px; margin: auto;">
                <%--<img class="rounded m-4"--%>
                <%--     src="${pageContext.request.contextPath}/resources/images/logo/feetfirst8.jpg"--%>
                <%--     alt="FeetFirst Logo" width="300" height="auto">--%>
                <h1 class="h3 mb-3">Edit user information</h1>

                <div class="text-start">
                    <c:forEach items="${errorMessages}" var="errorMessage">
                        <span style='color:red'>${errorMessage}</span>
                        <br>
                    </c:forEach>

                    <c:if test="${editSuccess}">
                        <div style="color:green">Successfully edited user information.</div>
                    </c:if>
                </div>
                <hr>

                <div class="row g-3 text-start">
                    <div class="col-md-6">
                        <label for="my-create-firstname" class="form-label">First name:</label>
                        <input type="text" class="form-control" id="my-create-firstname" name="firstName"
                               value="${form.firstName}" placeholder="First name" aria-label="First name" required>
                        <c:forEach items="${errorFields}" var="errorField">
                            <c:if test='${errorField.field == "firstName"}'>
                                <span style='color:red'>${errorField.defaultMessage}</span>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div class="col-md-6">
                        <label for="my-create-lastname" class="form-label">Last name:</label>
                        <input type="text" class="form-control" id="my-create-lastname" name="lastName"
                               value="${form.lastName}" placeholder="Last name" aria-label="Last name" required>
                        <c:forEach items="${errorFields}" var="errorField">
                            <c:if test='${errorField.field == "lastName"}'>
                                <span style='color:red'>${errorField.defaultMessage}</span>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="col-md-12">
                        <label for="my-create-email" class="form-label">Email:</label>
                        <input type="email" class="form-control" id="my-create-email" name="email"
                               value="${form.email}" placeholder="Email" aria-label="Email" required>
                        <c:forEach items="${errorFields}" var="errorField">
                            <c:if test='${errorField.field == "email"}'>
                                <span style='color:red'>${errorField.defaultMessage}</span>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="col-md-6">
                        <label for="my-create-password" class="form-label">Password:</label>
                        <input type="password" class="form-control" id="my-create-password" name="password"
                               value="${form.password}" placeholder="Password" aria-label="Password" required>
                        <c:forEach items="${errorFields}" var="errorField">
                            <c:if test='${errorField.field == "password"}'>
                                <span style='color:red'>${errorField.defaultMessage}</span>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div class="col-md-6">
                        <label for="my-create-confirm-password" class="form-label">Confirm password:</label>
                        <input type="password" class="form-control" id="my-create-confirm-password"
                               name="confirmPassword"
                               value="${form.confirmPassword}" placeholder="Confirm password"
                               aria-label="Confirm password" required>
                        <c:forEach items="${errorFields}" var="errorField">
                            <c:if test='${errorField.field == "confirmPassword"}'>
                                <span style='color:red'>${errorField.defaultMessage}</span>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="col-md-12">
                        <label for="my-create-phone" class="form-label">Phone number:</label>
                        <input type="text" class="form-control" id="my-create-phone" name="phone"
                               value="${form.phone}" placeholder="Phone number" aria-label="Phone number" required>
                        <c:forEach items="${errorFields}" var="errorField">
                            <c:if test='${errorField.field == "phone"}'>
                                <span style='color:red'>${errorField.defaultMessage}</span>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="col-md-12">
                        <label for="my-create-address" class="form-label">Address:</label>
                        <input type="text" class="form-control" id="my-create-address" name="address"
                               value="${form.address}" placeholder="Address" aria-label="Address" required>
                        <c:forEach items="${errorFields}" var="errorField">
                            <c:if test='${errorField.field == "address"}'>
                                <span style='color:red'>${errorField.defaultMessage}</span>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="col-md-4">
                        <label for="my-create-city" class="form-label">City:</label>
                        <input type="text" class="form-control" id="my-create-city" name="city"
                               value="${form.city}" placeholder="City" aria-label="City" required>
                        <c:forEach items="${errorFields}" var="errorField">
                            <c:if test='${errorField.field == "city"}'>
                                <span style='color:red'>${errorField.defaultMessage}</span>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div class="col-md-4">
                        <label for="my-create-state" class="form-label">State:</label>
                        <input type="text" class="form-control" id="my-create-state" name="state"
                               value="${form.state}" placeholder="State" aria-label="State" required>
                        <c:forEach items="${errorFields}" var="errorField">
                            <c:if test='${errorField.field == "state"}'>
                                <span style='color:red'>${errorField.defaultMessage}</span>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div class="col-md-4">
                        <label for="my-create-zipCode" class="form-label">Zip code:</label>
                        <input type="text" class="form-control" id="my-create-zipCode" name="zipCode"
                               value="${form.zipCode}" placeholder="Zip code" aria-label="Zip code" required>
                        <c:forEach items="${errorFields}" var="errorField">
                            <c:if test='${errorField.field == "zipCode"}'>
                                <span style='color:red'>${errorField.defaultMessage}</span>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="col-md-12 mt-4">
                        <button type="submit" class="btn btn-lg btn-primary btn-block">Save</button>
                        <%--<input type="submit" name="submit" value="Submit">--%>
                    </div>
                </div>
            </form>
        </div>
    </section>
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
