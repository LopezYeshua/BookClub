<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <script src="/webjars/bootstrap/js/bootstrap.min.js" defer></script>
    <link rel="stylesheet" href="/css/style.css"/>
    <script type="text/javascript" src="/js/app.js" defer></script>
    <title>Show ${book.title}</title>
</head>
<body>
    <nav class="nav justify-content-around px-3 bg-dark text-light shadow-lg">
        <h1><a class="home-link" href="/books">Book Club</a></h1>
        <h3 class="my-auto">A place for friends to share thoughts on books</h3>
    </nav>
    <div class="container w-50 mt-3">
        <div class="card shadow-lg">
            <div class="card-header">
                <h1>${book.title}</h1>
                <a href="/books">Back to the shelves!</a>
            </div>
            <div class="card-body">
                <header class="show-label">
                    <c:choose>
                        <c:when test="${user.id == book.user.id}">
                            <h3><span>You</span> read <span>${book.title}</span> by <span>${book.author}</span></h3>
                            <h3>Here are your thoughts:</h3>
                        </c:when>
                        <c:otherwise>
                            <h3><span>${book.user.name}</span> read <span>${book.title}</span> by <span>${book.author}</span></h3>
                            <h3>Here are ${book.user.name}'s thoughts:</h3>
                        </c:otherwise>
                    </c:choose>
                </header>
                <div class="border-y w-50">
                    <p>${book.thoughts}</p>
                </div>
                <c:if test="${user.id == book.user.id}">
                    <a href="/books/edit/${book.id}">Edit</a>
                </c:if>
            </div>
        </div>
    </div>
</body>
</html>