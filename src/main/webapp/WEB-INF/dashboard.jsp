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
    <title>Book Club</title>
</head>
<body>
    <nav class="nav justify-content-around px-3 bg-dark text-light shadow-lg">
        <h1><a class="home-link" href="/books">Book Club</a></h1>
        <h3 class="my-auto">A place for friends to share thoughts on books</h3>
    </nav>
    <div class="container mt-3">
        <nav class="bg-dark text-light p-3 pb-0 round-top">
            <div class="row justify-content-between">
                <div class="col">
                    <h1>Welcome, ${user.name}</h1>
                    <p>Books for everyone's shelves</p>
                </div>
                <div class="col my-auto text-end">
                    <a href="/logout">logout</a>
                    <a href="/books/new">+ Add a new book</a>
                </div>
            </div>
        </nav>
        <table class="table border border-dark border-2 shadow-lg">
            <thead>
                <tr>
                    <td>ID</td>
                    <td>Title</td>
                    <td>Author Name</td>
                    <td>Posted by</td>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="book" items="${books}">
                    <tr>
                        <td>${book.id}</td>
                        <td><a class="unstyle" href="/books/show/${book.id}">${book.title}</a></td>
                        <td>${book.author}</td>
                        <td>${book.user.name}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>