<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>File / Upload Page</title>
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <%--<link rel="stylesheet" type="text/css" href="css/styles.css">--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/styles-file-upload.css">
    <!-- JavaScript -->
    <%--<script type="text/javascript" src="js/script.js" defer></script>--%>
</head>
<body>
<header>
    <jsp:include page="../include/header.jsp"/>
    <%--<h1>File / Upload Page</h1>--%>
    <%--<br>--%>
</header>
<main>
    <section>
        <h2>File Upload section</h2>
        <p>This is the File Upload section.</p>

        <form method="post" action="/file/upload" enctype="multipart/form-data">
            <label>
                Put file description here:
                <input type="text" name="text">
            </label>
            <br>
            <label>
                Select file to upload:
                <br>
                <input type="file" name="file">
                <br>
                <%--<input type="file" name="file">--%>
                <%--<br>--%>
                <%--<input type="file" name="file">--%>
                <%--<br>--%>
                <input type="submit" name="submit" value="Submit">
            </label>
        </form>
        <br>
    </section>
    <section>
        <h2>Submitted File</h2>
        <table>
            <tr>
                <td>OriginalFileName:</td>
                <td>${fileSubmitted.originalFilename}</td>
            </tr>
            <tr>
                <td>Type:</td>
                <td>${fileSubmitted.contentType}</td>
            </tr>
        </table>
    </section>
    <section>
        <img class="my-uploaded-image" src="https://wasin-first-bucket.s3.us-east-2.amazonaws.com/images/${imageName}">
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
