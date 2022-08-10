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
    <title>New Book</title>
</head>
<body>
    <nav class="nav justify-content-around px-3 bg-dark text-light shadow-lg">
        <h1><a class="home-link" href="/books">Book Club</a></h1>
        <h3 class="my-auto">A place for friends to share thoughts on books</h3>
    </nav>
    <div class="container w-50 mt-3">
        <div class="card shadow-lg">
            <div class="card-header">
                <nav class="nav justify-content-between">
                    <h1>Add a Book to your Shelf!</h1>
                    <a class="unstyle my-auto" href="/books">Back to the shelves</a>
                </nav>
            </div>
            <div class="card-body">
                <div class="container">
                    <form:form action="/books/new" method="post" modelAttribute="book">
                        <form:input type="hidden" path="user" value="${user.id}"/>
                        <div class="mb-3">
                            <form:label class="form-label" path="title">Title</form:label>
                            <form:errors path="title"/>
                            <form:input class="form-control" path="title" type="text"/>
                        </div>
                        <div class="mb-3">
                            <form:label class="form-label" path="author">Author</form:label>
                            <form:errors path="author"/>
                            <form:input class="form-control" path="author" type="text"/>
                        </div>
                        <div class="mb-3">
                            <form:label class="form-label" path="thoughts">My thoughts</form:label>
                            <form:errors path="thoughts"/>
                            <form:textarea class="form-control" path="thoughts"/>
                        </div>
                        <div class="text-end">
                            <input class="btn btn-outline-dark shadow mt-2" type="submit" value="SUBMIT">
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>