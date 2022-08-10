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
    <nav class="nav justify-content-around px-3 bg-nav text-light shadow-lg">
        <h1>Book Club</h1>
        <h3 class="my-auto">A place for friends to share thoughts on books</h3>
    </nav>
    <div class="container">
        <div class="container">
            <div class="row gap-3 mt-3">
                <div class="col border-dark border p-3 border-2 rounded-3 shadow-lg">
                    <h3>Register</h3>
                    <form:form action="/login/register" method="post" modelAttribute="newUser">
                        <div class="mb-3">
                            <form:label class="form-label" path="name">User Name</form:label>
                            <form:errors path="name"/>
                            <form:input class="form-control" type="text" path="name"/>
                        </div>
                        <div class="mb-3">
                            <form:label class="form-label" path="email">Email</form:label>
                            <form:errors path="email"/>
                            <form:input class="form-control" type="text" path="email"/>
                        </div>
                        <div class="mb-3">
                            <form:label class="form-label" path="password">Password</form:label>
                            <form:errors path="password"/>
                            <form:input class="form-control" type="password" path="password"/>
                        </div>
                        <div class="mb-3">
                            <form:label class="form-label" path="confirm">Confirm Password</form:label>
                            <form:errors path="confirm"/>
                            <form:input class="form-control" type="password" path="confirm"/>
                        </div>
                        <input class="btn btn-outline-dark shadow"  type="submit" value="SUBMIT">
                    </form:form>
                </div>
                <div class="col border-dark border p-3 border-2 rounded-3 shadow-lg">
                    <h3>Login</h3>
                    <form:form action="/login" method="post" modelAttribute="loginUser">
                        <div class="mb-3">
                            <form:label class="form-label" path="email">Email</form:label>
                            <form:errors path="email"/>
                            <form:input class="form-control" type="text" path="email"/>
                        </div>
                        <div class="mb-3">
                            <form:label class="form-label" path="password">Password</form:label>
                            <form:errors path="password"/>
                            <form:input class="form-control" type="password" path="password"/>
                        </div>
                        <input class="btn btn-outline-dark shadow" type="submit" value="SUBMIT">
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>