<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="w-100">
    <h2 class="w-100 my-5 d-flex justify-content-center">Новая книга</h2>        
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-6">
                <form action="createBook" method="POST">
                    <div class="form-group">
                        <div class="form-floating mb-3 ">
                          <input type="text" class="form-control col-4" id="bookName" name="bookName" placeholder="Название книги">
                          <label for="bookName">Название книги</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="authors">Авторы</label>
                        <select multiple="" name="authors" class="form-select" id="authors">
                          <c:forEach var="author" items="${listAuthors}">
                            <option value="${author.id}">${author.firstname} ${author.lastname}</option>
                        </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <div class="form-floating my-3">
                          <input type="text" class="form-control" id="quantity" name="quantity" placeholder="Количество">
                          <label for="quantity">Количество</label>
                        </div>
                    </div>    
                    <div class="form-group">
                        <div class="form-floating mb-3">
                          <input type="text" class="form-control" id="publishedYear" name="publishedYear" placeholder="Год издания">
                          <label for="publishedYear">Год издания</label>
                        </div>
                    </div>    

                    <input type="submit" class="btn btn-primary" name="Добавить"><br>
                </form>
            </div>
        </div>
    </div>
</div>
   