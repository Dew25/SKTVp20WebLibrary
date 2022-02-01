
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="w-100">
    <form action="createHistory" method="POST">
        <p class="w-100 my-5 d-flex justify-content-center">Список книг</p><br>
        <div class="w-100 d-flex justify-content-center ">
            <div class="form-group">
                <label for="books">Книги</label>
                <select multiple="" name="books" class="form-select" id="books">
                  <c:forEach var="book" items="${books}">
                    <option value="${book.id}">${book.bookName}. ${book.publishedYear}.
                        <c:forEach var="author" items="${book.authors}">
                          ${author.firstname}  ${author.lastname}.
                        </c:forEach>
                    </option>
                </c:forEach>
                </select>
            </div>
        </div>
        <p class="w-100 my-5 d-flex justify-content-center">Список читателей</p><br>
        <div class="w-100 d-flex justify-content-center ">
            <div class="form-group">
                <select name="readerId" class="form-select" id="books">
                  <c:forEach var="reader" items="${readers}">
                    <option value="${reader.id}">${reader.firstname} ${reader.lastname}</option>
                </c:forEach>
                </select>
            </div>
        </div>
        <input type="submit" class="btn btn-primary" name="Взять книги для чтения"><br>
    </form>
</div>