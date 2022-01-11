<%-- 
    Document   : addBook
    Created on : Jan 11, 2022, 6:36:52 PM
    Author     : user
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Добавление книги</title>
    </head>
    <body>
        <h1>Новая книга</h1>
        <h3>${infoText}</h3>
        <form action="createBook" method="POST">
            Название книги: <input type="text" size="40" name="bookName"><br>
            Авторы: <select name="authors" multiple="true">
                <c:forEach var="author" items="${listAuthors}">
                    <option value="${author.id}">${author.firstname} ${author.lastname}</option>
                </c:forEach>
            </select><br>
            Количество: <input type="text" size="40" name="quantity"><br>
            Год издания: <input type="text" size="40" name="releaseYear"><br>
            <input type="submit" name="Добавить"><br>
        </form>
    </body>
</html>
