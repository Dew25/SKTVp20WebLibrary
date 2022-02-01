
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="w-100">
    <p class="w-100 my-5 d-flex justify-content-center">Список книг</p><br>
    <div class="w-100 d-flex justify-content-center">
        <c:forEach var="book" items="${books}">
            <div class="card border-primary m-3" style="max-width: 20rem;">
                <div class="card-header">${book.bookName}</div>
                <div class="card-body">
                  <h4 class="card-title">Авторы: 
                      <c:forEach var="author" items="${book.authors}">
                          ${author.firstname}  ${author.lastname}.
                      </c:forEach>
                  </h4>
                  <p class="card-text">${book.publishedYear}</p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>