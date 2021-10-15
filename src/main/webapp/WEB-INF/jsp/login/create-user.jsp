<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login / Create-User Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <%--<link rel="stylesheet" type="text/css" href="css/styles.css">--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <%--<script type="text/javascript" src="js/script.js" defer></script>--%>
</head>
<body>
<header>
    <jsp:include page="../include/header.jsp"/>
    <h1>Login / Create-User Page</h1>
    <br>
</header>
<main>
    <section>
        <h2>Create-User form</h2>
        <p>This is the Create-User form.</p>

        <form method="post" action="/login/create-user">

            <c:forEach items="${errorMessages}" var="errorMessage">
                <span style='color:red'>${errorMessage}</span>
                <br>
            </c:forEach>

            <hr>

            <label>
                First Name:
                <input type="text" name="firstName" value="${form.firstName}" required>
                <c:forEach items="${errorFields}" var="errorField">
                    <c:if test='${errorField.field == "firstName"}'>
                        <br>
                        <span style='color:red'>${errorField.defaultMessage}</span>
                    </c:if>
                </c:forEach>
            </label>
            <br>

            <label>
                Last Name:
                <input type="text" name="lastName" value="${form.lastName}" required>
                <c:forEach items="${errorFields}" var="errorField">
                    <c:if test='${errorField.field == "lastName"}'>
                        <br>
                        <span style='color:red'>${errorField.defaultMessage}</span>
                    </c:if>
                </c:forEach>
            </label>
            <br>

            <label>
                Email:
                <input type="email" name="email" value="${form.email}" required>
                <c:forEach items="${errorFields}" var="errorField">
                    <c:if test='${errorField.field == "email"}'>
                        <br>
                        <span style='color:red'>${errorField.defaultMessage}</span>
                    </c:if>
                </c:forEach>
            </label>
            <br>

            <label>
                Password:
                <input type="password" name="password" value="${form.password}" required>
                <c:forEach items="${errorFields}" var="errorField">
                    <c:if test='${errorField.field == "password"}'>
                        <br>
                        <span style='color:red'>${errorField.defaultMessage}</span>
                    </c:if>
                </c:forEach>
            </label>
            <br>

            <label>
                Confirm Password:
                <input type="password" name="confirmPassword" value="${form.confirmPassword}" required>
                <c:forEach items="${errorFields}" var="errorField">
                    <c:if test='${errorField.field == "confirmPassword"}'>
                        <br>
                        <span style='color:red'>${errorField.defaultMessage}</span>
                    </c:if>
                </c:forEach>
            </label>
            <br>

            <label>
                Phone Number:
                <input type="text" name="phone" value="${form.phone}" required>
                <c:forEach items="${errorFields}" var="errorField">
                    <c:if test='${errorField.field == "phone"}'>
                        <br>
                        <span style='color:red'>${errorField.defaultMessage}</span>
                    </c:if>
                </c:forEach>
            </label>
            <br>

            <label>
                Address:
                <input type="text" name="address" value="${form.address}" required>
                <c:forEach items="${errorFields}" var="errorField">
                    <c:if test='${errorField.field == "address"}'>
                        <br>
                        <span style='color:red'>${errorField.defaultMessage}</span>
                    </c:if>
                </c:forEach>
            </label>
            <br>

            <label>
                City:
                <input type="text" name="city" value="${form.city}" required>
                <c:forEach items="${errorFields}" var="errorField">
                    <c:if test='${errorField.field == "city"}'>
                        <br>
                        <span style='color:red'>${errorField.defaultMessage}</span>
                    </c:if>
                </c:forEach>
            </label>
            <br>

            <label>
                State:
                <input type="text" name="state" value="${form.state}" required>
                <c:forEach items="${errorFields}" var="errorField">
                    <c:if test='${errorField.field == "state"}'>
                        <br>
                        <span style='color:red'>${errorField.defaultMessage}</span>
                    </c:if>
                </c:forEach>
            </label>
            <br>

            <label>
                Zip Code:
                <input type="text" name="zipCode" value="${form.zipCode}" required>
                <c:forEach items="${errorFields}" var="errorField">
                    <c:if test='${errorField.field == "zipCode"}'>
                        <br>
                        <span style='color:red'>${errorField.defaultMessage}</span>
                    </c:if>
                </c:forEach>
            </label>
            <br>

            <input type="submit" name="submit" value="Submit">
        </form>
    </section>
</main>
<footer>
    <br>
    <jsp:include page="../include/footer.jsp"/>
</footer>
<!-- Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
